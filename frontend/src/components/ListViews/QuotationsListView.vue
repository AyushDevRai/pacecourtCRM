<!-- eslint-disable vue/no-v-html -->
<template>
  <ListView
    :columns="columns"
    :rows="rows"
    :options="{
      getRowRoute: (row) => ({
        name: 'Quotation',
        params: { quotationId: row.name },
      }),
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
      v-slot="{ idx, column, item, row }"
      class="mx-3 sm:mx-5"
      :rows="rows"
      doctype="CRM Quotation"
    >
      <ListRowItem :item="item" :align="column.align" class="overflow-hidden">
        <template #default="{ label }">
          <!-- Status Column with Semantic Zoho Badge -->
          <div v-if="column.key === 'status'" class="flex items-center">
            <Badge
              :label="item"
              :theme="statusTheme(item)"
              variant="subtle"
              size="sm"
            />
          </div>

          <!-- Name Column with Revision Badge -->
          <div v-else-if="column.key === 'name'" class="flex items-center gap-2 truncate font-mono font-medium text-[var(--pc-navy)]">
            <span class="truncate">{{ item }}</span>
            <Badge
              v-if="row.revision_number && row.revision_number > 0"
              :label="__('Rev {0}', [row.revision_number])"
              variant="outline"
              size="sm"
            />
          </div>

          <!-- Currency / Numbers in Geist Mono -->
          <div
            v-else-if="column.key === 'grand_total'"
            class="truncate text-base font-mono font-bold text-[var(--pc-navy)]"
          >
            {{ getLabel(label, column) }}
          </div>

          <!-- Dates in Geist Mono -->
          <div
            v-else-if="column.key === 'quotation_date' || column.key === 'valid_till'"
            class="truncate text-base font-mono text-[var(--pc-muted)]"
          >
            {{ getLabel(label, column) }}
          </div>

          <!-- Default Column Value -->
          <div
            v-else-if="label"
            class="truncate text-base"
            @click="
              (event) =>
                emit('applyFilter', {
                  event,
                  idx,
                  column,
                  item,
                  firstColumn: columns[0],
                })
            "
          >
            {{ getLabel(label, column) }}
          </div>
        </template>
      </ListRowItem>
    </ListRows>
  </ListView>
  <ListFooter
    v-model="pageLengthCount"
    class="border-t sm:px-5 px-3 py-2"
    :options="{
      rowCount: options.rowCount,
      totalCount: options.totalCount,
    }"
    @loadMore="emit('loadMore')"
  />
</template>

<script setup>
import ListRows from '@/components/ListViews/ListRows.vue'
import { Badge } from 'frappe-ui'
import {
  ListView,
  ListHeader,
  ListHeaderItem,
  ListRowItem,
  ListFooter,
} from 'frappe-ui/experimental'
import { computed } from 'vue'

const props = defineProps({
  rows: { type: Array, required: true },
  columns: { type: Array, required: true },
  options: { type: Object, default: () => ({}) },
})

const emit = defineEmits([
  'selectionsChanged',
  'columnWidthUpdated',
  'applyFilter',
  'loadMore',
  'updatePageCount',
])

const pageLengthCount = defineModel()

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

function getLabel(label, column) {
  return label
}

function onColumnWidthUpdated(event, column) {
  emit('columnWidthUpdated', { event, column })
}
</script>
