"""Add Dealer Handover section to Lead and Deal side panels, and ensure Assigned to Dealer status exists."""

import json
import frappe

DEALER_SECTION_LEAD = {
	"label": "Dealer Handover",
	"name": "dealer_handover_section",
	"opened": True,
	"columns": [
		{
			"name": "column_dealer",
			"fields": [
				"dealer",
				"dealer_assigned_date",
				"dealer_feedback_status",
				"dealer_notes",
			],
		}
	],
}

DEALER_SECTION_DEAL = {
	"label": "Dealer Handover",
	"name": "dealer_handover_section",
	"opened": True,
	"columns": [
		{
			"name": "column_dealer_deal",
			"fields": [
				"dealer",
				"dealer_assigned_date",
				"dealer_feedback_status",
				"dealer_notes",
			],
		}
	],
}


DEALER_QUICK_ENTRY_LAYOUT = '[{"name": "basic_section", "columns": [{"name": "col_1", "fields": ["dealer_name", "contact_person"]}, {"name": "col_2", "fields": ["mobile_no", "email"]}]}, {"name": "location_section", "hideBorder": true, "columns": [{"name": "col_3", "fields": ["territory", "city", "state"]}, {"name": "col_4", "fields": ["tier", "status", "address"]}]}, {"name": "notes_section", "hideBorder": true, "columns": [{"name": "col_5", "fields": ["sports_specialization", "notes"]}]}]'


def execute():
	# 0. Ensure 'CRM Dealer-Quick Entry' layout exists
	if not frappe.db.exists("CRM Fields Layout", "CRM Dealer-Quick Entry"):
		try:
			doc = frappe.new_doc("CRM Fields Layout")
			doc.type = "Quick Entry"
			doc.dt = "CRM Dealer"
			doc.layout = DEALER_QUICK_ENTRY_LAYOUT
			doc.insert(ignore_permissions=True)
		except Exception as e:
			frappe.log_error(f"Failed to create CRM Dealer-Quick Entry: {e}")

	# 1. Ensure 'Assigned to Dealer' status exists in CRM Lead Status
	if not frappe.db.exists("CRM Lead Status", "Assigned to Dealer"):
		try:
			doc = frappe.new_doc("CRM Lead Status")
			doc.lead_status = "Assigned to Dealer"
			doc.type = "Ongoing"
			doc.color = "teal"
			doc.position = 3
			doc.insert(ignore_permissions=True)
		except Exception as e:
			frappe.log_error(f"Failed to create Lead Status 'Assigned to Dealer': {e}")

	# 2. Update CRM Lead-Side Panel layout
	if frappe.db.exists("CRM Fields Layout", "CRM Lead-Side Panel"):
		try:
			layout_doc = frappe.get_doc("CRM Fields Layout", "CRM Lead-Side Panel")
			data = json.loads(layout_doc.layout or "[]")
			existing_names = {s.get("name") for s in data if isinstance(s, dict)}
			if "dealer_handover_section" not in existing_names:
				data.append(DEALER_SECTION_LEAD)
				layout_doc.layout = json.dumps(data)
				layout_doc.save(ignore_permissions=True)
		except Exception as e:
			frappe.log_error(f"Failed to update CRM Lead-Side Panel: {e}")

	# 3. Update CRM Deal-Side Panel layout
	if frappe.db.exists("CRM Fields Layout", "CRM Deal-Side Panel"):
		try:
			layout_doc = frappe.get_doc("CRM Fields Layout", "CRM Deal-Side Panel")
			data = json.loads(layout_doc.layout or "[]")
			existing_names = {s.get("name") for s in data if isinstance(s, dict)}
			if "dealer_handover_section" not in existing_names:
				data.append(DEALER_SECTION_DEAL)
				layout_doc.layout = json.dumps(data)
				layout_doc.save(ignore_permissions=True)
		except Exception as e:
			frappe.log_error(f"Failed to update CRM Deal-Side Panel: {e}")

	# 4. Seed sample dealers if none exist
	if frappe.db.count("CRM Dealer") == 0:
		sample_dealers = [
			{
				"dealer_name": "Apex Sports Infrastructure",
				"contact_person": "Rajesh Sharma",
				"mobile_no": "9810123456",
				"email": "rajesh@apexsports.in",
				"city": "Noida",
				"state": "Uttar Pradesh",
				"tier": "Authorized Applicator",
				"status": "Active",
				"sports_specialization": "Acrylic Tennis, Pickleball & Basketball Courts",
			},
			{
				"dealer_name": "Olympus Courts & Surfaces",
				"contact_person": "Vikram Patel",
				"mobile_no": "9820123456",
				"email": "vikram@olympuscourts.com",
				"city": "Mumbai",
				"state": "Maharashtra",
				"tier": "Direct Dealer",
				"status": "Active",
				"sports_specialization": "Outdoor Acrylic & PU Flooring",
			},
			{
				"dealer_name": "Southern Sportech Solutions",
				"contact_person": "Karthik Raja",
				"mobile_no": "9840123456",
				"email": "karthik@southernsportech.com",
				"city": "Bengaluru",
				"state": "Karnataka",
				"tier": "Authorized Applicator",
				"status": "Active",
				"sports_specialization": "Badminton, Tennis & Synthetic Turf",
			},
		]
		for d in sample_dealers:
			try:
				doc = frappe.get_doc({"doctype": "CRM Dealer", **d})
				doc.insert(ignore_permissions=True)
			except Exception as e:
				frappe.log_error(f"Failed to seed dealer {d['dealer_name']}: {e}")

