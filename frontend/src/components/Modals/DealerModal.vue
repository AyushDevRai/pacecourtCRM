<template>
  <Dialog v-model:open="show" :size="'xl'" bare>
    <template #default>
      <div class="px-4 pt-5 pb-6 bg-surface-elevation-2 sm:px-6">
        <div class="flex items-center justify-between mb-5">
          <div>
            <Dialog.Title as-child>
              <h3 class="text-3xl-semibold leading-6 text-ink-gray-9">
                {{ __('New Dealer') }}
              </h3>
            </Dialog.Title>
          </div>
          <div class="flex items-center gap-1">
            <Button
              v-if="isManager() && !isMobileView"
              variant="ghost"
              class="w-7"
              :tooltip="__('Edit Fields Layout')"
              :icon="EditIcon"
              @click="openQuickEntryModal"
            />
            <Dialog.Close as-child>
              <Button
                :aria-label="__('Close')"
                variant="ghost"
                class="w-7"
                icon="lucide-x"
              />
            </Dialog.Close>
          </div>
        </div>
        <FieldLayout
          v-if="tabs.data?.length"
          :tabs="tabs.data"
          :data="dealer.doc"
          doctype="CRM Dealer"
        />
        <ErrorMessage v-if="error" class="mt-8" :message="__(error)" />
      </div>
      <div class="px-4 pt-4 pb-7 sm:px-6">
        <div class="space-y-2">
          <Button
            class="w-full"
            variant="solid"
            :label="__('Create')"
            :loading="loading"
            @click="createDealer"
          />
        </div>
      </div>
    </template>
  </Dialog>
</template>

<script setup>
import FieldLayout from '@/components/FieldLayout/FieldLayout.vue'
import EditIcon from '@/components/Icons/EditIcon.vue'
import { usersStore } from '@/stores/users'
import { isMobileView } from '@/composables/settings'
import { showQuickEntryModal, quickEntryProps } from '@/composables/modals'
import { useDocument } from '@/data/document'
import { Dialog, call, createResource, Button, ErrorMessage, toast } from 'frappe-ui'
import { ref } from 'vue'

const props = defineProps({
  data: { type: Object, default: () => ({}) },
  options: {
    type: Object,
    default: () => ({ afterInsert: () => {} }),
  },
})

const emit = defineEmits(['created'])

const { isManager } = usersStore()
const show = defineModel({ type: Boolean })

const loading = ref(false)
const error = ref(null)

const { document: dealer, triggerOnBeforeCreate } = useDocument('CRM Dealer')

async function createDealer() {
  loading.value = true
  error.value = null

  await triggerOnBeforeCreate?.()

  try {
    const doc = await call('frappe.client.insert', {
      doc: {
        doctype: 'CRM Dealer',
        ...dealer.doc,
      },
    })
    loading.value = false
    if (doc.name) {
      toast.success(__('Dealer {0} created', [doc.dealer_name || doc.name]))
      show.value = false
      dealer.doc = {}
      emit('created', doc)
      props.options.afterInsert?.(doc)
    }
  } catch (err) {
    loading.value = false
    error.value =
      err.message || err.error?.messages?.[0] || __('Failed to create dealer')
    toast.error(error.value)
  }
}

const tabs = createResource({
  url: 'crm.fcrm.doctype.crm_fields_layout.crm_fields_layout.get_fields_layout',
  cache: ['QuickEntry', 'CRM Dealer'],
  params: { doctype: 'CRM Dealer', type: 'Quick Entry' },
  auto: true,
})

function openQuickEntryModal() {
  quickEntryProps.value = {
    doctype: 'CRM Dealer',
    tabs: tabs.data,
    onSuccess: () => tabs.reload(),
  }
  showQuickEntryModal.value = true
}
</script>
