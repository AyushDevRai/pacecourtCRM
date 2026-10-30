# Copyright (c) 2026, Frappe Technologies Pvt. Ltd. and contributors
# For license information, please see license.txt

import frappe
from frappe.custom.doctype.custom_field.custom_field import create_custom_fields


def execute():
	custom_fields = {
		"CRM Lead": [
			{
				"fieldname": "custom_coordinator_deadline",
				"fieldtype": "Datetime",
				"label": "Coordinator Deadline",
				"insert_after": "custom_sla_due_date",
				"read_only": 1,
			},
			{
				"fieldname": "custom_coordinator_sla_status",
				"fieldtype": "Select",
				"label": "Coordinator SLA Status",
				"options": "\nActive\nFulfilled\nBreached",
				"insert_after": "custom_coordinator_deadline",
				"read_only": 1,
			},
			{
				"fieldname": "custom_active_deadline",
				"fieldtype": "Link",
				"options": "CRM Deadline",
				"label": "Active Deadline",
				"insert_after": "custom_coordinator_sla_status",
				"read_only": 1,
			},
		]
	}
	create_custom_fields(custom_fields, ignore_validate=True)

