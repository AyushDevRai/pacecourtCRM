<template>
  <ListView
    :columns="columns"
    :rows="rows"
    :options="{
      selectable: options.selectable,
      showTooltip: options.showTooltip,
      resizeColumn: options.resizeColumn,
    }"
    row-key="name"
    @update:selections="(selections) => emit('selectionsChanged', selections)"
  >
    <ListHeader
      class="sm:mx-5 mx-3"
      @columnWidthUpdated="emit('columnWidthUpdated')"
    >
      <ListHeaderItem
        v-for="column in columns"
        :key="column.key"
        :item="column"
        @columnWidthUpdated="(e) => onColumnWidthUpdated(e, column)"
      />
    </ListHeader>
    <ListRows
      v-slot="{ column, item, row }"
      class="mx-3 sm:mx-5"
      :rows="rows"
      doctype="CRM Deadline"
    >
      <ListRowItem :item="item" :align="column.align" class="overflow-hidden">
        <template #default="{ label }">
          <!-- Lead Name Column -->
          <div v-if="column.key === 'lead_name'" class="flex items-center gap-2">
            <router-link
              v-if="row.lead"
              :to="{ name: 'Lead', params: { leadId: row.lead } }"
              class="font-bold text-[var(--pc-ink-heading)] text-base hover:underline hover:text-[var(--pc-lime-dark)] transition-colors"
            >
              {{ label || row.lead_name || row.lead }}
            </router-link>
            <span v-else class="font-bold text-[var(--pc-ink-heading)] text-base">{{ label || row.lead_name || '-' }}</span>
          </div>

          <!-- Tier Column -->
          <div v-else-if="column.key === 'tier'">
            <span
              v-if="label || row.tier"
              class="inline-flex items-center px-2.5 py-0.5 rounded-full text-xs font-semibold bg-[#F0E9FB] text-[#6A4BA8] border border-[#DDD6FE] dark:bg-[rgba(139,92,246,0.18)] dark:text-[#c4b5fd] dark:border-[rgba(139,92,246,0.3)]"
            >
              {{ label || row.tier }}
            </span>
            <span v-else class="text-[var(--pc-muted)]">-</span>
          </div>

          <!-- Stage Column -->
          <div v-else-if="column.key === 'stage'">
            <span
              class="inline-flex items-center px-2.5 py-0.5 rounded-full text-xs font-medium"
              :class="getStageStyle(label || row.stage).className"
            >
              {{ label || row.stage }}
            </span>
          </div>

          <!-- Assigned To Column -->
          <div v-else-if="column.key === 'assigned_to'" class="flex items-center gap-2 truncate">
            <Avatar
              v-if="label || row.assigned_to"
              size="sm"
              :label="label || row.assigned_to"
              class="shrink-0"
            />
            <span class="truncate text-[var(--pc-ink)]">{{ label || row.assigned_to || '-' }}</span>
          </div>

          <!-- Allotted Hours Column -->
          <div v-else-if="column.key === 'allotted_hours'" class="font-mono text-sm text-[var(--pc-ink)]">
            {{ formatAllotted(label ?? row.allotted_hours) }}
          </div>

          <!-- Target Deadline Column -->
          <div v-else-if="column.key === 'deadline_at'" class="text-xs text-[var(--pc-muted)]">
            {{ formatDeadline(label ?? row.deadline_at) }}
          </div>

          <!-- Status Column -->
          <div v-else-if="column.key === 'status'">
            <span
              class="inline-flex items-center px-2.5 py-0.5 rounded-full text-xs font-semibold"
              :class="getStatusBadge(row).className"
            >
              {{ getStatusBadge(row).label }}
            </span>
          </div>

          <!-- Actual Time Taken Column -->
          <div v-else-if="column.key === 'time_taken_mins'" class="font-mono text-sm text-[var(--pc-ink)]">
            {{ formatDurationMins(label ?? row.time_taken_mins) }}
          </div>

          <!-- Default Fallback -->
          <div v-else class="truncate text-[var(--pc-muted)]">
            {{ label || '-' }}
          </div>
        </template>
      </ListRowItem>
    </ListRows>
    <ListFooter
      class="border-t sm:px-5 px-3 py-2"
      :model-value="pageLengthCount"
      :options="{
        rowCount: options.rowCount,
        totalCount: options.totalCount,
      }"
      @loadMore="emit('loadMore')"
      @update:model-value="(val) => emit('updatePageCount', val)"
    />
  </ListView>
</template>

<script setup>
import { Avatar } from 'frappe-ui'
import {
  ListFooter,
  ListHeader,
  ListHeaderItem,
  ListRowItem,
  ListView,
} from 'frappe-ui/experimental'
import ListRows from '@/components/ListViews/ListRows.vue'
import {
  formatDurationMins,
  formatAllottedHours,
  getStageBadge,
  getDeadlineStatusInfo,
} from '@/utils/deadlines'
import { formatDate } from '@/utils'

const props = defineProps({
  rows: { type: Array, required: true },
  columns: { type: Array, required: true },
  options: { type: Object, default: () => ({}) },
})

const emit = defineEmits([
  'selectionsChanged',
  'columnWidthUpdated',
  'loadMore',
  'updatePageCount',
])

const pageLengthCount = defineModel()

function onColumnWidthUpdated({ event, column }) {
  emit('columnWidthUpdated', { event, column })
}

function getStageStyle(stage) {
  return getStageBadge(stage)
}

function getStatusBadge(row) {
  return getDeadlineStatusInfo(row.status, row.deadline_at)
}

function formatAllotted(val) {
  return formatAllottedHours(val)
}

function formatDeadline(dateVal) {
  if (!dateVal) return '-'
  return formatDate(dateVal, '', true, true)
}
</script>
