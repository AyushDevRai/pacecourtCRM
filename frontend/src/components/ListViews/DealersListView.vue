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
      doctype="CRM Dealer"
    >
      <ListRowItem :item="item" :align="column.align" class="overflow-hidden">
        <template #default="{ label }">
          <div v-if="column.key === 'dealer_name'" class="flex items-center gap-2">
            <span class="font-bold text-[var(--pc-navy)] text-base">{{ label }}</span>
          </div>
          <div v-else-if="column.key === 'tier'">
            <span class="inline-flex items-center px-2.5 py-0.5 rounded-full text-xs font-semibold bg-[#F0E9FB] text-[#6A4BA8]">
              {{ label }}
            </span>
          </div>
          <div v-else-if="column.key === 'status'">
            <span
              class="inline-flex items-center px-2.5 py-0.5 rounded-full text-xs font-semibold"
              :class="label === 'Active' ? 'bg-[#EEF6DA] text-[#5F7F17]' : 'bg-[#FBECEB] text-[#A4342A]'"
            >
              {{ label }}
            </span>
          </div>
          <div v-else-if="column.key === 'mobile_no'" class="text-ink-gray-8">
            <a v-if="label" :href="`tel:${label}`" class="hover:underline flex items-center gap-1 font-mono text-[var(--pc-ink)]">
              {{ label }}
            </a>
            <span v-else>-</span>
          </div>
          <div v-else class="truncate text-ink-gray-7">
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
import { Badge } from 'frappe-ui'
import {
  ListFooter,
  ListHeader,
  ListHeaderItem,
  ListRowItem,
  ListView,
} from 'frappe-ui/experimental'
import ListRows from '@/components/ListViews/ListRows.vue'

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
</script>
