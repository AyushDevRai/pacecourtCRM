<template>
  <div class="h-full w-full p-4 sm:p-6 overflow-auto bg-surface-base flex flex-col">
    <div class="max-w-5xl w-full mx-auto flex-1 flex flex-col">
      <DataImportWizard
        v-if="dataImport"
        :dataImport="dataImport"
        :onOpenList="handleOpenList"
        :onNewImport="handleNewImport"
        @open-record="handleOpenRecord"
        @open-imports="handleOpenImports"
      />
    </div>
  </div>
</template>

<script setup>
import { usePageMeta } from 'frappe-ui'
import { DataImportWizard, useDataImport } from '@framework/ui/components/DataImport'
import { useRoute, useRouter } from 'vue-router'
import { getSettings } from '@/stores/settings'
import { ref, computed, watch } from 'vue'

const route = useRoute()
const router = useRouter()
const { brand } = getSettings()

const importName = ref(route.params.importName ?? null)

watch(
  () => route.params.importName,
  (val) => {
    if (val !== importName.value) {
      importName.value = val ?? null
    }
  }
)

watch(importName, (next) => {
  if (next && next !== route.params.importName) {
    router.replace({ params: { ...route.params, importName: next } })
  }
})

const doctype = computed(() => route.params.doctype || undefined)
const dataImport = useDataImport(importName, { doctype })

const doctypeMap = {
  'CRM Lead': {
    title: 'Leads',
    listRoute: '/leads',
    pageRoute: '/leads/docname',
  },
  'CRM Deal': {
    title: 'Deals',
    listRoute: '/deals',
    pageRoute: '/deals/docname',
  },
  'CRM Quotation': {
    title: 'Quotations',
    listRoute: '/quotations',
    pageRoute: '/quotations/docname',
  },
  Contact: {
    title: 'Contacts',
    listRoute: '/contacts',
    pageRoute: '/contacts/docname',
  },
  'CRM Task': {
    title: 'Tasks',
    listRoute: '/tasks',
  },
  'CRM Organization': {
    title: 'Organizations',
    listRoute: '/organizations',
    pageRoute: '/organizations/docname',
  },
  'CRM Dealer': {
    title: 'Dealers',
    listRoute: '/dealers',
  },
  'CRM Call Log': {
    title: 'Call Log',
    listRoute: '/call-logs',
  },
}

function handleOpenList(dt) {
  const target = doctypeMap[dt]?.listRoute || '/dealers'
  router.push(target)
}

function handleNewImport(dt) {
  if (dt) {
    router.push(`/data-import/doctype/${dt}`)
  } else {
    router.push('/data-import')
  }
}

function handleOpenRecord(dt, docname) {
  const pageRoute = doctypeMap[dt]?.pageRoute
  if (pageRoute && docname) {
    router.push(pageRoute.replace('docname', docname))
  } else {
    handleOpenList(dt)
  }
}

function handleOpenImports(dt) {
  if (dt) {
    router.push(`/data-import?doctype=${dt}`)
  } else {
    router.push('/data-import')
  }
}

usePageMeta(() => {
  return {
    title: __('Data Import'),
    icon: brand.favicon,
  }
})
</script>
