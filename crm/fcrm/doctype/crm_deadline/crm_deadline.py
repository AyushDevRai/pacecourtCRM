# Copyright (c) 2026, Frappe Technologies Pvt. Ltd. and contributors
# For license information, please see license.txt

import frappe
from frappe.model.document import Document
from frappe.utils import get_datetime, now_datetime, time_diff_in_seconds


class CRMDeadline(Document):
	@staticmethod
	def default_list_data():
		columns = [
			{
				"label": "Lead Name",
				"type": "Data",
				"key": "lead_name",
				"width": "15rem",
			},
			{
				"label": "Tier",
				"type": "Data",
				"key": "tier",
				"width": "6rem",
			},
			{
				"label": "Stage",
				"type": "Select",
				"key": "stage",
				"width": "12rem",
			},
			{
				"label": "Assigned To",
				"type": "Link",
				"key": "assigned_to",
				"width": "12rem",
			},
			{
				"label": "Allotted",
				"type": "Float",
				"key": "allotted_hours",
				"width": "7rem",
			},
			{
				"label": "Deadline",
				"type": "Datetime",
				"key": "deadline_at",
				"width": "11rem",
			},
			{
				"label": "Status",
				"type": "Select",
				"key": "status",
				"width": "8rem",
			},
			{
				"label": "Time Taken",
				"type": "Int",
				"key": "time_taken_mins",
				"width": "8rem",
			},
		]
		rows = [
			"name",
			"lead",
			"lead_name",
			"tier",
			"stage",
			"assigned_to",
			"allotted_hours",
			"started_at",
			"deadline_at",
			"completed_at",
			"status",
			"time_taken_mins",
			"breach_mins",
			"call_log",
			"modified",
		]
		return {
			"columns": columns,
			"rows": rows,
		}

	def validate(self):
		if not self.started_at:
			self.started_at = now_datetime()

		if self.completed_at:
			completed = get_datetime(self.completed_at)
			started = get_datetime(self.started_at)
			deadline = get_datetime(self.deadline_at)

			self.time_taken_mins = max(0, int(round(time_diff_in_seconds(completed, started) / 60.0)))
			if completed > deadline:
				self.status = "Breached"
				self.breach_mins = max(0, int(round(time_diff_in_seconds(completed, deadline) / 60.0)))
			else:
				self.status = "Fulfilled"
				self.breach_mins = 0

	def mark_fulfilled(self, call_log=None):
		self.completed_at = now_datetime()
		if call_log:
			self.call_log = call_log
		self.save(ignore_permissions=True)

	def mark_breached(self):
		now = now_datetime()
		deadline = get_datetime(self.deadline_at)
		self.status = "Breached"
		self.breach_mins = max(0, int(round(time_diff_in_seconds(now, deadline) / 60.0)))
		self.save(ignore_permissions=True)

	def mark_cancelled(self, reason=None):
		self.status = "Cancelled"
		if reason:
			self.notes = f"{self.notes or ''}\nCancelled: {reason}".strip()
		self.save(ignore_permissions=True)

	def on_trash(self):
		if self.lead:
			active = frappe.db.get_value("CRM Lead", self.lead, "custom_active_deadline")
			if active == self.name:
				frappe.db.set_value("CRM Lead", self.lead, "custom_active_deadline", None, update_modified=False)

