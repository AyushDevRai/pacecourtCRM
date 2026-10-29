# Copyright (c) 2026, PACE Court and contributors
# For license information, please see license.txt

import frappe
from frappe import _
from frappe.model.document import Document
from frappe.utils import flt, get_datetime, getdate, money_in_words, nowdate


class CRMQuotation(Document):
	@staticmethod
	def default_list_data():
		columns = [
			{
				"label": "Quotation ID",
				"type": "Data",
				"key": "name",
				"width": "11rem",
			},
			{
				"label": "Title",
				"type": "Data",
				"key": "title",
				"width": "14rem",
			},
			{
				"label": "Deal",
				"type": "Link",
				"options": "CRM Deal",
				"key": "deal",
				"width": "11rem",
			},
			{
				"label": "Status",
				"type": "Select",
				"key": "status",
				"width": "9rem",
			},
			{
				"label": "Grand Total",
				"type": "Currency",
				"key": "grand_total",
				"width": "10rem",
				"align": "right",
			},
			{
				"label": "Quotation Date",
				"type": "Date",
				"key": "quotation_date",
				"width": "9rem",
			},
			{
				"label": "Valid Till",
				"type": "Date",
				"key": "valid_till",
				"width": "9rem",
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
			"title",
			"deal",
			"organization",
			"contact",
			"status",
			"currency",
			"grand_total",
			"quotation_date",
			"valid_till",
			"modified",
		]
		return {
			"columns": columns,
			"rows": rows,
		}

	def validate(self):
		self.validate_dates()
		self.sync_addresses()
		self.calculate_totals()

	def validate_dates(self):
		if not self.quotation_date:
			self.quotation_date = nowdate()
		if not self.valid_till:
			self.valid_till = frappe.utils.add_days(self.quotation_date, 30)
		elif getdate(self.valid_till) < getdate(self.quotation_date):
			frappe.throw(_("Valid Till date cannot be before Quotation Date"))

	def sync_addresses(self):
		if self.same_as_billing:
			self.shipping_address_title = self.billing_address_title
			self.shipping_address_line1 = self.billing_address_line1
			self.shipping_address_line2 = self.billing_address_line2
			self.shipping_city = self.billing_city
			self.shipping_state = self.billing_state
			self.shipping_country = self.billing_country
			self.shipping_pincode = self.billing_pincode

	def calculate_totals(self):
		total_qty = 0.0
		net_total = 0.0
		total_tax = 0.0

		for item in self.items:
			qty = flt(item.qty, 2)
			rate = flt(item.rate, 2)
			item.amount = flt(qty * rate, 2)

			if flt(item.discount_percentage) > 0:
				item.discount_amount = flt(item.amount * flt(item.discount_percentage) / 100.0, 2)
			elif not item.discount_percentage:
				item.discount_amount = flt(item.discount_amount, 2)

			item.net_amount = flt(item.amount - flt(item.discount_amount), 2)

			tax_rate = flt(item.tax_rate if item.tax_rate is not None else 18.0)
			item.tax_rate = tax_rate
			item.tax_amount = flt(item.net_amount * (tax_rate / 100.0), 2)
			item.total_amount = flt(item.net_amount + item.tax_amount, 2)

			total_qty += qty
			net_total += item.net_amount
			total_tax += item.tax_amount

		self.total_qty = flt(total_qty, 2)
		self.net_total = flt(net_total, 2)

		# Global / Overall discount
		if self.discount_type == "Percentage" and flt(self.discount_percentage) > 0:
			self.discount_amount = flt(self.net_total * flt(self.discount_percentage) / 100.0, 2)
		else:
			self.discount_amount = flt(self.discount_amount or 0, 2)

		taxable_subtotal = max(0.0, self.net_total - self.discount_amount)

		# If items have individual taxes, use total_tax. If overall discount was applied, adjust tax proportionally.
		if self.net_total > 0 and self.discount_amount > 0:
			ratio = taxable_subtotal / self.net_total
			self.tax_amount = flt(total_tax * ratio, 2)
		else:
			self.tax_amount = flt(total_tax, 2)

		freight = flt(self.shipping_freight_charges, 2)
		adjustment = flt(self.rounding_adjustment, 2)

		self.grand_total = flt(taxable_subtotal + self.tax_amount + freight + adjustment, 2)

		if self.currency:
			self.in_words = money_in_words(self.grand_total, self.currency)

	def on_update(self):
		self.publish_realtime_update()

	def publish_realtime_update(self):
		if self.deal:
			frappe.publish_realtime(
				"crm_quotation_update",
				{"name": self.name, "deal": self.deal, "crm_deal": self.deal, "status": self.status},
			)


@frappe.whitelist()
def can_view_quotations() -> bool:
	"""Check if current user has permission to read CRM Quotations."""
	return frappe.has_permission("CRM Quotation", "read")


@frappe.whitelist()
def can_create_quotations() -> bool:
	"""Check if current user has permission to create CRM Quotations."""
	return frappe.has_permission("CRM Quotation", "create")


QUOTATION_SUMMARY_FIELDS = [
	"name",
	"title",
	"status",
	"grand_total",
	"currency",
	"quotation_date",
	"valid_till",
	"revision_number",
	"is_latest_revision",
	"creation",
	"modified",
]


@frappe.whitelist()
def get_deal_quotations(crm_deal: str):
	"""Fetch all CRM Quotations linked to a specific Deal."""
	if not crm_deal:
		return []

	if not frappe.has_permission("CRM Deal", doc=crm_deal):
		frappe.throw(_("Not permitted"), frappe.PermissionError)

	if not frappe.has_permission("CRM Quotation", ptype="read"):
		return []

	rows = frappe.get_list(
		"CRM Quotation",
		filters={"deal": crm_deal},
		fields=QUOTATION_SUMMARY_FIELDS,
		order_by="creation desc",
		limit_page_length=0,
	)

	for row in rows:
		row["url"] = f"/crm/deals/{crm_deal}?tab=quotations&quote={row['name']}"
		row["transaction_date"] = row["quotation_date"]

	return rows


@frappe.whitelist()
def create_quotation_from_deal(deal_name: str) -> str:
	"""One-click quote generation prefilled with Deal data, products, and client details."""
	if not frappe.has_permission("CRM Quotation", "create"):
		frappe.throw(_("Not permitted to create Quotations"), frappe.PermissionError)

	deal = frappe.get_doc("CRM Deal", deal_name)

	# Fetch primary contact if available
	primary_contact = None
	if hasattr(deal, "contacts") and deal.contacts:
		for c in deal.contacts:
			if c.is_primary:
				primary_contact = c.contact
				break
		if not primary_contact and len(deal.contacts) > 0:
			primary_contact = deal.contacts[0].contact

	# Fetch billing address from organization
	billing_info = {}
	if deal.organization:
		address_name = frappe.db.get_value("CRM Organization", deal.organization, "address")
		if address_name and frappe.db.exists("Address", address_name):
			addr = frappe.db.get_value(
				"Address",
				address_name,
				["address_title", "address_line1", "address_line2", "city", "state", "country", "pincode"],
				as_dict=True,
			)
			if addr:
				billing_info = {
					"billing_address_title": addr.get("address_title") or deal.organization,
					"billing_address_line1": addr.get("address_line1") or "",
					"billing_address_line2": addr.get("address_line2") or "",
					"billing_city": addr.get("city") or "",
					"billing_state": addr.get("state") or "",
					"billing_country": addr.get("country") or "",
					"billing_pincode": addr.get("pincode") or "",
				}

	# Prefill quote items from Deal products child table
	items = []
	if hasattr(deal, "products") and deal.products:
		for p in deal.products:
			product_doc = (
				frappe.db.get_value("CRM Product", p.product_code, ["product_name", "description"], as_dict=True)
				if p.product_code
				else {}
			)
			items.append(
				{
					"product": p.product_code,
					"product_name": p.product_name or (product_doc.get("product_name") if product_doc else ""),
					"description": product_doc.get("description") if product_doc else "",
					"qty": p.qty or 1.0,
					"rate": p.rate or 0.0,
					"discount_percentage": p.discount_percentage or 0.0,
					"discount_amount": p.discount_amount or 0.0,
					"uom": "Sq Ft",
					"tax_rate": 18.0,
				}
			)

	if not items:
		items.append(
			{
				"product_name": f"Pacecourt Sports Surface System - {deal.organization or deal.lead_name or deal.name}",
				"uom": "Sq Ft",
				"qty": 1000.0,
				"rate": 50.0,
				"tax_rate": 18.0,
			}
		)

	quote = frappe.get_doc(
		{
			"doctype": "CRM Quotation",
			"title": f"Quotation for {deal.organization or deal.lead_name or deal.name}",
			"deal": deal.name,
			"organization": deal.organization,
			"contact": primary_contact,
			"quote_owner": deal.deal_owner or frappe.session.user,
			"currency": deal.currency or "INR",
			"quotation_date": nowdate(),
			"valid_till": frappe.utils.add_days(nowdate(), 30),
			"status": "Draft",
			"revision_number": 0,
			"is_latest_revision": 1,
			"same_as_billing": 1,
			**billing_info,
			"items": items,
		}
	)

	quote.insert()
	return quote.name


@frappe.whitelist()
def create_quotation_revision(quotation_name: str) -> str:
	"""Zoho Quote Revision Pattern: Clone quote, increment revision, maintain audit trail."""
	if not frappe.has_permission("CRM Quotation", "create"):
		frappe.throw(_("Not permitted to create Quotations"), frappe.PermissionError)

	old_quote = frappe.get_doc("CRM Quotation", quotation_name)

	new_rev_number = (old_quote.revision_number or 0) + 1

	new_quote = frappe.copy_doc(old_quote)
	new_quote.superseded_quotation = old_quote.name
	new_quote.revision_number = new_rev_number
	new_quote.is_latest_revision = 1
	new_quote.status = "Draft"
	new_quote.quotation_date = nowdate()
	new_quote.valid_till = frappe.utils.add_days(nowdate(), 30)

	new_quote.insert()

	# Mark predecessor as not the latest revision
	frappe.db.set_value("CRM Quotation", old_quote.name, "is_latest_revision", 0)

	return new_quote.name


@frappe.whitelist()
def accept_quotation(quotation_name: str) -> bool:
	"""Mark quote as Closed Accepted and sync contract value to the parent Deal."""
	if not frappe.has_permission("CRM Quotation", "write"):
		frappe.throw(_("Not permitted to update Quotations"), frappe.PermissionError)

	quote = frappe.get_doc("CRM Quotation", quotation_name)
	quote.status = "Closed Accepted"
	quote.save()

	# Synchronize Deal Value with Quotation Grand Total
	if quote.deal and frappe.db.exists("CRM Deal", quote.deal):
		deal = frappe.get_doc("CRM Deal", quote.deal)
		deal.deal_value = quote.grand_total
		deal.save()

	return True


@frappe.whitelist()
def get_quotation_html(quotation_name: str) -> str:
	"""Generate an executive, branded Pacecourt Proposal HTML for print & PDF."""
	if not frappe.has_permission("CRM Quotation", "read"):
		frappe.throw(_("Not permitted"), frappe.PermissionError)

	quote = frappe.get_doc("CRM Quotation", quotation_name)
	currency_symbol = "₹" if quote.currency == "INR" else (quote.currency or "")

	items_html = ""
	for idx, item in enumerate(quote.items, 1):
		desc = f"<div style='font-size: 11px; color: #64748B; margin-top: 2px;'>{frappe.utils.escape_html(item.description)}</div>" if item.description else ""
		items_html += f"""
		<tr style="border-bottom: 1px solid #E2E8F0;">
			<td style="padding: 10px 12px; text-align: center; color: #64748B;">{idx}</td>
			<td style="padding: 10px 12px; color: #1E293B; font-weight: 500;">
				{frappe.utils.escape_html(item.product_name)}
				{desc}
			</td>
			<td style="padding: 10px 12px; text-align: center; color: #475569;">{frappe.utils.escape_html(item.uom or 'Sq Ft')}</td>
			<td style="padding: 10px 12px; text-align: right; color: #1E293B;">{item.qty:,.2f}</td>
			<td style="padding: 10px 12px; text-align: right; color: #1E293B;">{currency_symbol} {item.rate:,.2f}</td>
			<td style="padding: 10px 12px; text-align: right; color: #64748B;">{item.discount_percentage:,.1f}%</td>
			<td style="padding: 10px 12px; text-align: right; color: #64748B;">{item.tax_rate:,.1f}%</td>
			<td style="padding: 10px 12px; text-align: right; color: #0F172A; font-weight: 600;">{currency_symbol} {item.total_amount:,.2f}</td>
		</tr>
		"""

	scope_html = ""
	if quote.scope_of_work:
		scope_html = f"""
		<div style="margin-top: 24px; padding: 16px; background-color: #F8FAFC; border: 1px solid #E2E8F0; border-radius: 6px;">
			<h4 style="margin: 0 0 8px 0; color: #1E293B; font-size: 13px; text-transform: uppercase; letter-spacing: 0.5px;">Scope of Work & Technical Specifications</h4>
			<div style="font-size: 12px; color: #334155; line-height: 1.6;">{quote.scope_of_work}</div>
		</div>
		"""

	terms_html = ""
	if quote.terms_and_conditions or quote.payment_terms:
		p_terms = f"<div style='margin-bottom: 8px;'><strong>Payment Terms:</strong> {frappe.utils.escape_html(quote.payment_terms)}</div>" if quote.payment_terms else ""
		terms_html = f"""
		<div style="margin-top: 24px; padding: 16px; background-color: #FFFFFF; border: 1px solid #E2E8F0; border-radius: 6px;">
			<h4 style="margin: 0 0 8px 0; color: #1E293B; font-size: 13px; text-transform: uppercase; letter-spacing: 0.5px;">Commercial Terms & Warranty Conditions</h4>
			{p_terms}
			<div style="font-size: 12px; color: #475569; line-height: 1.5;">{quote.terms_and_conditions or ''}</div>
		</div>
		"""

	revision_badge = f"<span style='background: #EFF6FF; color: #1D4ED8; font-size: 11px; padding: 2px 8px; border-radius: 4px; font-weight: 600;'>Rev {quote.revision_number}</span>" if quote.revision_number > 0 else ""

	html = f"""<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Quotation - {quote.name}</title>
<style>
	@page {{ size: A4; margin: 15mm; }}
	body {{ font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Helvetica, Arial, sans-serif; color: #0F172A; margin: 0; padding: 24px; font-size: 12px; background: #fff; }}
	.header {{ display: flex; justify-content: space-between; align-items: flex-start; padding-bottom: 20px; border-bottom: 2px solid #0284C7; }}
	.logo-title {{ font-size: 24px; font-weight: 800; color: #0F172A; letter-spacing: -0.5px; }}
	.logo-subtitle {{ font-size: 11px; color: #0284C7; font-weight: 600; text-transform: uppercase; letter-spacing: 1px; margin-top: 2px; }}
	.company-info {{ font-size: 11px; color: #64748B; text-align: right; line-height: 1.4; }}
	.meta-grid {{ display: grid; grid-template-columns: 1fr 1fr; gap: 20px; margin-top: 20px; }}
	.meta-box {{ padding: 12px 16px; background: #F8FAFC; border: 1px solid #E2E8F0; border-radius: 6px; }}
	.meta-label {{ font-size: 10px; font-weight: 700; color: #64748B; text-transform: uppercase; letter-spacing: 0.5px; margin-bottom: 4px; }}
	.meta-value {{ font-size: 13px; font-weight: 600; color: #0F172A; }}
	.table-wrapper {{ margin-top: 24px; border: 1px solid #CBD5E1; border-radius: 6px; overflow: hidden; }}
	table {{ width: 100%; border-collapse: collapse; font-size: 12px; }}
	th {{ background: #F1F5F9; color: #334155; font-weight: 700; text-transform: uppercase; font-size: 10px; letter-spacing: 0.5px; padding: 10px 12px; text-align: left; border-bottom: 1px solid #CBD5E1; }}
	.summary-section {{ display: flex; justify-content: flex-end; margin-top: 16px; }}
	.summary-table {{ width: 340px; border-collapse: collapse; }}
	.summary-table td {{ padding: 6px 12px; font-size: 12px; }}
	.grand-total-row td {{ background: #0284C7; color: #FFFFFF; font-weight: 700; font-size: 14px; border-radius: 4px; }}
	.signature-grid {{ display: grid; grid-template-columns: 1fr 1fr; gap: 40px; margin-top: 48px; page-break-inside: avoid; }}
	.sig-line {{ border-top: 1px solid #94A3B8; margin-top: 40px; padding-top: 8px; font-size: 11px; color: #64748B; font-weight: 500; }}
</style>
</head>
<body>

	<div class="header">
		<div>
			<div class="logo-title">PACE COURT</div>
			<div class="logo-subtitle">Premium Sports Infrastructure & Surfacing</div>
			<div style="font-size: 11px; color: #475569; margin-top: 6px;">Turnkey Synthetic Athletic Surfaces & Acrylic Systems</div>
		</div>
		<div class="company-info">
			<strong>PACE COURT INFRASTRUCTURE</strong><br>
			Corporate Office: B-Block, Commercial Tower<br>
			GSTIN: 07AAACP1234F1Z5<br>
			Email: quotes@pacecourt.com | Web: www.pacecourt.com
		</div>
	</div>

	<div class="meta-grid">
		<div class="meta-box">
			<div class="meta-label">Billed To (Client / Organization)</div>
			<div class="meta-value">{frappe.utils.escape_html(quote.organization or quote.title)}</div>
			<div style="font-size: 11px; color: #475569; margin-top: 4px;">
				{f"Attention: {frappe.utils.escape_html(quote.contact)}<br>" if quote.contact else ""}
				{frappe.utils.escape_html(quote.billing_address_line1 or '')} {frappe.utils.escape_html(quote.billing_address_line2 or '')}<br>
				{frappe.utils.escape_html(quote.billing_city or '')} {frappe.utils.escape_html(quote.billing_state or '')} {frappe.utils.escape_html(quote.billing_pincode or '')} {frappe.utils.escape_html(quote.billing_country or '')}
			</div>
		</div>

		<div class="meta-box">
			<div style="display: flex; justify-content: space-between; align-items: center;">
				<div>
					<div class="meta-label">Quotation Number</div>
					<div class="meta-value">{quote.name} {revision_badge}</div>
				</div>
				<div style="text-align: right;">
					<div class="meta-label">Status</div>
					<div style="font-size: 12px; font-weight: 700; color: #0284C7;">{quote.status}</div>
				</div>
			</div>
			<div style="margin-top: 10px; font-size: 11px; color: #475569; display: grid; grid-template-columns: 1fr 1fr; gap: 8px;">
				<div><strong>Date:</strong> {frappe.utils.format_date(quote.quotation_date)}</div>
				<div><strong>Valid Till:</strong> {frappe.utils.format_date(quote.valid_till)}</div>
				<div><strong>Sales Owner:</strong> {frappe.utils.escape_html(quote.quote_owner)}</div>
				<div><strong>Deal Ref:</strong> {frappe.utils.escape_html(quote.deal or 'N/A')}</div>
			</div>
		</div>
	</div>

	{scope_html}

	<div class="table-wrapper">
		<table>
			<thead>
				<tr>
					<th style="width: 40px; text-align: center;">#</th>
					<th>Item Description & Specification</th>
					<th style="width: 70px; text-align: center;">UOM</th>
					<th style="width: 70px; text-align: right;">Qty</th>
					<th style="width: 90px; text-align: right;">Rate</th>
					<th style="width: 60px; text-align: right;">Disc %</th>
					<th style="width: 60px; text-align: right;">Tax %</th>
					<th style="width: 100px; text-align: right;">Total ({currency_symbol})</th>
				</tr>
			</thead>
			<tbody>
				{items_html}
			</tbody>
		</table>
	</div>

	<div class="summary-section">
		<table class="summary-table">
			<tr>
				<td style="color: #64748B;">Total Area / Quantity:</td>
				<td style="text-align: right; font-weight: 600;">{quote.total_qty:,.2f}</td>
			</tr>
			<tr>
				<td style="color: #64748B;">Subtotal (Net Total):</td>
				<td style="text-align: right; font-weight: 600;">{currency_symbol} {quote.net_total:,.2f}</td>
			</tr>
			{f"<tr><td style='color: #64748B;'>Overall Discount:</td><td style='text-align: right; color: #DC2626;'>- {currency_symbol} {quote.discount_amount:,.2f}</td></tr>" if quote.discount_amount > 0 else ""}
			<tr>
				<td style="color: #64748B;">Tax Total (GST):</td>
				<td style="text-align: right; font-weight: 600;">{currency_symbol} {quote.tax_amount:,.2f}</td>
			</tr>
			{f"<tr><td style='color: #64748B;'>Freight / Mobilization:</td><td style='text-align: right; font-weight: 600;'>{currency_symbol} {quote.shipping_freight_charges:,.2f}</td></tr>" if quote.shipping_freight_charges > 0 else ""}
			{f"<tr><td style='color: #64748B;'>Rounding:</td><td style='text-align: right;'>{currency_symbol} {quote.rounding_adjustment:,.2f}</td></tr>" if quote.rounding_adjustment != 0 else ""}
			<tr class="grand-total-row">
				<td style="padding: 10px 12px;">Grand Total:</td>
				<td style="padding: 10px 12px; text-align: right;">{currency_symbol} {quote.grand_total:,.2f}</td>
			</tr>
		</table>
	</div>

	<div style="margin-top: 12px; padding: 10px 14px; background: #F8FAFC; border: 1px solid #E2E8F0; border-radius: 4px; font-size: 11px; color: #334155;">
		<strong>Amount in Words:</strong> {quote.in_words or ''}
	</div>

	{terms_html}

	<div class="signature-grid">
		<div>
			<div class="sig-line">
				Authorized Signatory<br>
				<strong>For PACE COURT INFRASTRUCTURE</strong>
			</div>
		</div>
		<div>
			<div class="sig-line" style="text-align: right;">
				Client Acceptance Signature & Seal<br>
				<strong>For {frappe.utils.escape_html(quote.organization or quote.title)}</strong>
			</div>
		</div>
	</div>

</body>
</html>"""
	return html


@frappe.whitelist()
def generate_quotation_pdf(quotation_name: str) -> str:
	"""Compile quotation to branded PDF using wkhtmltopdf and return public URL."""
	import subprocess
	import os

	if not frappe.has_permission("CRM Quotation", "read"):
		frappe.throw(_("Not permitted"), frappe.PermissionError)

	html_content = get_quotation_html(quotation_name)

	# Ensure public files directory exists
	public_dir = os.path.join(frappe.get_site_path(), "public", "files", "quotations")
	os.makedirs(public_dir, exist_ok=True)

	filename = f"{quotation_name}.pdf"
	output_path = os.path.join(public_dir, filename)

	try:
		process = subprocess.Popen(
			["/usr/local/bin/wkhtmltopdf", "--quiet", "--page-size", "A4", "-", output_path],
			stdin=subprocess.PIPE,
			stdout=subprocess.PIPE,
			stderr=subprocess.PIPE,
		)
		stdout, stderr = process.communicate(input=html_content.encode("utf-8"))

		if process.returncode != 0:
			frappe.log_error(stderr.decode("utf-8"), f"Quotation PDF Error: {quotation_name}")
			frappe.throw(_("Failed to render PDF using PDF engine"))

		file_url = f"/files/quotations/{filename}"
		return file_url
	except Exception as e:
		frappe.log_error(frappe.get_traceback(), f"Quotation PDF Exception: {quotation_name}")
		frappe.throw(_("Error generating quotation PDF: {0}").format(str(e)))


@frappe.whitelist()
def send_quotation_email(quotation_name: str, recipient_email: str, subject: str = None, message: str = None) -> bool:
	"""Send branded quotation proposal directly to client with PDF attachment."""
	import os

	if not frappe.has_permission("CRM Quotation", "write"):
		frappe.throw(_("Not permitted"), frappe.PermissionError)

	quote = frappe.get_doc("CRM Quotation", quotation_name)
	pdf_url = generate_quotation_pdf(quotation_name)

	pdf_path = os.path.join(frappe.get_site_path(), "public", "files", "quotations", f"{quotation_name}.pdf")

	email_subject = subject or f"Quotation Proposal - {quote.name}: {quote.title}"
	email_message = message or f"""Dear Customer,<br><br>
Please find attached our official proposal <b>{quote.name}</b> for <b>{quote.title}</b>.<br><br>
<b>Total Value:</b> {quote.currency} {quote.grand_total:,.2f}<br>
<b>Validity:</b> Valid till {frappe.utils.format_date(quote.valid_till)}<br><br>
Please feel free to reach out with any technical clarifications.<br><br>
Warm regards,<br>
<b>PACE Court Team</b>
"""

	attachments = []
	if os.path.exists(pdf_path):
		with open(pdf_path, "rb") as f:
			attachments.append({
				"fname": f"{quote.name}.pdf",
				"fcontent": f.read(),
			})

	frappe.sendmail(
		recipients=[recipient_email],
		subject=email_subject,
		message=email_message,
		attachments=attachments,
		reference_doctype="CRM Quotation",
		reference_name=quote.name,
	)

	# Transition quote status to Delivered
	if quote.status == "Draft":
		quote.status = "Delivered"
		quote.save()

	return True
