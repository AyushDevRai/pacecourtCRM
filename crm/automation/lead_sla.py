# Copyright (c) 2026, Frappe Technologies Pvt. Ltd. and contributors
# For license information, please see license.txt

import frappe
from frappe.utils import add_to_date, cint, get_datetime, now_datetime, time_diff_in_seconds

COMPLETED_LEAD_STATUSES = ("Contacted", "Replied", "Qualified", "Converted", "Lost", "Do Not Contact")
OPEN_TASK_STATUSES = ("Todo", "Backlog", "In Progress")

COORDINATOR_TIER_SLA_HOURS = {
	"A1": 1.0,
	"A2": 2.0,
	"B1": 2.0,
	"B2": 4.0,
	"C1": 8.0,
	"C2": 8.0,
	"C3": 24.0,
}
DEFAULT_COORDINATOR_SLA_HOURS = 2.0

SALES_REP_TIER_SLA_HOURS = {
	"A1": 4.0,
	"A2": 24.0,
	"B1": 24.0,
	"B2": 48.0,
	"C1": 48.0,
	"C2": 48.0,
	"C3": 72.0,
}
DEFAULT_SALES_REP_SLA_HOURS = 24.0


def recalculate_matrix_tier(fit_score, intent_score):
	"""Standard 3x3 matrix tier from numeric fit & intent."""
	fit_row = "A" if fit_score >= 35 else ("B" if fit_score >= 25 else "C")
	intent_col = "1" if intent_score >= 35 else ("2" if intent_score >= 20 else "3")
	return f"{fit_row}{intent_col}"


def on_lead_update(doc, method=None):
	"""Triggered when a CRM Lead is saved or updated.
	1. Enforces Intent Score permissions & tier recalculations.
	2. Initiates Stage 1 (Coordinator Triage) deadline immediately upon arrival.
	3. Initiates Stage 2 (Sales Rep Follow-up) deadline when lead_owner is assigned.
	4. Fulfills active deadlines if lead is moved to a completed status.
	"""
	if frappe.flags.in_install or frappe.flags.in_migrate:
		return

	# 1. Enforce permission: Intent Score is editable by Administrator only
	if doc.get_doc_before_save() and doc.has_value_changed("custom_intent_score"):
		is_admin = frappe.session.user == "Administrator" or "System Manager" in frappe.get_roles()
		if not is_admin:
			frappe.throw("Only Administrator can edit Intent Score.")

		current_tier = doc.get("custom_lead_tier")
		if current_tier in ("A1", "A2", "A3", "B1", "B2", "B3", "C1", "C2", "C3") or not current_tier:
			fit = cint(doc.get("custom_fit_score") or 0)
			intent = cint(doc.get("custom_intent_score") or 0)
			new_tier = recalculate_matrix_tier(fit, intent)
			if new_tier != current_tier:
				doc.custom_lead_tier = new_tier
				doc.custom_is_mql = 1 if new_tier in ("A1", "A2", "B1", "B2") else 0
				frappe.db.set_value(
					"CRM Lead",
					doc.name,
					{
						"custom_lead_tier": new_tier,
						"custom_is_mql": doc.custom_is_mql,
					},
					update_modified=False,
				)

	# 2. Handle overall completion if lead was moved to Contacted/Qualified/Converted/etc.
	if doc.status in COMPLETED_LEAD_STATUSES and doc.has_value_changed("status"):
		_complete_all_sla_for_lead(doc.name)
		return

	tier = doc.get("custom_lead_tier")
	now = now_datetime()

	# 3. STAGE 1: CRM Coordinator Triage Deadline
	# Ensure every incoming lead has an active coordinator deadline until first contact or assignment
	active_coord_deadline = frappe.db.get_value(
		"CRM Deadline",
		{"lead": doc.name, "stage": "Coordinator Triage", "status": "Active"},
		"name",
	)

	has_completed_coord_deadline = frappe.db.exists(
		"CRM Deadline",
		{"lead": doc.name, "stage": "Coordinator Triage", "status": ("in", ["Fulfilled", "Breached"])},
	)

	lead_owner = doc.get("lead_owner")

	if not active_coord_deadline and not has_completed_coord_deadline and not lead_owner and doc.status not in COMPLETED_LEAD_STATUSES:
		coord_hours = COORDINATOR_TIER_SLA_HOURS.get(tier, DEFAULT_COORDINATOR_SLA_HOURS)
		coord_deadline_at = add_to_date(now, hours=coord_hours)

		coord_deadline = frappe.get_doc({
			"doctype": "CRM Deadline",
			"lead": doc.name,
			"lead_name": doc.get("lead_name") or doc.name,
			"tier": tier or "Unassigned",
			"stage": "Coordinator Triage",
			"assigned_to": doc.get("assigned_to") or "Administrator",
			"allotted_hours": coord_hours,
			"started_at": now,
			"deadline_at": coord_deadline_at,
			"status": "Active",
		})
		coord_deadline.insert(ignore_permissions=True)

		frappe.db.set_value(
			"CRM Lead",
			doc.name,
			{
				"custom_coordinator_deadline": coord_deadline_at,
				"custom_coordinator_sla_status": "Active",
				"custom_active_deadline": coord_deadline.name,
			},
			update_modified=False,
		)
		doc.custom_coordinator_deadline = coord_deadline_at
		doc.custom_coordinator_sla_status = "Active"
		doc.custom_active_deadline = coord_deadline.name

	# 4. STAGE 2: Sales Representative Follow-up Deadline
	# Once a sales rep is assigned (lead_owner), close Coordinator stage and start Rep stage
	if lead_owner and doc.status not in COMPLETED_LEAD_STATUSES:
		# If Coordinator deadline was still active, close it as fulfilled on handover
		if active_coord_deadline:
			coord_doc = frappe.get_doc("CRM Deadline", active_coord_deadline)
			coord_doc.completed_at = now
			coord_doc.save(ignore_permissions=True)
			frappe.db.set_value(
				"CRM Lead",
				doc.name,
				{"custom_coordinator_sla_status": coord_doc.status},
				update_modified=False,
			)

		# Check for existing Sales Rep deadline
		active_rep_deadline = frappe.db.get_value(
			"CRM Deadline",
			{"lead": doc.name, "stage": "Sales Rep Follow-up", "status": "Active"},
			"name",
		)

		rep_sla_hours = cint(doc.get("custom_sla_hours") or 0)
		if rep_sla_hours <= 0:
			rep_sla_hours = int(SALES_REP_TIER_SLA_HOURS.get(tier, DEFAULT_SALES_REP_SLA_HOURS))
			frappe.db.set_value("CRM Lead", doc.name, "custom_sla_hours", rep_sla_hours, update_modified=False)
			doc.custom_sla_hours = rep_sla_hours

		if not active_rep_deadline:
			rep_deadline_at = add_to_date(now, hours=rep_sla_hours)

			rep_deadline = frappe.get_doc({
				"doctype": "CRM Deadline",
				"lead": doc.name,
				"lead_name": doc.get("lead_name") or doc.name,
				"tier": tier or "MQL",
				"stage": "Sales Rep Follow-up",
				"assigned_to": lead_owner,
				"allotted_hours": rep_sla_hours,
				"started_at": now,
				"deadline_at": rep_deadline_at,
				"status": "Active",
			})
			rep_deadline.insert(ignore_permissions=True)

			# Update Lead SLA status fields
			frappe.db.set_value(
				"CRM Lead",
				doc.name,
				{
					"response_by": rep_deadline_at,
					"sla_status": "First Response Due",
					"custom_sla_due_date": rep_deadline_at,
					"custom_active_deadline": rep_deadline.name,
					"communication_status": doc.get("communication_status") or "Open",
				},
				update_modified=False,
			)
			doc.response_by = rep_deadline_at
			doc.sla_status = "First Response Due"
			doc.custom_sla_due_date = rep_deadline_at
			doc.custom_active_deadline = rep_deadline.name

			# Create Call Lead task assigned to the salesman
			lead_label = doc.get("lead_name") or doc.name
			priority = "High" if tier == "A1" else "Medium"
			playbook = doc.get("custom_playbook") or ""

			task = frappe.get_doc({
				"doctype": "CRM Task",
				"title": f"Call Lead: {lead_label} ({tier or 'MQL'} · {rep_sla_hours}h SLA)",
				"assigned_to": lead_owner,
				"due_date": rep_deadline_at,
				"priority": priority,
				"status": "Todo",
				"reference_doctype": "CRM Lead",
				"reference_docname": doc.name,
				"description": (
					f"<p>LCS classified lead as <strong>{tier or 'MQL'}</strong>.</p>"
					f"<p><strong>Playbook:</strong> {playbook}</p>"
					f"<p><strong>Target SLA:</strong> Call within {rep_sla_hours} hours (Deadline: {rep_deadline_at}).</p>"
				),
				"custom_is_sla_task": 1,
				"custom_sla_hours": rep_sla_hours,
				"custom_reminder_sent": 0,
				"custom_warning_sent": 0,
			})
			task.insert(ignore_permissions=True)

			# Real-time assignment alert to salesman
			_send_notification(
				to_user=lead_owner,
				message=f"New {tier or 'MQL'} Lead Assigned: {lead_label}. Call deadline: {rep_sla_hours}h (by {rep_deadline_at.strftime('%H:%M %d-%b')}).",
				reference_doctype="CRM Task",
				reference_name=task.name,
			)
		else:
			# If salesman changed, update assignee on the deadline and task
			rep_doc = frappe.get_doc("CRM Deadline", active_rep_deadline)
			if rep_doc.assigned_to != lead_owner:
				rep_doc.assigned_to = lead_owner
				rep_doc.save(ignore_permissions=True)

			open_tasks = frappe.get_all(
				"CRM Task",
				filters={
					"reference_doctype": "CRM Lead",
					"reference_docname": doc.name,
					"custom_is_sla_task": 1,
					"status": ("in", OPEN_TASK_STATUSES),
				},
				pluck="name",
			)
			for t_name in open_tasks:
				frappe.db.set_value("CRM Task", t_name, "assigned_to", lead_owner)


def on_call_log_insert(doc, method=None):
	"""When a call log is recorded against a CRM Lead, fulfill the active deadline and complete the task."""
	if doc.reference_doctype == "CRM Lead" and doc.reference_docname:
		_complete_all_sla_for_lead(doc.reference_docname, call_log_name=doc.name)


def _complete_all_sla_for_lead(lead_name, call_log_name=None):
	"""Marks all active CRM Deadline records and tasks fulfilled for this lead."""
	now = now_datetime()

	# 1. Complete active CRM Deadline records
	active_deadlines = frappe.get_all(
		"CRM Deadline",
		filters={"lead": lead_name, "status": "Active"},
		pluck="name",
	)
	for d_name in active_deadlines:
		d_doc = frappe.get_doc("CRM Deadline", d_name)
		d_doc.completed_at = now
		if call_log_name:
			d_doc.call_log = call_log_name
		d_doc.save(ignore_permissions=True)

	# 2. Mark open SLA tasks Done
	open_tasks = frappe.get_all(
		"CRM Task",
		filters={
			"reference_doctype": "CRM Lead",
			"reference_docname": lead_name,
			"custom_is_sla_task": 1,
			"status": ("in", OPEN_TASK_STATUSES),
		},
		pluck="name",
	)
	for t_name in open_tasks:
		frappe.db.set_value("CRM Task", t_name, "status", "Done")

	# 3. Update lead SLA status fields
	frappe.db.set_value(
		"CRM Lead",
		lead_name,
		{
			"sla_status": "Fulfilled",
			"custom_coordinator_sla_status": "Fulfilled",
			"first_responded_on": now,
		},
		update_modified=False,
	)


def check_sla_deadlines_and_reminders():
	"""Scheduled cron (runs every 5 mins):
	1. Audits all active CRM Deadline records.
	2. Sends 1h prior reminder to assignee.
	3. When deadline is breached, updates status to 'Breached', computes breach minutes, and escalates to managers.
	"""
	active_deadlines = frappe.get_all(
		"CRM Deadline",
		filters={"status": "Active"},
		fields=["name", "lead", "lead_name", "stage", "assigned_to", "deadline_at", "allotted_hours", "reminder_sent", "warning_sent"],
	)

	now = now_datetime()
	for d in active_deadlines:
		if not d.deadline_at or not d.assigned_to:
			continue

		due_datetime = get_datetime(d.deadline_at)
		diff_seconds = time_diff_in_seconds(due_datetime, now)
		lead_name = d.lead_name or d.lead

		# 1-Hour Reminder
		if 0 < diff_seconds <= 3600 and not d.reminder_sent:
			mins_left = max(1, int(round(diff_seconds / 60.0)))
			_send_notification(
				to_user=d.assigned_to,
				message=f"⏰ REMINDER: {mins_left}m left on {d.stage} for lead {lead_name}! Deadline: {due_datetime.strftime('%H:%M %d-%b')}.",
				reference_doctype="CRM Deadline",
				reference_name=d.name,
			)
			frappe.db.set_value("CRM Deadline", d.name, "reminder_sent", 1, update_modified=False)

		# SLA Breach (overdue)
		elif diff_seconds <= 0 and not d.warning_sent:
			breach_mins = max(1, int(round(abs(diff_seconds) / 60.0)))
			d_doc = frappe.get_doc("CRM Deadline", d.name)
			d_doc.mark_breached()
			frappe.db.set_value("CRM Deadline", d.name, "warning_sent", 1, update_modified=False)

			# Send warning to assignee
			_send_notification(
				to_user=d.assigned_to,
				message=f"⚠️ SLA BREACHED! {d.stage} deadline ({d.allotted_hours}h) for lead {lead_name} has expired by {breach_mins} mins!",
				reference_doctype="CRM Deadline",
				reference_name=d.name,
			)

			# Escalate to System Managers / Sales Managers
			managers = frappe.get_all(
				"Has Role",
				filters={"role": ("in", ["System Manager", "Sales Manager"]), "parenttype": "User"},
				pluck="parent",
			)
			for mgr in set(managers):
				if mgr != d.assigned_to:
					_send_notification(
						to_user=mgr,
						message=f"⚠️ SLA BREACH ESCALATION: {d.assigned_to} breached {d.stage} deadline ({d.allotted_hours}h) on lead {lead_name}.",
						reference_doctype="CRM Deadline",
						reference_name=d.name,
					)

			# Update Lead record status
			if d.stage == "Coordinator Triage":
				frappe.db.set_value("CRM Lead", d.lead, "custom_coordinator_sla_status", "Breached", update_modified=False)
			else:
				frappe.db.set_value("CRM Lead", d.lead, "sla_status", "Failed", update_modified=False)


check_active_deadlines = check_sla_deadlines_and_reminders


def _send_notification(to_user, message, reference_doctype="CRM Deadline", reference_name=None):
	"""Creates a CRM Notification and triggers real-time WebSocket push."""
	if not to_user:
		return
	try:
		notif = frappe.get_doc({
			"doctype": "CRM Notification",
			"to_user": to_user,
			"from_user": "Administrator",
			"type": "Task",
			"message": message,
			"notification_text": message,
			"reference_doctype": reference_doctype,
			"reference_name": reference_name,
		})
		notif.insert(ignore_permissions=True)
		frappe.publish_realtime("crm_notification", user=to_user)
	except Exception as e:
		frappe.logger().error(f"Failed to send deadline notification: {e}")
