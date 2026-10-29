<template>
  <Dialog v-model:open="show" :size="'3xl'" bare>
    <template #default>
      <div class="px-4 pt-5 pb-6 bg-surface-elevation-2 sm:px-6">
        <div class="flex items-center justify-between mb-5">
          <Dialog.Title as-child>
            <h3 class="text-2xl font-bold text-ink-gray-9">
              {{ __('Create Quotation') }}
            </h3>
          </Dialog.Title>
          <Dialog.Close as-child>
            <Button variant="ghost" class="w-7" icon="lucide-x" />
          </Dialog.Close>
        </div>

        <div class="space-y-4">
          <!-- Main Details -->
          <div class="grid grid-cols-1 sm:grid-cols-2 gap-4">
            <div>
              <label class="block text-xs font-semibold uppercase text-ink-gray-5 mb-1">
                {{ __('Subject / Title') }} *
              </label>
              <TextInput
                v-model="form.title"
                :placeholder="__('e.g. Turnkey Acrylic Tennis Court')"
                required
              />
            </div>
            <div>
              <label class="block text-xs font-semibold uppercase text-ink-gray-5 mb-1">
                {{ __('Deal Reference') }}
              </label>
              <TextInput
                v-model="form.deal"
                :placeholder="__('CRM Deal name')"
              />
            </div>
            <div>
              <label class="block text-xs font-semibold uppercase text-ink-gray-5 mb-1">
                {{ __('Organization / Client') }}
              </label>
              <TextInput
                v-model="form.organization"
                :placeholder="__('Client Organization')"
              />
            </div>
            <div>
              <label class="block text-xs font-semibold uppercase text-ink-gray-5 mb-1">
                {{ __('Valid Till') }}
              </label>
              <TextInput
                v-model="form.valid_till"
                type="date"
              />
            </div>
          </div>

          <!-- Items Table -->
          <div class="mt-4 border border-outline-elevation-2 rounded-lg p-3 bg-surface-gray-1">
            <div class="flex items-center justify-between mb-2">
              <span class="text-sm font-semibold text-ink-gray-8">
                {{ __('Line Items ({0})', [form.items.length]) }}
              </span>
              <Button
                variant="subtle"
                size="sm"
                iconLeft="lucide-plus"
                @click="addItem"
              >
                {{ __('Add Item') }}
              </Button>
            </div>

            <div class="space-y-2">
              <div
                v-for="(item, idx) in form.items"
                :key="idx"
                class="grid grid-cols-12 gap-2 items-center bg-surface-white p-2.5 rounded border border-outline-elevation-1"
              >
                <div class="col-span-5">
                  <label class="block text-[10px] uppercase text-ink-gray-4 mb-0.5">{{ __('Product / Description') }}</label>
                  <TextInput
                    v-model="item.product_name"
                    size="sm"
                    :placeholder="__('Item description')"
                  />
                </div>
                <div class="col-span-2">
                  <label class="block text-[10px] uppercase text-ink-gray-4 mb-0.5">{{ __('Qty') }}</label>
                  <TextInput
                    v-model.number="item.qty"
                    type="number"
                    size="sm"
                  />
                </div>
                <div class="col-span-2">
                  <label class="block text-[10px] uppercase text-ink-gray-4 mb-0.5">{{ __('Rate (₹)') }}</label>
                  <TextInput
                    v-model.number="item.rate"
                    type="number"
                    size="sm"
                  />
                </div>
                <div class="col-span-2 text-right">
                  <label class="block text-[10px] uppercase text-ink-gray-4 mb-0.5">{{ __('Total') }}</label>
                  <div class="text-xs font-semibold text-ink-gray-9 mt-1.5 tabular-nums">
                    ₹ {{ (Number(item.qty || 0) * Number(item.rate || 0)).toLocaleString() }}
                  </div>
                </div>
                <div class="col-span-1 text-center">
                  <label class="block text-[10px] uppercase text-transparent mb-0.5">X</label>
                  <Button
                    variant="ghost"
                    size="sm"
                    icon="lucide-trash-2"
                    class="text-ink-red-3 hover:text-ink-red-4"
                    :disabled="form.items.length === 1"
                    @click="removeItem(idx)"
                  />
                </div>
              </div>
            </div>

            <!-- Financial Summary Preview -->
            <div class="mt-3 pt-3 border-t border-outline-elevation-2 flex justify-between items-center text-sm">
              <div class="text-ink-gray-5">
                {{ __('Standard 18% GST auto-applied on save') }}
              </div>
              <div class="text-right">
                <span class="text-ink-gray-6 mr-2">{{ __('Estimated Grand Total:') }}</span>
                <span class="text-base font-bold font-mono text-[var(--pc-navy)]">
                  ₹ {{ estimatedTotal.toLocaleString() }}
                </span>
              </div>
            </div>
          </div>
        </div>

        <ErrorMessage v-if="error" class="mt-4" :message="error" />
      </div>

      <div class="px-4 py-3 bg-surface-gray-2 flex justify-end gap-2 border-t sm:px-6">
        <Button
          variant="subtle"
          :label="__('Cancel')"
          @click="show = false"
        />
        <Button
          variant="solid"
          :label="__('Create Quotation')"
          :loading="loading"
          @click="createQuotation"
        />
      </div>
    </template>
  </Dialog>
</template>

<script setup>
import { Button, Dialog, ErrorMessage, TextInput, call, toast } from 'frappe-ui'
import { computed, reactive, ref } from 'vue'
import { useRouter } from 'vue-router'

const show = defineModel()
const router = useRouter()

const loading = ref(false)
const error = ref('')

const form = reactive({
  title: '',
  deal: '',
  organization: '',
  valid_till: new Date(Date.now() + 30 * 86400000).toISOString().split('T')[0],
  items: [
    { product_name: 'Pacecourt Synthetic Acrylic Resurfacer', qty: 1000, rate: 45, tax_rate: 18 },
  ],
})

function addItem() {
  form.items.push({ product_name: '', qty: 1, rate: 0, tax_rate: 18 })
}

function removeItem(idx) {
  if (form.items.length > 1) {
    form.items.splice(idx, 1)
  }
}

const estimatedTotal = computed(() => {
  const subtotal = form.items.reduce((acc, i) => acc + (Number(i.qty || 0) * Number(i.rate || 0)), 0)
  return Math.round(subtotal * 1.18)
})

async function createQuotation() {
  if (!form.title) {
    error.value = 'Please provide a Title / Subject'
    return
  }
  if (!form.items.length || !form.items[0].product_name) {
    error.value = 'Please provide at least one valid line item'
    return
  }

  loading.value = true
  error.value = ''

  try {
    const doc = {
      doctype: 'CRM Quotation',
      title: form.title,
      deal: form.deal || null,
      organization: form.organization || null,
      valid_till: form.valid_till,
      status: 'Draft',
      items: form.items.map((i) => ({
        doctype: 'CRM Quotation Item',
        product_name: i.product_name,
        qty: Number(i.qty) || 1,
        rate: Number(i.rate) || 0,
        tax_rate: 18,
      })),
    }

    const res = await call('frappe.client.insert', { doc })
    if (res && res.name) {
      toast.success(`Quotation ${res.name} created!`)
      show.value = false
      router.push({ name: 'Quotation', params: { quotationId: res.name } })
    }
  } catch (err) {
    error.value = err.message || 'Failed to create quotation'
  } finally {
    loading.value = false
  }
}
</script>

