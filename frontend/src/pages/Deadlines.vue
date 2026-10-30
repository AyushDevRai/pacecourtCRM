<template>
  <LayoutHeader>
    <template #left-header>
      <ViewBreadcrumbs v-model="viewControls" routeName="Deadlines" />
    </template>
    <template #right-header>
      <Button
        variant="subtle"
        :label="__('Refresh')"
        iconLeft="lucide-refresh-cw"
        @click="refreshData"
      />
    </template>
  </LayoutHeader>

  <!-- Top KPI Summary Cards (Pacecourt Design Language) -->
  <div class="px-5 pt-4 pb-2">
    <div class="grid grid-cols-2 md:grid-cols-5 gap-3.5">
      <!-- 1. Active Deadlines -->
      <div
        class="relative rounded-2xl bg-[var(--pc-surface)] border border-[var(--pc-border)] p-4 overflow-hidden shadow-xs flex flex-col justify-between transition-all hover:border-[var(--pc-border-focus)] cursor-pointer"
        @click="setQuickFilter('active')"
      >
        <div class="absolute inset-x-0 top-0 h-[3px] bg-gradient-to-r from-[#4F8CF0] to-[#2563EB]" />
        <div class="flex items-center justify-between mb-2">
          <div class="w-8 h-8 rounded-xl bg-blue-500/10 flex items-center justify-center text-blue-600 dark:text-blue-400">
            <svg class="w-4 h-4" fill="none" viewBox="0 0 24 24" stroke="currentColor">
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 8v4l3 3m6-3a9 9 0 11-18 0 9 9 0 0118 0z" />
            </svg>
          </div>
          <span class="inline-flex items-center px-2 py-0.5 rounded-full text-[10px] font-bold tracking-wide uppercase bg-blue-500/10 text-blue-600 dark:text-blue-400 border border-blue-500/20">
            Active
          </span>
        </div>
        <div>
          <div class="text-2xl sm:text-3xl font-extrabold text-[var(--pc-ink)] font-mono tracking-tight">
            {{ metrics.active_count ?? 0 }}
          </div>
          <div class="text-xs font-medium text-[var(--pc-muted)] mt-1 truncate">
            Running SLA Timers
          </div>
        </div>
      </div>

      <!-- 2. Breached (Urgent) -->
      <div
        class="relative rounded-2xl bg-[var(--pc-surface)] border border-[var(--pc-border)] p-4 overflow-hidden shadow-xs flex flex-col justify-between transition-all hover:border-[var(--pc-border-focus)] cursor-pointer"
        @click="setQuickFilter('breached')"
      >
        <div class="absolute inset-x-0 top-0 h-[3px] bg-gradient-to-r from-[#F87171] to-[#B91C1C]" />
        <div class="flex items-center justify-between mb-2">
          <div class="w-8 h-8 rounded-xl bg-red-500/10 flex items-center justify-center text-red-600 dark:text-red-400">
            <svg class="w-4 h-4" fill="none" viewBox="0 0 24 24" stroke="currentColor">
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 9v2m0 4h.01m-6.938 4h13.856c1.54 0 2.502-1.667 1.732-3L13.732 4c-.77-1.333-2.694-1.333-3.464 0L3.34 16c-.77 1.333.192 3 1.732 3z" />
            </svg>
          </div>
          <span class="inline-flex items-center px-2 py-0.5 rounded-full text-[10px] font-bold tracking-wide uppercase bg-red-500/10 text-red-600 dark:text-red-400 border border-red-500/20">
            Urgent
          </span>
        </div>
        <div>
          <div class="text-2xl sm:text-3xl font-extrabold text-red-500 font-mono tracking-tight">
            {{ metrics.breached_count ?? 0 }}
          </div>
          <div class="text-xs font-medium text-[var(--pc-muted)] mt-1 truncate">
            SLA Breached
          </div>
        </div>
      </div>

      <!-- 3. Coordinator Avg Response -->
      <div
        class="relative rounded-2xl bg-[var(--pc-surface)] border border-[var(--pc-border)] p-4 overflow-hidden shadow-xs flex flex-col justify-between transition-all hover:border-[var(--pc-border-focus)] cursor-pointer"
        @click="setQuickFilter('coordinator')"
      >
        <div class="absolute inset-x-0 top-0 h-[3px] bg-gradient-to-r from-[#A78BFA] to-[#7C3AED]" />
        <div class="flex items-center justify-between mb-2">
          <div class="w-8 h-8 rounded-xl bg-purple-500/10 flex items-center justify-center text-purple-600 dark:text-purple-400">
            <svg class="w-4 h-4" fill="none" viewBox="0 0 24 24" stroke="currentColor">
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17 20h5v-2a3 3 0 00-5.356-1.857M17 20H7m10 0v-2c0-.656-.126-1.283-.356-1.857M7 20H2v-2a3 3 0 015.356-1.857M7 20v-2c0-.656.126-1.283.356-1.857m0 0a5.002 5.002 0 019.288 0M15 7a3 3 0 11-6 0 3 3 0 016 0zm6 3a2 2 0 11-4 0 2 2 0 014 0zM7 10a2 2 0 11-4 0 2 2 0 014 0z" />
            </svg>
          </div>
          <span class="inline-flex items-center px-2 py-0.5 rounded-full text-[10px] font-bold tracking-wide uppercase bg-purple-500/10 text-purple-600 dark:text-purple-400 border border-purple-500/20">
            Stage 1
          </span>
        </div>
        <div>
          <div class="text-2xl sm:text-3xl font-extrabold text-[var(--pc-ink)] font-mono tracking-tight">
            {{ formatCoordinatorAvg(metrics.coordinator_avg_mins) }}
          </div>
          <div class="text-xs font-medium text-[var(--pc-muted)] mt-1 truncate">
            Coordinator Avg Response
          </div>
        </div>
      </div>

      <!-- 4. Sales Rep Avg Response -->
      <div
        class="relative rounded-2xl bg-[var(--pc-surface)] border border-[var(--pc-border)] p-4 overflow-hidden shadow-xs flex flex-col justify-between transition-all hover:border-[var(--pc-border-focus)] cursor-pointer"
        @click="setQuickFilter('sales_rep')"
      >
        <div class="absolute inset-x-0 top-0 h-[3px] bg-gradient-to-r from-[#2DD4BF] to-[#0D9488]" />
        <div class="flex items-center justify-between mb-2">
          <div class="w-8 h-8 rounded-xl bg-teal-500/10 flex items-center justify-center text-teal-600 dark:text-teal-400">
            <svg class="w-4 h-4" fill="none" viewBox="0 0 24 24" stroke="currentColor">
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 5a2 2 0 012-2h3.28a1 1 0 01.948.684l1.498 4.493a1 1 0 01-.502 1.21l-2.257 1.13a11.042 11.042 0 005.516 5.516l1.13-2.257a1 1 0 011.21-.502l4.493 1.498a1 1 0 01.684.949V19a2 2 0 01-2 2h-1C9.716 21 3 14.284 3 6V5z" />
            </svg>
          </div>
          <span class="inline-flex items-center px-2 py-0.5 rounded-full text-[10px] font-bold tracking-wide uppercase bg-teal-500/10 text-teal-600 dark:text-teal-400 border border-teal-500/20">
            Stage 2
          </span>
        </div>
        <div>
          <div class="text-2xl sm:text-3xl font-extrabold text-[var(--pc-ink)] font-mono tracking-tight">
            {{ formatRepAvg(metrics.sales_rep_avg_hours) }}
          </div>
          <div class="text-xs font-medium text-[var(--pc-muted)] mt-1 truncate">
            Sales Rep Avg Response
          </div>
        </div>
      </div>

      <!-- 5. Overall SLA Compliance -->
      <div
        class="relative rounded-2xl bg-[var(--pc-surface)] border border-[var(--pc-border)] p-4 overflow-hidden shadow-xs flex flex-col justify-between transition-all hover:border-[var(--pc-border-focus)] cursor-pointer"
        @click="setQuickFilter('all')"
      >
        <div class="absolute inset-x-0 top-0 h-[3px] bg-gradient-to-r from-[#A3D858] to-[#5F7F17]" />
        <div class="flex items-center justify-between mb-2">
          <div class="w-8 h-8 rounded-xl bg-lime-500/10 flex items-center justify-center text-[#5F7F17] dark:text-[#b4e043]">
            <svg class="w-4 h-4" fill="none" viewBox="0 0 24 24" stroke="currentColor">
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z" />
            </svg>
          </div>
          <span class="inline-flex items-center px-2 py-0.5 rounded-full text-[10px] font-bold tracking-wide uppercase bg-lime-500/10 text-[#5F7F17] dark:text-[#b4e043] border border-lime-500/20">
            Target &gt; 90%
          </span>
        </div>
        <div>
          <div class="text-2xl sm:text-3xl font-extrabold text-[#5F7F17] dark:text-[#b4e043] font-mono tracking-tight">
            {{ metrics.compliance_rate ?? 100 }}%
          </div>
          <div class="text-xs font-medium text-[var(--pc-muted)] mt-1 truncate">
            Overall Compliance
          </div>
        </div>
      </div>
    </div>

    <!-- Quick Filter Tabs -->
    <div class="flex items-center gap-2 mt-4 overflow-x-auto pb-1">
      <button
        v-for="tab in filterTabs"
        :key="tab.id"
        @click="setQuickFilter(tab.id)"
        class="px-3.5 py-1.5 rounded-full text-xs transition-all whitespace-nowrap cursor-pointer"
        :class="
          activeFilterTab === tab.id
            ? 'bg-[var(--pc-lime)] text-[#081726] shadow-xs font-bold'
            : 'bg-[var(--pc-surface)] border border-[var(--pc-border)] text-[var(--pc-muted)] hover:text-[var(--pc-ink)] hover:border-[var(--pc-border-focus)] font-medium'
        "
      >
        {{ tab.label }}
      </button>
    </div>
  </div>

  <ViewControls
    ref="viewControls"
    v-model="deadlines"
    v-model:loadMore="loadMore"
    v-model:resizeColumn="triggerResize"
    v-model:updatedPageCount="updatedPageCount"
    doctype="CRM Deadline"
  />

  <DeadlinesListView
    v-if="deadlines.data && rows.length"
    ref="deadlinesListView"
    v-model="deadlines.data.page_length_count"
    v-model:list="deadlines"
    :rows="rows"
    :columns="columns"
    :options="{
      showTooltip: false,
      resizeColumn: true,
      rowCount: deadlines.data.row_count,
      totalCount: deadlines.data.total_count,
    }"
    @loadMore="() => loadMore++"
    @columnWidthUpdated="() => triggerResize++"
    @updatePageCount="(count) => (updatedPageCount = count)"
    @applyFilter="(data) => viewControls.applyFilter(data)"
    @selectionsChanged="(selections) => viewControls.updateSelections(selections)"
  />

  <EmptyState
    v-else-if="deadlines.data && !rows.length"
    name="Deadlines"
    :icon="DeadlinesIcon"
    :title="__('No deadlines tracked yet')"
    :description="
      __('Two-tier SLA timers for Coordinators and Sales Representatives automatically record and monitor response times here.')
    "
    :filtered="!!Object.keys(deadlines.params?.filters || {}).length"
  />
</template>

<script setup>
import { computed, ref, onMounted } from 'vue'
import { Button, createResource } from 'frappe-ui'
import EmptyState from '@/components/ListViews/EmptyState.vue'
import LayoutHeader from '@/components/LayoutHeader.vue'
import ViewBreadcrumbs from '@/components/ViewBreadcrumbs.vue'
import ViewControls from '@/components/ViewControls.vue'
import DeadlinesListView from '@/components/ListViews/DeadlinesListView.vue'
import DeadlinesIcon from '@/components/Icons/DeadlinesIcon.vue'
import { getMeta } from '@/stores/meta'
import { viewsStore } from '@/stores/views'
import { globalStore } from '@/stores/global'

const { $socket } = globalStore()
const { getView } = viewsStore()
const currentView = computed(() => getView('Deadlines'))

const deadlines = ref({})
const deadlinesListView = ref(null)
const viewControls = ref(null)

const loadMore = ref(1)
const triggerResize = ref(1)
const updatedPageCount = ref(20)

// Quick Filter State
const activeFilterTab = ref('all')
const filterTabs = [
  { id: 'all', label: 'All Deadlines' },
  { id: 'active', label: 'Active' },
  { id: 'breached', label: 'Breached' },
  { id: 'coordinator', label: 'Coordinator Triage' },
  { id: 'sales_rep', label: 'Sales Rep Follow-up' },
  { id: 'fulfilled', label: 'Fulfilled' },
]

// KPI Resource
const metricsResource = createResource({
  url: 'crm.api.deadlines.get_deadline_metrics',
  auto: true,
})

const metrics = computed(() => metricsResource.data || {})

const rows = computed(() => {
  if (!deadlines.value?.data?.data) return []
  return deadlines.value.data.data
})

const columns = computed(() => {
  if (currentView.value?.columns?.length) {
    return currentView.value.columns
  }
  if (deadlines.value?.data?.columns?.length) {
    return deadlines.value.data.columns
  }
  const meta = getMeta('CRM Deadline')
  const defaultFields = [
    { key: 'lead_name', label: __('Lead Name'), width: '220px' },
    { key: 'tier', label: __('Tier'), width: '80px' },
    { key: 'stage', label: __('Stage'), width: '180px' },
    { key: 'assigned_to', label: __('Assigned To'), width: '160px' },
    { key: 'allotted_hours', label: __('Allotted'), width: '90px' },
    { key: 'deadline_at', label: __('Deadline'), width: '150px' },
    { key: 'status', label: __('Status'), width: '110px' },
    { key: 'time_taken_mins', label: __('Time Taken'), width: '110px' },
  ]
  return defaultFields.map((field) => ({
    ...field,
    ...meta?.fields?.find((f) => f.fieldname === field.key),
  }))
})

function setQuickFilter(tabId) {
  activeFilterTab.value = tabId
  const filterMap = {
    all: {},
    active: { status: 'Active' },
    breached: { status: 'Breached' },
    coordinator: { stage: 'Coordinator Triage' },
    sales_rep: { stage: 'Sales Rep Follow-up' },
    fulfilled: { status: 'Fulfilled' },
  }

  const targetFilter = filterMap[tabId] || {}
  if (deadlines.value?.params) {
    deadlines.value.params.filters = targetFilter
    deadlines.value.reload?.()
  }
}

function refreshData() {
  metricsResource.reload()
  deadlines.value?.reload?.()
}

function formatCoordinatorAvg(mins) {
  if (!mins) return '0 mins'
  if (mins < 60) return `${mins} mins`
  return `${(mins / 60).toFixed(1)} hrs`
}

function formatRepAvg(hours) {
  if (!hours) return '0 hrs'
  return `${hours} hrs`
}

onMounted(() => {
  if ($socket) {
    $socket.on('crm_deadline_updated', () => {
      refreshData()
    })
  }
})
</script>
