// Copyright (c) 2026, PACE Court and contributors
// For license information, please see license.txt

frappe.ui.form.on("CRM Quotation", {
	refresh(frm) {
		if (!frm.is_new()) {
			frm.add_custom_button(__("Create Revision"), () => {
				frappe.call({
					method: "crm.fcrm.doctype.crm_quotation.crm_quotation.create_quotation_revision",
					args: { quotation_name: frm.doc.name },
					callback(r) {
						if (r.message) {
							frappe.set_route("Form", "CRM Quotation", r.message);
						}
					},
				});
			});

			if (frm.doc.status !== "Closed Accepted") {
				frm.add_custom_button(__("Mark Accepted"), () => {
					frappe.call({
						method: "crm.fcrm.doctype.crm_quotation.crm_quotation.accept_quotation",
						args: { quotation_name: frm.doc.name },
						callback(r) {
							if (r.message) {
								frm.reload_doc();
							}
						},
					});
				}, __("Actions"));
			}
		}
	},
});

