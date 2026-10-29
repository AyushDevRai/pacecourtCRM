import { createResource } from 'frappe-ui'
import { ref } from 'vue'

// User permissions for CRM Quotations
export const canViewQuotations = ref(true)
export const canCreateQuotations = ref(true)

createResource({
  url: 'crm.fcrm.doctype.crm_quotation.crm_quotation.can_view_quotations',
  cache: 'Can View CRM Quotations',
  auto: true,
  onSuccess: (data) => {
    canViewQuotations.value = Boolean(data)
  },
})

createResource({
  url: 'crm.fcrm.doctype.crm_quotation.crm_quotation.can_create_quotations',
  cache: 'Can Create CRM Quotations',
  auto: true,
  onSuccess: (data) => {
    canCreateQuotations.value = Boolean(data)
  },
})

