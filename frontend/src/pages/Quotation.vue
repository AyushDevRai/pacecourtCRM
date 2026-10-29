<template>
  <div v-if="loading && !quote" class="flex h-screen items-center justify-center">
    <LoadingIndicator class="h-8 w-8 text-ink-gray-4" />
  </div>

  <div v-else-if="quote" class="flex h-screen flex-col bg-surface-gray-1">
    <!-- Top Action Bar -->
    <header class="flex h-14 shrink-0 items-center justify-between border-b border-outline-elevation-2 bg-surface-white px-4 sm:px-6">
      <div class="flex items-center gap-3">
        <Button
          variant="ghost"
          icon="lucide-arrow-left"
          @click="router.back()"
        />
        <div class="flex items-center gap-2">
          <span class="text-lg font-bold text-ink-gray-9">{{ quote.name }}</span>
          <Badge
            v-if="quote.revision_number > 0"
            :label="__('Rev {0}', [quote.revision_number])"
            variant="outline"
            size="sm"
          />
          <Badge
            :label="quote.status"
            :theme="statusTheme(quote.status)"
            variant="subtle"
            size="sm"
          />
        </div>
      </div>

      <!-- Action Buttons -->
      <div class="flex items-center gap-2">
        <Button
          variant="subtle"
          iconLeft="lucide-file-text"
          :loading="generatingPdf"
          @click="handlePrintPdf"
        >
          {{ __('Print / PDF') }}
        </Button>

        <Button
          variant="subtle"
          iconLeft="lucide-mail"
          @click="showEmailModal = true"
        >
          {{ __('Send Email') }}
        </Button>

        <Button
          variant="subtle"
          iconLeft="lucide-copy"
          :loading="revising"
          @click="handleCreateRevision"
        >
          {{ __('Revise') }}
        </Button>

        <Button
          v-if="quote.status !== 'Closed Accepted'"
          variant="subtle"
          iconLeft="lucide-check-circle"
          class="text-ink-green-3 hover:text-ink-green-4"
          @click="handleAcceptQuotation"
        >
          {{ __('Mark Accepted') }}
        </Button>

        <Button
          variant="solid"
          iconLeft="lucide-save"
          :loading="saving"
          @click="saveQuotation"
        >
          {{ __('Save') }}
        </Button>
      </div>
    </header>

    <!-- Main Workspace (2 Columns) -->
    <div class="flex flex-1 overflow-hidden">
      <!-- Left Column: Details & Items & Scope -->
      <div class="flex-1 overflow-y-auto p-4 sm:p-6 space-y-6">
        <!-- Title & Metadata Card -->
        <div class="rounded-lg border border-outline-elevation-2 bg-surface-white p-5 shadow-sm space-y-4">
          <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
            <div class="md:col-span-2">
              <label class="block text-xs font-semibold uppercase text-ink-gray-5 mb-1">{{ __('Subject / Project Title') }} *</label>
              <TextInput
                v-model="quote.title"
                :placeholder="__('Proposal Title')"
                class="font-medium text-base"
              />
            </div>
            <div>
              <label class="block text-xs font-semibold uppercase text-ink-gray-5 mb-1">{{ __('Deal Reference') }}</label>
              <TextInput
                v-model="quote.deal"
                :placeholder="__('CRM Deal')"
              />
            </div>
            <div>
              <label class="block text-xs font-semibold uppercase text-ink-gray-5 mb-1">{{ __('Organization / Client') }}</label>
              <TextInput
                v-model="quote.organization"
                :placeholder="__('Client Organization')"
              />
            </div>
            <div>
              <label class="block text-xs font-semibold uppercase text-ink-gray-5 mb-1">{{ __('Primary Contact') }}</label>
              <TextInput
                v-model="quote.contact"
                :placeholder="__('Contact Person')"
              />
            </div>
            <div>
              <label class="block text-xs font-semibold uppercase text-ink-gray-5 mb-1">{{ __('Quotation Status') }}</label>
              <Select
                v-model="quote.status"
                :options="statusOptions"
              />
            </div>
            <div>
              <label class="block text-xs font-semibold uppercase text-ink-gray-5 mb-1">{{ __('Quotation Date') }}</label>
              <TextInput
                v-model="quote.quotation_date"
                type="date"
              />
            </div>
            <div>
              <label class="block text-xs font-semibold uppercase text-ink-gray-5 mb-1">{{ __('Valid Till') }}</label>
              <TextInput
                v-model="quote.valid_till"
                type="date"
              />
            </div>
          </div>
        </div>

        <!-- Line Items Editor Table -->
        <div class="rounded-lg border border-outline-elevation-2 bg-surface-white p-5 shadow-sm space-y-3">
          <div class="flex items-center justify-between">
            <div>
              <h4 class="text-base font-bold text-ink-gray-9">{{ __('Itemized Products & Court Systems') }}</h4>
              <p class="text-xs text-ink-gray-5">{{ __('Custom layers, primers, resurfacers, and court line markings') }}</p>
            </div>
            <Button
              variant="subtle"
              size="sm"
              iconLeft="lucide-plus"
              @click="addLineItem"
            >
              {{ __('Add Item') }}
            </Button>
          </div>

          <div class="overflow-x-auto">
            <table class="w-full text-left text-sm border-collapse">
              <thead>
                <tr class="border-b border-outline-elevation-2 bg-surface-gray-1 text-xs uppercase text-ink-gray-5">
                  <th class="py-2.5 px-3 font-semibold">{{ __('Product / Description') }}</th>
                  <th class="py-2.5 px-3 font-semibold w-24 text-center">{{ __('UOM') }}</th>
                  <th class="py-2.5 px-3 font-semibold w-24 text-right">{{ __('Qty') }}</th>
                  <th class="py-2.5 px-3 font-semibold w-28 text-right">{{ __('Rate (₹)') }}</th>
                  <th class="py-2.5 px-3 font-semibold w-20 text-right">{{ __('Disc %') }}</th>
                  <th class="py-2.5 px-3 font-semibold w-20 text-right">{{ __('Tax %') }}</th>
                  <th class="py-2.5 px-3 font-semibold w-28 text-right">{{ __('Total') }}</th>
                  <th class="py-2.5 px-2 w-10"></th>
                </tr>
              </thead>
              <tbody class="divide-y divide-outline-elevation-2">
                <tr v-for="(item, idx) in quote.items" :key="idx" class="hover:bg-surface-gray-1">
                  <td class="p-2">
                    <TextInput
                      v-model="item.product_name"
                      size="sm"
                      :placeholder="__('Item / Layer Name')"
                    />
                  </td>
                  <td class="p-2 text-center">
                    <Select
                      v-model="item.uom"
                      size="sm"
                      :options="['Sq Ft', 'Sq Mt', 'Running Ft', 'Unit', 'Set', 'Bucket', 'Kg', 'Ltr', 'Job']"
                    />
                  </td>
                  <td class="p-2">
                    <TextInput
                      v-model.number="item.qty"
                      type="number"
                      size="sm"
                      class="text-right"
                      @input="recalculate"
                    />
                  </td>
                  <td class="p-2">
                    <TextInput
                      v-model.number="item.rate"
                      type="number"
                      size="sm"
                      class="text-right"
                      @input="recalculate"
                    />
                  </td>
                  <td class="p-2">
                    <TextInput
                      v-model.number="item.discount_percentage"
                      type="number"
                      size="sm"
                      class="text-right"
                      @input="recalculate"
                    />
                  </td>
                  <td class="p-2">
                    <TextInput
                      v-model.number="item.tax_rate"
                      type="number"
                      size="sm"
                      class="text-right"
                      @input="recalculate"
                    />
                  </td>
                  <td class="p-2 text-right font-semibold text-ink-gray-9 tabular-nums">
                    ₹ {{ (item.total_amount || 0).toLocaleString(undefined, { minimumFractionDigits: 2 }) }}
                  </td>
                  <td class="p-2 text-center">
                    <Button
                      variant="ghost"
                      size="sm"
                      icon="lucide-trash-2"
                      class="text-ink-red-3 hover:text-ink-red-4"
                      :disabled="quote.items.length === 1"
                      @click="removeLineItem(idx)"
                    />
                  </td>
                </tr>
              </tbody>
            </table>
          </div>
        </div>

        <!-- Scope of Work & Specs -->
        <div class="rounded-lg border border-outline-elevation-2 bg-surface-white p-5 shadow-sm space-y-3">
          <h4 class="text-base font-bold text-ink-gray-9">{{ __('Scope of Work & Technical Specifications') }}</h4>
          <textarea
            v-model="quote.scope_of_work"
            rows="4"
            class="w-full rounded border border-outline-elevation-2 p-3 text-sm focus:border-outline-gray-4 focus:outline-none"
            :placeholder="__('Details of surface preparation, primer application, resurfacer coating, wear coats, and court line markings...')"
          />
        </div>

        <!-- Billing & Site Addresses -->
        <div class="rounded-lg border border-outline-elevation-2 bg-surface-white p-5 shadow-sm space-y-4">
          <div class="flex items-center justify-between">
            <h4 class="text-base font-bold text-ink-gray-9">{{ __('Addresses & Logistics') }}</h4>
            <div class="flex items-center gap-2 text-xs text-ink-gray-6">
              <label>{{ __('Same as Billing') }}</label>
              <input v-model="quote.same_as_billing" type="checkbox" class="rounded text-surface-gray-9" />
            </div>
          </div>

          <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
            <!-- Billing -->
            <div class="space-y-2 border-r border-outline-elevation-2 pr-4">
              <span class="text-xs font-semibold uppercase text-ink-gray-5">{{ __('Billing Address') }}</span>
              <TextInput v-model="quote.billing_address_line1" size="sm" :placeholder="__('Address Line 1')" />
              <TextInput v-model="quote.billing_address_line2" size="sm" :placeholder="__('Address Line 2')" />
              <div class="grid grid-cols-2 gap-2">
                <TextInput v-model="quote.billing_city" size="sm" :placeholder="__('City')" />
                <TextInput v-model="quote.billing_state" size="sm" :placeholder="__('State')" />
              </div>
              <div class="grid grid-cols-2 gap-2">
                <TextInput v-model="quote.billing_country" size="sm" :placeholder="__('Country')" />
                <TextInput v-model="quote.billing_pincode" size="sm" :placeholder="__('PIN / Postal Code')" />
              </div>
            </div>

            <!-- Shipping -->
            <div class="space-y-2 pl-2">
              <span class="text-xs font-semibold uppercase text-ink-gray-5">{{ __('Project Site / Shipping Address') }}</span>
              <TextInput v-model="quote.shipping_address_line1" :disabled="quote.same_as_billing" size="sm" :placeholder="__('Site Address Line 1')" />
              <TextInput v-model="quote.shipping_address_line2" :disabled="quote.same_as_billing" size="sm" :placeholder="__('Site Address Line 2')" />
              <div class="grid grid-cols-2 gap-2">
                <TextInput v-model="quote.shipping_city" :disabled="quote.same_as_billing" size="sm" :placeholder="__('City')" />
                <TextInput v-model="quote.shipping_state" :disabled="quote.same_as_billing" size="sm" :placeholder="__('State')" />
              </div>
              <div class="grid grid-cols-2 gap-2">
                <TextInput v-model="quote.shipping_country" :disabled="quote.same_as_billing" size="sm" :placeholder="__('Country')" />
                <TextInput v-model="quote.shipping_pincode" :disabled="quote.same_as_billing" size="sm" :placeholder="__('PIN / Postal Code')" />
              </div>
            </div>
          </div>
        </div>

        <!-- Terms & Notes -->
        <div class="rounded-lg border border-outline-elevation-2 bg-surface-white p-5 shadow-sm space-y-4">
          <h4 class="text-base font-bold text-ink-gray-9">{{ __('Commercial Terms & Conditions') }}</h4>
          <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
            <div>
              <label class="block text-xs font-semibold uppercase text-ink-gray-5 mb-1">{{ __('Payment Terms') }}</label>
              <textarea
                v-model="quote.payment_terms"
                rows="3"
                class="w-full rounded border border-outline-elevation-2 p-2.5 text-sm"
                :placeholder="__('e.g. 50% advance with PO, 40% dispatch, 10% handover')"
              />
            </div>
            <div>
              <label class="block text-xs font-semibold uppercase text-ink-gray-5 mb-1">{{ __('Customer Notes') }}</label>
              <textarea
                v-model="quote.customer_notes"
                rows="3"
                class="w-full rounded border border-outline-elevation-2 p-2.5 text-sm"
                :placeholder="__('Special notes visible on the proposal PDF')"
              />
            </div>
          </div>
        </div>
      </div>

      <!-- Right Column: Financial Summary Card -->
      <div class="w-80 sm:w-96 shrink-0 border-l border-outline-elevation-2 bg-surface-white p-5 overflow-y-auto space-y-6">
        <div class="rounded-lg border border-outline-elevation-2 p-4 bg-surface-gray-1 space-y-3">
          <h4 class="text-sm font-bold uppercase tracking-wide text-ink-gray-8">{{ __('Commercial Summary') }}</h4>

          <div class="space-y-2 text-sm">
            <div class="flex justify-between text-ink-gray-6">
              <span>{{ __('Total Area / Qty:') }}</span>
              <span class="font-semibold text-ink-gray-9 tabular-nums">{{ (quote.total_qty || 0).toLocaleString() }}</span>
            </div>

            <div class="flex justify-between text-ink-gray-6">
              <span>{{ __('Subtotal (Net):') }}</span>
              <span class="font-semibold text-ink-gray-9 tabular-nums">₹ {{ (quote.net_total || 0).toLocaleString(undefined, { minimumFractionDigits: 2 }) }}</span>
            </div>

            <!-- Discount -->
            <div class="pt-2 border-t border-outline-elevation-2">
              <div class="flex justify-between items-center text-ink-gray-6 mb-1">
                <span>{{ __('Order Discount %:') }}</span>
                <input
                  v-model.number="quote.discount_percentage"
                  type="number"
                  class="w-20 rounded border border-outline-elevation-2 p-1 text-right text-xs"
                  @input="recalculate"
                />
              </div>
              <div v-if="quote.discount_amount" class="flex justify-between text-ink-red-3 text-xs">
                <span>{{ __('Discount Amount:') }}</span>
                <span>- ₹ {{ (quote.discount_amount || 0).toLocaleString(undefined, { minimumFractionDigits: 2 }) }}</span>
              </div>
            </div>

            <!-- Taxes -->
            <div class="flex justify-between text-ink-gray-6 pt-2 border-t border-outline-elevation-2">
              <span>{{ __('Tax Total (GST):') }}</span>
              <span class="font-semibold text-ink-gray-9 tabular-nums">₹ {{ (quote.tax_amount || 0).toLocaleString(undefined, { minimumFractionDigits: 2 }) }}</span>
            </div>

            <!-- Freight -->
            <div class="flex justify-between items-center text-ink-gray-6 pt-2 border-t border-outline-elevation-2">
              <span>{{ __('Shipping / Freight:') }}</span>
              <input
                v-model.number="quote.shipping_freight_charges"
                type="number"
                class="w-24 rounded border border-outline-elevation-2 p-1 text-right text-xs"
                @input="recalculate"
              />
            </div>

            <!-- Grand Total Highlight -->
            <div class="mt-4 rounded-lg bg-surface-gray-9 p-4 text-surface-white space-y-1">
              <div class="text-xs uppercase tracking-wider text-ink-gray-4">{{ __('Grand Total') }}</div>
              <div class="text-2xl font-black tabular-nums">
                ₹ {{ (quote.grand_total || 0).toLocaleString(undefined, { minimumFractionDigits: 2 }) }}
              </div>
            </div>

            <div v-if="quote.in_words" class="text-xs text-ink-gray-5 italic pt-1">
              {{ quote.in_words }}
            </div>
          </div>
        </div>

        <!-- Revision & Audit Box -->
        <div class="rounded-lg border border-outline-elevation-2 p-4 space-y-2 text-xs text-ink-gray-6">
          <div class="font-bold text-ink-gray-8 uppercase tracking-wide">{{ __('Revision Audit') }}</div>
          <div><strong>{{ __('Current Revision:') }}</strong> Rev {{ quote.revision_number || 0 }}</div>
          <div v-if="quote.superseded_quotation">
            <strong>{{ __('Superseded Quote:') }}</strong>
            <router-link :to="{ name: 'Quotation', params: { quotationId: quote.superseded_quotation } }" class="text-ink-blue-3 underline ml-1">
              {{ quote.superseded_quotation }}
            </router-link>
          </div>
          <div><strong>{{ __('Latest Active Quote:') }}</strong> {{ quote.is_latest_revision ? 'Yes' : 'No' }}</div>
          <div><strong>{{ __('Owner:') }}</strong> {{ quote.quote_owner }}</div>
        </div>
      </div>
    </div>

    <!-- Email Modal -->
    <Dialog v-model:open="showEmailModal" :size="'lg'" bare>
      <template #default>
        <div class="p-5 bg-surface-elevation-2 space-y-4">
          <h3 class="text-lg font-bold text-ink-gray-9">{{ __('Email Proposal to Client') }}</h3>
          <div>
            <label class="block text-xs font-semibold uppercase text-ink-gray-5 mb-1">{{ __('Recipient Email') }} *</label>
            <TextInput v-model="emailForm.recipient" placeholder="client@example.com" />
          </div>
          <div>
            <label class="block text-xs font-semibold uppercase text-ink-gray-5 mb-1">{{ __('Email Subject') }}</label>
            <TextInput v-model="emailForm.subject" />
          </div>
          <div>
            <label class="block text-xs font-semibold uppercase text-ink-gray-5 mb-1">{{ __('Message') }}</label>
            <textarea
              v-model="emailForm.message"
              rows="4"
              class="w-full rounded border border-outline-elevation-2 p-2.5 text-sm"
            />
          </div>
          <div class="p-2.5 rounded bg-surface-gray-2 text-xs text-ink-gray-6 flex items-center gap-2">
            <span class="lucide-paperclip size-4" />
            <span>{{ __('Attached: {0}.pdf (Auto-generated)', [quote.name]) }}</span>
          </div>
        </div>
        <div class="p-3 bg-surface-gray-1 border-t flex justify-end gap-2">
          <Button variant="subtle" :label="__('Cancel')" @click="showEmailModal = false" />
          <Button variant="solid" :label="__('Send Proposal')" :loading="sendingEmail" @click="handleSendEmail" />
        </div>
      </template>
    </Dialog>
  </div>
</template>

<script setup>
import LoadingIndicator from '@/components/Icons/LoadingIndicator.vue'
import { calculateLineItem, calculateQuotationTotals } from '@/utils/quotationCalculations'
import { Badge, Button, Dialog, Select, TextInput, call, toast } from 'frappe-ui'
import { onMounted, reactive, ref, watch } from 'vue'
import { useRoute, useRouter } from 'vue-router'

const props = defineProps({
  quotationId: { type: String, required: true },
})

const route = useRoute()
const router = useRouter()

const quote = ref(null)
const loading = ref(true)
const saving = ref(false)
const revising = ref(false)
const generatingPdf = ref(false)
const showEmailModal = ref(false)
const sendingEmail = ref(false)

const emailForm = reactive({
  recipient: '',
  subject: '',
  message: '',
})

const statusOptions = [
  'Draft',
  'In Review',
  'Delivered',
  'Under Negotiation',
  'Closed Accepted',
  'Closed Lost',
  'Expired',
]

const STATUS_THEME = {
  Draft: 'gray',
  'In Review': 'purple',
  Delivered: 'blue',
  'Under Negotiation': 'orange',
  'Closed Accepted': 'green',
  'Closed Lost': 'red',
  Expired: 'gray',
}

function statusTheme(status) {
  return STATUS_THEME[status] || 'gray'
}

async function loadQuotation() {
  loading.value = true
  try {
    const res = await call('frappe.client.get', {
      doctype: 'CRM Quotation',
      name: props.quotationId,
    })
    if (res) {
      quote.value = res
      emailForm.subject = `Pacecourt Quotation Proposal - ${res.name}: ${res.title}`
      recalculate()
    }
  } catch (err) {
    toast.error(err.message || 'Failed to load quotation')
  } finally {
    loading.value = false
  }
}

function addLineItem() {
  quote.value.items.push({
    product_name: '',
    uom: 'Sq Ft',
    qty: 1000,
    rate: 50,
    discount_percentage: 0,
    tax_rate: 18,
    amount: 50000,
    net_amount: 50000,
    tax_amount: 9000,
    total_amount: 59000,
  })
  recalculate()
}

function removeLineItem(idx) {
  if (quote.value.items.length > 1) {
    quote.value.items.splice(idx, 1)
    recalculate()
  }
}

function recalculate() {
  if (!quote.value) return
  const calculated = calculateQuotationTotals(quote.value)
  quote.value.items = calculated.items
  quote.value.total_qty = calculated.total_qty
  quote.value.net_total = calculated.net_total
  quote.value.discount_amount = calculated.discount_amount
  quote.value.tax_amount = calculated.tax_amount
  quote.value.grand_total = calculated.grand_total
}

async function saveQuotation() {
  saving.value = true
  try {
    recalculate()
    const res = await call('frappe.client.save', {
      doc: quote.value,
    })
    if (res) {
      quote.value = res
      toast.success(__('Quotation saved successfully'))
    }
  } catch (err) {
    toast.error(err.message || __('Failed to save quotation'))
  } finally {
    saving.value = false
  }
}

async function handleCreateRevision() {
  revising.value = true
  try {
    const newQuoteName = await call(
      'crm.fcrm.doctype.crm_quotation.crm_quotation.create_quotation_revision',
      { quotation_name: quote.value.name }
    )
    if (newQuoteName) {
      toast.success(__('Created revision {0}', [newQuoteName]))
      router.push({ name: 'Quotation', params: { quotationId: newQuoteName } })
    }
  } catch (err) {
    toast.error(err.message || __('Failed to create revision'))
  } finally {
    revising.value = false
  }
}

async function handleAcceptQuotation() {
  try {
    await call(
      'crm.fcrm.doctype.crm_quotation.crm_quotation.accept_quotation',
      { quotation_name: quote.value.name }
    )
    toast.success(__('Quotation marked as Closed Accepted & synced to Deal'))
    quote.value.status = 'Closed Accepted'
  } catch (err) {
    toast.error(err.message || __('Failed to accept quotation'))
  }
}

async function handlePrintPdf() {
  generatingPdf.value = true
  try {
    const fileUrl = await call(
      'crm.fcrm.doctype.crm_quotation.crm_quotation.generate_quotation_pdf',
      { quotation_name: quote.value.name }
    )
    if (fileUrl) {
      window.open(fileUrl, '_blank')
    }
  } catch (err) {
    toast.error(err.message || __('Failed to generate PDF'))
  } finally {
    generatingPdf.value = false
  }
}

async function handleSendEmail() {
  if (!emailForm.recipient) {
    toast.error(__('Please enter recipient email'))
    return
  }

  sendingEmail.value = true
  try {
    await call(
      'crm.fcrm.doctype.crm_quotation.crm_quotation.send_quotation_email',
      {
        quotation_name: quote.value.name,
        recipient_email: emailForm.recipient,
        subject: emailForm.subject,
        message: emailForm.message,
      }
    )
    toast.success(__('Quotation emailed successfully'))
    showEmailModal.value = false
    quote.value.status = 'Delivered'
  } catch (err) {
    toast.error(err.message || __('Failed to send email'))
  } finally {
    sendingEmail.value = false
  }
}

watch(() => props.quotationId, loadQuotation)
onMounted(loadQuotation)
</script>

