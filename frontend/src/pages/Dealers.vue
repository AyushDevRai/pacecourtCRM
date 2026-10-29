<template>
  <LayoutHeader>
    <template #left-header>
      <ViewBreadcrumbs v-model="viewControls" routeName="Dealers" />
    </template>
    <template #right-header>
      <Button
        variant="solid"
        :label="__('Create Dealer')"
        iconLeft="lucide-plus"
        @click="showDealerModal = true"
      />
    </template>
  </LayoutHeader>
  <ViewControls
    ref="viewControls"
    v-model="dealers"
    v-model:loadMore="loadMore"
    v-model:resizeColumn="triggerResize"
    v-model:updatedPageCount="updatedPageCount"
    doctype="CRM Dealer"
  />
  <DealersListView
    v-if="dealers.data && rows.length"
    ref="dealersListView"
    v-model="dealers.data.page_length_count"
    v-model:list="dealers"
    :rows="rows"
    :columns="columns"
    :options="{
      showTooltip: false,
      resizeColumn: true,
      rowCount: dealers.data.row_count,
      totalCount: dealers.data.total_count,
    }"
    @loadMore="() => loadMore++"
    @columnWidthUpdated="() => triggerResize++"
    @updatePageCount="(count) => (updatedPageCount = count)"
    @applyFilter="(data) => viewControls.applyFilter(data)"
    @selectionsChanged="(selections) => viewControls.updateSelections(selections)"
  />
  <EmptyState
    v-else-if="dealers.data && !rows.length"
    name="Dealers"
    :icon="DealersIcon"
    :title="__('No dealers yet')"
    :description="
      __('Manage your authorized applicators, direct dealers, and distributors.')
    "
    :filtered="!!Object.keys(dealers.params?.filters || {}).length"
    importDoctype="CRM Dealer"
    :onCreate="() => (showDealerModal = true)"
    @create="showDealerModal = true"
  />
  <DealerModal
    v-if="showDealerModal"
    v-model="showDealerModal"
    @created="dealers.reload()"
  />
</template>

<script setup>
import EmptyState from '@/components/ListViews/EmptyState.vue'
import LayoutHeader from '@/components/LayoutHeader.vue'
import ViewBreadcrumbs from '@/components/ViewBreadcrumbs.vue'
import ViewControls from '@/components/ViewControls.vue'
import DealersListView from '@/components/ListViews/DealersListView.vue'
import DealerModal from '@/components/Modals/DealerModal.vue'
import DealersIcon from '@/components/Icons/DealersIcon.vue'
import { getMeta } from '@/stores/meta'
import { viewsStore } from '@/stores/views'
import { globalStore } from '@/stores/global'
import { Button, usePageMeta } from 'frappe-ui'
import { computed, onMounted, ref } from 'vue'

const { $socket } = globalStore()
const { getView } = viewsStore()
const currentView = computed(() => getView('Dealers'))

const dealers = ref({})
const dealersListView = ref(null)
const viewControls = ref(null)
const showDealerModal = ref(false)

const loadMore = ref(1)
const triggerResize = ref(1)
const updatedPageCount = ref(20)

const rows = computed(() => {
  if (!dealers.value?.data?.data) return []
  return dealers.value.data.data
})

const columns = computed(() => {
  if (currentView.value?.columns?.length) {
    return currentView.value.columns
  }
  const meta = getMeta('CRM Dealer')
  const defaultFields = [
    { key: 'dealer_name', label: __('Dealer Name'), width: '220px' },
    { key: 'contact_person', label: __('Contact Person'), width: '160px' },
    { key: 'mobile_no', label: __('Mobile No.'), width: '150px' },
    { key: 'city', label: __('City'), width: '130px' },
    { key: 'tier', label: __('Tier'), width: '160px' },
    { key: 'status', label: __('Status'), width: '100px' },
  ]
  return defaultFields
})

usePageMeta(() => ({
  title: __('Dealers'),
}))
</script>
