<template>
  <div class="flex items-center gap-1">
    <router-link
      :to="{ name: routeName }"
      class="px-1 py-1 font-extrabold text-xl text-[var(--pc-navy)] tracking-tight flex items-center gap-1.5 focus:outline-none focus-visible:ring-2 focus-visible:ring-outline-gray-3 hover:opacity-90"
    >
      <span>{{ __(routeName) }}</span>
      <span class="inline-block size-2 rounded-full bg-[var(--pc-lime)] shrink-0" aria-hidden="true" />
    </router-link>
    <span
      v-if="viewControls && viewControls.viewsDropdownOptions"
      class="mx-1 text-sm text-[var(--pc-muted)]"
      aria-hidden="true"
    >
      /
    </span>
    <Dropdown
      v-if="viewControls && viewControls.viewsDropdownOptions"
      :options="viewControls.viewsDropdownOptions"
    >
      <template #default="{ open }">
        <Button
          variant="ghost"
          class="font-bold text-base text-[var(--pc-navy)] text-nowrap rounded-full hover:bg-[var(--pc-surface-2)]"
          :label="__(viewControls.currentView?.label)"
          :iconRight="open ? 'lucide-chevron-up' : 'lucide-chevron-down'"
        >
          <template #prefix>
            <Icon :icon="viewControls.currentView?.icon" class="h-4 text-[var(--pc-muted)]" />
          </template>
        </Button>
      </template>
      <template #item-suffix="{ item, close, selected }">
        <div v-if="item.name" class="flex flex-row-reverse gap-2 items-center">
          <Dropdown
            side="right"
            :offset="15"
            :options="viewControls.viewActions(item, close)"
          >
            <template #default>
              <Button
                variant="ghost"
                class="view-action-btn !size-5 opacity-0"
                icon="lucide-more-horizontal"
                @click.stop
              />
            </template>
          </Dropdown>
          <span
            v-if="selected"
            class="lucide-check size-4 text-ink-gray-7"
            aria-hidden="true"
          />
          <span v-if="item.isDefault" class="text-sm text-ink-gray-5">
            {{ __('Default') }}
          </span>
        </div>
      </template>
    </Dropdown>
  </div>
</template>
<script setup>
import Icon from '@/components/Icon.vue'
import { Dropdown } from 'frappe-ui'

defineProps({
  routeName: { type: String, required: true },
})

const viewControls = defineModel({ type: Object, default: () => ({}) })
</script>

<style scoped>
/* frappe-ui's Menu rewrite dropped the `group` class from item rows, so
   reveal the view actions on row hover/highlight instead of `group-hover`. */
[data-slot='item']:hover .view-action-btn,
[data-slot='item'][data-highlighted] .view-action-btn {
  opacity: 1;
}
</style>
