<template>
  <div class="flex h-full flex-col">
    <!-- Header with Create Action -->
    <div
      v-if="rows.length"
      class="flex items-center justify-between border-b border-outline-elevation-2 px-4 py-2.5 sm:px-10"
    >
      <div class="text-base font-semibold text-ink-gray-8">
        {{ __('Quotations ({0})', [rows.length]) }}
      </div>
      <Button
        variant="solid"
        size="sm"
        iconLeft="lucide-plus"
        :loading="creatingQuote"
        @click="createNewQuotation"
      >
        {{ __('New Quotation') }}
      </Button>
    </div>

    <!-- Loading State -->
    <div
      v-if="quotations.loading && !quotations.fetched"
      class="flex flex-1 flex-col items-center justify-center gap-3 text-2xl-medium text-ink-gray-4"
    >
      <LoadingIndicator class="h-6 w-6" />
      <span>{{ __('Loading...') }}</span>
    </div>

    <!-- Empty State -->
    <div
      v-else-if="!rows.length"
      class="flex flex-1 flex-col items-center justify-center px-4"
    >
      <EmptyState
        name="Quotations"
        :title="__('No quotations yet')"
        :description="__('Generate professional proposals for this deal with live pricing and PDF export.')"
        icon="file-text"
        top="25%"
      />
      <div class="mt-4">
        <Button
          variant="solid"
          iconLeft="lucide-plus"
          :loading="creatingQuote"
          @click="createNewQuotation"
        >
          {{ __('Create First Quotation') }}
        </Button>
      </div>
    </div>

    <!-- Quotations Cards -->
    <div v-else class="flex flex-col px-3 py-3 sm:px-10 sm:py-5">
      <div v-for="(quotation, i) in rows" :key="quotation.name">
        <div
          class="group -mx-3 flex flex-col gap-3 rounded-lg border border-transparent p-3 duration-200 hover:border-outline-elevation-2 hover:bg-surface-gray-1 cursor-pointer"
          @click="router.push({ name: 'Quotation', params: { quotationId: quotation.name } })"
        >
          <div class="flex items-center justify-between gap-3">
            <div class="flex items-center gap-2 truncate">
              <span class="truncate font-semibold text-ink-gray-9">
                {{ quotation.name }}
              </span>
              <Badge
                v-if="quotation.revision_number > 0"
                :label="__('Rev {0}', [quotation.revision_number])"
                variant="outline"
                size="sm"
              />
              <Badge
                :label="quotation.status"
                :theme="statusTheme(quotation.status)"
                variant="subtle"
                size="sm"
              />
            </div>

            <!-- Card Actions -->
            <div class="flex items-center gap-2">
              <Dropdown
                :options="quoteActions(quotation)"
                placement="bottom-end"
              >
                <Button
                  variant="ghost"
                  size="sm"
                  icon="lucide-more-horizontal"
                />
              </Dropdown>
            </div>
          </div>

          <!-- Subject Title if available -->
          <div v-if="quotation.title" class="text-sm text-ink-gray-7 truncate">
            {{ quotation.title }}
          </div>

          <!-- Financial Total & Dates -->
          <div class="flex items-center justify-between text-sm text-ink-gray-6">
            <div class="flex items-center gap-2">
              <span class="tabular-nums font-medium text-ink-gray-9 text-base">
                {{ formatCurrency(quotation.grand_total, '', quotation.currency) }}
              </span>
              <span class="text-ink-gray-4">·</span>
              <span>{{ dateLabel(quotation) }}</span>
            </div>
          </div>
        </div>
        <div
          v-if="i < rows.length - 1"
          class="my-2 h-px border-t border-outline-elevation-2"
        />
      </div>
    </div>
  </div>
</template>

<script setup>
import EmptyState from '@/components/ListViews/EmptyState.vue'
import LoadingIndicator from '@/components/Icons/LoadingIndicator.vue'
import { formatDate } from '@/utils'
import { formatCurrency } from '@/utils/numberFormat.js'
import { globalStore } from '@/stores/global'
import { Badge, Button, Dropdown, call, createResource, toast } from 'frappe-ui'
import { computed, onBeforeUnmount, onMounted, ref } from 'vue'
import { useRouter } from 'vue-router'

const router = useRouter()

const { $socket } = globalStore()

const props = defineProps({
  deal: { type: String, required: true },
})

const creatingQuote = ref(false)

const quotations = createResource({
  url: 'crm.fcrm.doctype.crm_quotation.crm_quotation.get_deal_quotations',
  params: { crm_deal: props.deal },
  auto: true,
})

const rows = computed(() => quotations.data || [])

function onQuotationUpdate(data) {
  if (data?.crm_deal === props.deal || data?.deal === props.deal) {
    quotations.reload()
  }
}

onMounted(() => $socket.on('crm_quotation_update', onQuotationUpdate))
onBeforeUnmount(() => $socket.off('crm_quotation_update', onQuotationUpdate))

// Zoho CRM Quotes standard stage color themes
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

function dateLabel(quotation) {
  if (quotation.valid_till) {
    return __('Valid till {0}', [formatDate(quotation.valid_till, '', true)])
  }
  return formatDate(quotation.quotation_date || quotation.transaction_date, '', true)
}

async function createNewQuotation() {
  creatingQuote.value = true
  try {
    const res = await call(
      'crm.fcrm.doctype.crm_quotation.crm_quotation.create_quotation_from_deal',
      { deal_name: props.deal }
    )
    if (res) {
      toast.success(__('Quotation {0} created', [res]))
      quotations.reload()
      router.push({ name: 'Quotation', params: { quotationId: res } })
    }
  } catch (err) {
    toast.error(err.message || __('Failed to create quotation'))
  } finally {
    creatingQuote.value = false
  }
}

async function handleCreateRevision(quotation) {
  try {
    const res = await call(
      'crm.fcrm.doctype.crm_quotation.crm_quotation.create_quotation_revision',
      { quotation_name: quotation.name }
    )
    if (res) {
      toast.success(__('Created revision {0}', [res]))
      quotations.reload()
      router.push({ name: 'Quotation', params: { quotationId: res } })
    }
  } catch (err) {
    toast.error(err.message || __('Failed to create revision'))
  }
}

async function handleAcceptQuotation(quotation) {
  try {
    const res = await call(
      'crm.fcrm.doctype.crm_quotation.crm_quotation.accept_quotation',
      { quotation_name: quotation.name }
    )
    if (res) {
      toast.success(__('Quotation marked as Closed Accepted'))
      quotations.reload()
    }
  } catch (err) {
    toast.error(err.message || __('Failed to accept quotation'))
  }
}

async function handleDownloadPdf(quotation) {
  try {
    const fileUrl = await call(
      'crm.fcrm.doctype.crm_quotation.crm_quotation.generate_quotation_pdf',
      { quotation_name: quotation.name }
    )
    if (fileUrl) {
      window.open(fileUrl, '_blank')
    }
  } catch (err) {
    toast.error(err.message || __('Failed to download PDF'))
  }
}

function quoteActions(quotation) {
  const actions = [
    {
      label: __('View / Edit'),
      icon: 'lucide-external-link',
      onClick: () => router.push({ name: 'Quotation', params: { quotationId: quotation.name } }),
    },
    {
      label: __('Download PDF'),
      icon: 'lucide-file-text',
      onClick: () => handleDownloadPdf(quotation),
    },
    {
      label: __('Create Revision'),
      icon: 'lucide-copy',
      onClick: () => handleCreateRevision(quotation),
    },
  ]

  if (quotation.status !== 'Closed Accepted') {
    actions.push({
      label: __('Mark Accepted'),
      icon: 'lucide-check-circle',
      onClick: () => handleAcceptQuotation(quotation),
    })
  }

  return actions
}
</script>
