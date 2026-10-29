# Copyright (c) 2026, Frappe Technologies and contributors
# For license information, please see license.txt

import urllib.parse
import frappe
from frappe import _
from frappe.model.document import Document
from frappe.utils import now_datetime, get_url


class CRMDealer(Document):
	def validate(self):
		if self.dealer_name:
			self.dealer_name = self.dealer_name.strip()
		if self.mobile_no:
			# Remove spaces, dashes, parentheses
			clean = "".join(c for c in str(self.mobile_no) if c.isdigit() or c == "+")
			self.mobile_no = clean

	@staticmethod
	def default_list_data():
		columns = [
			{
				"label": "Dealer Name",
				"type": "Data",
				"key": "dealer_name",
				"width": "16rem",
			},
			{
				"label": "Contact Person",
				"type": "Data",
				"key": "contact_person",
				"width": "12rem",
			},
			{
				"label": "Mobile No.",
				"type": "Data",
				"key": "mobile_no",
				"width": "10rem",
			},
			{
				"label": "City",
				"type": "Data",
				"key": "city",
				"width": "10rem",
			},
			{
				"label": "State",
				"type": "Data",
				"key": "state",
				"width": "10rem",
			},
			{
				"label": "Dealer Tier",
				"type": "Select",
				"key": "tier",
				"width": "12rem",
			},
			{
				"label": "Status",
				"type": "Select",
				"key": "status",
				"width": "8rem",
			},
			{
				"label": "Last Modified",
				"type": "Datetime",
				"key": "modified",
				"width": "8rem",
			},
		]
		rows = [
			"name",
			"dealer_name",
			"contact_person",
			"mobile_no",
			"email",
			"city",
			"state",
			"territory",
			"tier",
			"status",
			"sports_specialization",
			"modified",
		]
		return {
			"columns": columns,
			"rows": rows,
		}


@frappe.whitelist()
def assign_dealer_to_lead(lead_name: str, dealer_name: str, notes: str = None) -> dict:
	"""Assign a CRM Dealer to a Lead, updating timestamps, status, and timeline."""
	if not frappe.has_permission("CRM Lead", "write", doc=lead_name):
		frappe.throw(_("Not permitted to update Lead {0}").format(lead_name), frappe.PermissionError)

	if not frappe.db.exists("CRM Dealer", dealer_name):
		frappe.throw(_("Dealer {0} does not exist").format(dealer_name))

	lead = frappe.get_doc("CRM Lead", lead_name)
	dealer = frappe.get_doc("CRM Dealer", dealer_name)

	lead.dealer = dealer_name
	lead.dealer_assigned_date = now_datetime()
	lead.dealer_assigned_by = frappe.session.user
	if not lead.dealer_feedback_status:
		lead.dealer_feedback_status = "Pending Contact"

	if notes:
		if lead.dealer_notes:
			lead.dealer_notes = f"{lead.dealer_notes}\n{notes}".strip()
		else:
			lead.dealer_notes = notes.strip()

	# Automatically advance status to 'Assigned to Dealer' if it exists and current status is New/Contacted
	if frappe.db.exists("CRM Lead Status", "Assigned to Dealer"):
		if lead.status in ["New", "Contacted", None, ""]:
			lead.status = "Assigned to Dealer"

	lead.flags.ignore_permissions = True
	lead.save()

	# Add activity timeline comment
	comment_msg = _("Assigned to Dealer: <b>{0}</b> (Contact: {1}, Mobile: {2})").format(
		dealer.dealer_name, dealer.contact_person or "-", dealer.mobile_no or "-"
	)
	if notes:
		comment_msg += f"<br><i>Notes: {notes}</i>"
	lead.add_comment("Comment", comment_msg)

	return {
		"name": lead.name,
		"dealer": lead.dealer,
		"dealer_assigned_date": str(lead.dealer_assigned_date),
		"dealer_assigned_by": lead.dealer_assigned_by,
		"dealer_feedback_status": lead.dealer_feedback_status,
		"dealer_notes": lead.dealer_notes,
		"status": lead.status,
	}


@frappe.whitelist()
def get_dealer_brief(lead_name: str) -> dict:
	"""Generate a pre-formatted WhatsApp brief and message summary for the assigned dealer."""
	if not frappe.has_permission("CRM Lead", "read", doc=lead_name):
		frappe.throw(_("Not permitted to view Lead {0}").format(lead_name), frappe.PermissionError)

	lead = frappe.get_doc("CRM Lead", lead_name)
	if not lead.dealer:
		frappe.throw(_("No Dealer has been assigned to this Lead yet."))

	dealer = frappe.get_doc("CRM Dealer", lead.dealer)

	# Build brief summary
	client_name = lead.lead_name or f"{lead.first_name or ''} {lead.last_name or ''}".strip() or "Client"
	contact_phone = lead.mobile_no or lead.phone or "Not provided"
	contact_email = lead.email or "Not provided"
	org = getattr(lead, "organization", "") or "Individual"
	city = getattr(lead, "city", "") or getattr(lead, "territory", "") or "Not specified"

	# Project specifics
	court_type = getattr(lead, "custom_project_type", "") or getattr(lead, "custom_setting", "") or "Court Surface"
	court_count = getattr(lead, "custom_court_count", "") or getattr(lead, "custom_lcs_court_count_band", "") or "1"
	area = getattr(lead, "custom_area_m2", "") or getattr(lead, "custom_lcs_area_band", "") or ""
	area_str = f" ({area} sq.m)" if area else ""
	lead_notes = lead.dealer_notes or ""

	# Construct crisp WhatsApp text
	brief_lines = [
		f"*PACECOURT LEAD ASSIGNMENT*",
		f"Dear {dealer.contact_person or dealer.dealer_name},",
		f"",
		f"A new prospective client lead has been assigned to you:",
		f"• *Client*: {client_name}",
		f"• *Organization*: {org}",
		f"• *Phone*: {contact_phone}",
		f"• *Email*: {contact_email}",
		f"• *Location*: {city}",
		f"• *Requirements*: {court_type} - {court_count} court(s){area_str}",
	]

	if lead_notes:
		brief_lines.append(f"• *Remarks*: {lead_notes}")

	brief_lines.extend([
		f"",
		f"Please connect with the client, schedule the site visit, and share updates.",
		f"Thank you,",
		f"Pacecourt Sales Team",
	])

	full_text = "\n".join(brief_lines)

	# Clean dealer mobile number for wa.me link (must have country code or digits)
	raw_phone = dealer.mobile_no or dealer.phone or ""
	clean_phone = "".join(c for c in raw_phone if c.isdigit())
	# If 10 digits (India domestic without country code), prepend 91
	if len(clean_phone) == 10:
		clean_phone = f"91{clean_phone}"

	whatsapp_url = ""
	if clean_phone:
		whatsapp_url = f"https://wa.me/{clean_phone}?text={urllib.parse.quote(full_text)}"

	return {
		"dealer_name": dealer.dealer_name,
		"dealer_contact": dealer.contact_person or "",
		"dealer_mobile": dealer.mobile_no or "",
		"dealer_email": dealer.email or "",
		"brief_text": full_text,
		"whatsapp_url": whatsapp_url,
		"clean_phone": clean_phone,
	}


@frappe.whitelist()
def update_dealer_feedback(
	lead_name: str, feedback_status: str, notes: str = None, new_status: str = None
) -> dict:
	"""Update dealer feedback status and remarks, optionally updating lead status."""
	if not frappe.has_permission("CRM Lead", "write", doc=lead_name):
		frappe.throw(_("Not permitted to update Lead {0}").format(lead_name), frappe.PermissionError)

	lead = frappe.get_doc("CRM Lead", lead_name)
	lead.dealer_feedback_status = feedback_status

	if notes:
		if lead.dealer_notes:
			lead.dealer_notes = f"{lead.dealer_notes}\n[Update]: {notes}".strip()
		else:
			lead.dealer_notes = f"[Update]: {notes}".strip()

	if new_status and frappe.db.exists("CRM Lead Status", new_status):
		lead.status = new_status

	lead.flags.ignore_permissions = True
	lead.save()

	# Add activity comment
	comment_msg = _("Dealer Feedback Updated: <b>{0}</b>").format(feedback_status)
	if notes:
		comment_msg += f"<br><i>{notes}</i>"
	lead.add_comment("Comment", comment_msg)

	return {
		"dealer_feedback_status": lead.dealer_feedback_status,
		"dealer_notes": lead.dealer_notes,
		"status": lead.status,
	}


@frappe.whitelist()
def assign_dealer_to_deal(deal_name: str, dealer_name: str, notes: str = None) -> dict:
	"""Assign a CRM Dealer to a Deal."""
	if not frappe.has_permission("CRM Deal", "write", doc=deal_name):
		frappe.throw(_("Not permitted to update Deal {0}").format(deal_name), frappe.PermissionError)

	if not frappe.db.exists("CRM Dealer", dealer_name):
		frappe.throw(_("Dealer {0} does not exist").format(dealer_name))

	deal = frappe.get_doc("CRM Deal", deal_name)
	dealer = frappe.get_doc("CRM Dealer", dealer_name)

	deal.dealer = dealer_name
	deal.dealer_assigned_date = now_datetime()
	deal.dealer_assigned_by = frappe.session.user
	if not deal.dealer_feedback_status:
		deal.dealer_feedback_status = "Pending Contact"

	if notes:
		if deal.dealer_notes:
			deal.dealer_notes = f"{deal.dealer_notes}\n{notes}".strip()
		else:
			deal.dealer_notes = notes.strip()

	deal.flags.ignore_permissions = True
	deal.save()

	comment_msg = _("Assigned to Dealer: <b>{0}</b> (Contact: {1}, Mobile: {2})").format(
		dealer.dealer_name, dealer.contact_person or "-", dealer.mobile_no or "-"
	)
	deal.add_comment("Comment", comment_msg)

	return {
		"name": deal.name,
		"dealer": deal.dealer,
		"dealer_assigned_date": str(deal.dealer_assigned_date),
		"dealer_assigned_by": deal.dealer_assigned_by,
		"dealer_feedback_status": deal.dealer_feedback_status,
		"dealer_notes": deal.dealer_notes,
	}


@frappe.whitelist()
def get_deal_dealer_brief(deal_name: str) -> dict:
	"""Generate a pre-formatted WhatsApp brief for the assigned dealer on a Deal."""
	if not frappe.has_permission("CRM Deal", "read", doc=deal_name):
		frappe.throw(_("Not permitted to view Deal {0}").format(deal_name), frappe.PermissionError)

	deal = frappe.get_doc("CRM Deal", deal_name)
	if not deal.dealer:
		frappe.throw(_("No Dealer has been assigned to this Deal yet."))

	dealer = frappe.get_doc("CRM Dealer", deal.dealer)

	client_name = deal.lead_name or deal.organization_name or deal.organization or "Client"
	contact_phone = deal.mobile_no or deal.phone or "Not provided"
	contact_email = deal.email or "Not provided"
	org = deal.organization or "Individual"
	city = deal.territory or "Not specified"
	deal_val = f"₹{deal.deal_value:,.2f}" if deal.deal_value else "TBD"

	brief_lines = [
		f"*PACECOURT DEAL ASSIGNMENT*",
		f"Dear {dealer.contact_person or dealer.dealer_name},",
		f"",
		f"A qualified deal has been assigned to you:",
		f"• *Deal*: {deal.name}",
		f"• *Client*: {client_name}",
		f"• *Organization*: {org}",
		f"• *Phone*: {contact_phone}",
		f"• *Email*: {contact_email}",
		f"• *Location*: {city}",
		f"• *Expected Value*: {deal_val}",
	]

	if deal.dealer_notes:
		brief_lines.append(f"• *Remarks*: {deal.dealer_notes}")

	brief_lines.extend([
		f"",
		f"Please connect with the client and share execution updates.",
		f"Thank you,",
		f"Pacecourt Sales Team",
	])

	full_text = "\n".join(brief_lines)

	raw_phone = dealer.mobile_no or dealer.phone or ""
	clean_phone = "".join(c for c in raw_phone if c.isdigit())
	if len(clean_phone) == 10:
		clean_phone = f"91{clean_phone}"

	whatsapp_url = ""
	if clean_phone:
		whatsapp_url = f"https://wa.me/{clean_phone}?text={urllib.parse.quote(full_text)}"

	return {
		"dealer_name": dealer.dealer_name,
		"dealer_contact": dealer.contact_person or "",
		"dealer_mobile": dealer.mobile_no or "",
		"dealer_email": dealer.email or "",
		"brief_text": full_text,
		"whatsapp_url": whatsapp_url,
		"clean_phone": clean_phone,
	}
