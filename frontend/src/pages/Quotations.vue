<template>
  <LayoutHeader>
    <template #left-header>
      <ViewBreadcrumbs v-model="viewControls" routeName="Quotations" />
    </template>
    <template #right-header>
      <Button
        variant="solid"
        :label="__('Create')"
        iconLeft="lucide-plus"
        @click="showQuotationModal = true"
      />
    </template>
  </LayoutHeader>
  <ViewControls
    ref="viewControls"
    v-model="quotations"
    v-model:loadMore="loadMore"
    v-model:resizeColumn="triggerResize"
    v-model:updatedPageCount="updatedPageCount"
    doctype="CRM Quotation"
  />
  <QuotationsListView
    v-if="quotations.data && rows.length"
    ref="quotationsListView"
    v-model="quotations.data.page_length_count"
    v-model:list="quotations"
    :rows="rows"
    :columns="columns"
    :options="{
      showTooltip: false,
      resizeColumn: true,
      rowCount: quotations.data.row_count,
      totalCount: quotations.data.total_count,
    }"
    @loadMore="() => loadMore++"
    @columnWidthUpdated="() => triggerResize++"
    @updatePageCount="(count) => (updatedPageCount = count)"
    @applyFilter="(data) => viewControls.applyFilter(data)"
    @selectionsChanged="
      (selections) => viewControls.updateSelections(selections)
    "
  />
  <EmptyState
    v-else-if="quotations.data && !rows.length"
    name="Quotations"
    :icon="FileTextIcon"
    :title="__('No quotations yet')"
    :description="
      __('Create professional quotes and proposals for your leads and deals.')
    "
    :filtered="!!Object.keys(quotations.params?.filters || {}).length"
    importDoctype="CRM Quotation"
    @create="showQuotationModal = true"
  />
  <QuotationModal
    v-if="showQuotationModal"
    v-model="showQuotationModal"
  />
</template>

<script setup>
import ViewBreadcrumbs from '@/components/ViewBreadcrumbs.vue'
import FileTextIcon from '@/components/Icons/FileTextIcon.vue'
import LayoutHeader from '@/components/LayoutHeader.vue'
import QuotationModal from '@/components/Modals/QuotationModal.vue'
import QuotationsListView from '@/components/ListViews/QuotationsListView.vue'
import ViewControls from '@/components/ViewControls.vue'
import { getMeta } from '@/stores/meta'
import { formatDate } from '@/utils'
import { timestampCell } from '@/composables/useTimelinePreferences'
import { ref, computed } from 'vue'
import EmptyState from '@/components/ListViews/EmptyState.vue'

const { getFormattedPercent, getFormattedFloat, getFormattedCurrency } =
  getMeta('CRM Quotation')

const quotationsListView = ref(null)
const showQuotationModal = ref(false)

const quotations = ref({})
const loadMore = ref(1)
const triggerResize = ref(1)
const updatedPageCount = ref(20)
const viewControls = ref(null)

const rows = computed(() => {
  if (
    !quotations.value?.data?.data ||
    !['list', 'group_by'].includes(quotations.value.data.view_type)
  )
    return []

  return quotations.value?.data.data.map((quote) => {
    let _rows = {}
    quotations.value?.data.rows.forEach((row) => {
      _rows[row] = quote[row]

      let fieldType = quotations.value?.data.columns?.find(
        (col) => (col.key || col.value) == row,
      )?.type

      if (
        fieldType &&
        ['Date', 'Datetime'].includes(fieldType) &&
        !['modified', 'creation'].includes(row)
      ) {
        _rows[row] = formatDate(
          quote[row],
          '',
          true,
          fieldType == 'Datetime',
        )
      }

      if (fieldType && fieldType == 'Currency') {
        _rows[row] = getFormattedCurrency(row, quote)
      }

      if (fieldType && fieldType == 'Float') {
        _rows[row] = getFormattedFloat(row, quote)
      }

      if (fieldType && fieldType == 'Percent') {
        _rows[row] = getFormattedPercent(row, quote)
      }

      if (['modified', 'creation'].includes(row)) {
        _rows[row] = timestampCell(quote[row])
      }
    })
    return _rows
  })
})

const columns = computed(() => {
  let _columns = quotations.value?.data?.columns || []

  if (_columns.length) {
    _columns = _columns.map((col, index) => {
      if (index === _columns.length - 1) {
        return { ...col, align: 'right' }
      }
      return col
    })
  }

  return _columns
})
</script>

