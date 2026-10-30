# Copyright (c) 2026, Frappe Technologies Pvt. Ltd. and contributors
# For license information, please see license.txt

import frappe
from frappe.utils import get_datetime, now_datetime


@frappe.whitelist()
def get_deadline_metrics():
	"""Computes real-time KPI metrics for the Deadlines module dashboard."""
	# 1. Total counts by status
	status_counts = frappe.db.count("CRM Deadline", filters={"status": "Active"})
	breached_counts = frappe.db.count("CRM Deadline", filters={"status": "Breached"})
	fulfilled_counts = frappe.db.count("CRM Deadline", filters={"status": "Fulfilled"})

	# 2. Stage-specific breakdown
	coord_active = frappe.db.count("CRM Deadline", filters={"stage": "Coordinator Triage", "status": "Active"})
	coord_breached = frappe.db.count("CRM Deadline", filters={"stage": "Coordinator Triage", "status": "Breached"})
	coord_fulfilled = frappe.db.count("CRM Deadline", filters={"stage": "Coordinator Triage", "status": "Fulfilled"})

	rep_active = frappe.db.count("CRM Deadline", filters={"stage": "Sales Rep Follow-up", "status": "Active"})
	rep_breached = frappe.db.count("CRM Deadline", filters={"stage": "Sales Rep Follow-up", "status": "Breached"})
	rep_fulfilled = frappe.db.count("CRM Deadline", filters={"stage": "Sales Rep Follow-up", "status": "Fulfilled"})

	# 3. Compliance rate: Fulfilled / (Fulfilled + Breached) * 100
	total_resolved = fulfilled_counts + breached_counts
	compliance_rate = round((fulfilled_counts / total_resolved) * 100.0, 1) if total_resolved > 0 else 100.0

	# 4. Average response times
	coord_avg = frappe.db.sql(
		"""SELECT AVG(time_taken_mins) FROM `tabCRM Deadline`
		WHERE stage = 'Coordinator Triage' AND status IN ('Fulfilled', 'Breached') AND time_taken_mins > 0"""
	)[0][0]

	rep_avg = frappe.db.sql(
		"""SELECT AVG(time_taken_mins) FROM `tabCRM Deadline`
		WHERE stage = 'Sales Rep Follow-up' AND status IN ('Fulfilled', 'Breached') AND time_taken_mins > 0"""
	)[0][0]

	coord_avg_mins = round(float(coord_avg), 1) if coord_avg else 0
	rep_avg_hours = round(float(rep_avg) / 60.0, 1) if rep_avg else 0

	return {
		"active_count": status_counts,
		"breached_count": breached_counts,
		"fulfilled_count": fulfilled_counts,
		"coordinator_active": coord_active,
		"coordinator_breached": coord_breached,
		"coordinator_fulfilled": coord_fulfilled,
		"coordinator_avg_mins": coord_avg_mins,
		"sales_rep_active": rep_active,
		"sales_rep_breached": rep_breached,
		"sales_rep_fulfilled": rep_fulfilled,
		"sales_rep_avg_hours": rep_avg_hours,
		"compliance_rate": compliance_rate,
	}

