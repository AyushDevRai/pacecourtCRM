<template>
  <div class="flex flex-col">
    <Dropdown :options="dropdownItems" v-bind="$attrs">
      <template #default="{ open }">
        <button
          class="flex items-center rounded-xl p-2 duration-300 ease-in-out text-left"
          :class="
            isCollapsed
              ? 'w-auto px-0 justify-center'
              : open
                ? 'w-full bg-surface-gray-2 shadow-sm'
                : 'w-full hover:bg-surface-gray-2'
          "
        >
          <BrandLogo v-model="brand" class="size-8 shrink-0" />
          <div
            class="flex flex-1 flex-col text-left duration-300 ease-in-out truncate"
            :class="
              isCollapsed
                ? 'ml-0 w-0 overflow-hidden opacity-0'
                : 'ml-2.5 w-auto opacity-100'
            "
          >
            <div class="text-[15px] font-extrabold tracking-tight text-[var(--pc-navy)] leading-tight flex items-center gap-1.5">
              <span>{{ brand.name || 'PACECOURT' }}</span>
            </div>
            <div class="text-[11px] font-medium text-[var(--pc-muted)] truncate">
              {{ user.full_name }}
            </div>
          </div>
          <div
            v-if="!isCollapsed"
            class="duration-300 ease-in-out ml-1 text-ink-gray-5"
          >
            <span
              class="lucide-chevron-down size-4"
              aria-hidden="true"
            />
          </div>
        </button>
      </template>
    </Dropdown>
    <div
      v-if="!isCollapsed"
      class="mt-2.5 px-2 pb-1 duration-300 ease-in-out"
    >
      <div class="text-[11px] leading-tight text-[var(--pc-muted)] font-normal">
        Smarter marketing insights for faster, better decisions.
      </div>
      <div class="mt-2 h-[3px] w-12 rounded-full bg-gradient-to-r from-[#0F0F0F] to-[var(--pc-lime)]" />
    </div>
  </div>
</template>

<script setup>
import BrandLogo from '@/components/BrandLogo.vue'
import FrappeCloudIcon from '@/components/Icons/FrappeCloudIcon.vue'
import AppsIcon from '@/components/Icons/AppsIcon.vue'
import { sessionStore } from '@/stores/session'
import { usersStore } from '@/stores/users'
import { getSettings } from '@/stores/settings'
import { showSettings, isMobileView } from '@/composables/settings'
import { showAboutModal } from '@/composables/modals'
import { confirmLoginToFrappeCloud } from '@/composables/frappecloud'
import { spriteIcon } from '@/utils/spriteIcon'
import { createResource, Dropdown } from 'frappe-ui'
import { computed, h, markRaw } from 'vue'

defineProps({
  isCollapsed: { type: Boolean, default: false },
})

const { settings, brand } = getSettings()
const { logout } = sessionStore()
const { getUser } = usersStore()

const user = computed(() => getUser() || {})

const apps = createResource({
  url: 'frappe.apps.get_apps',
  cache: 'apps',
  auto: true,
  transform: (data) => [deskApp(), ...crmSiblingApps(data)],
})

const dropdownItems = computed(() => {
  if (!settings.value?.dropdown_items) return []

  let items = settings.value.dropdown_items

  let _dropdownItems = [
    {
      group: 'Dropdown Items',
      hideLabel: true,
      options: [],
    },
  ]

  items.forEach((item) => {
    if (item.hidden) return
    if (item.type !== 'Separator') {
      _dropdownItems[_dropdownItems.length - 1].options.push(
        dropdownItemObj(item),
      )
    } else {
      _dropdownItems.push({
        group: '',
        hideLabel: true,
        options: [],
      })
    }
  })

  return _dropdownItems
})

function dropdownItemObj(item) {
  let _item = JSON.parse(JSON.stringify(item))
  let icon = _item.icon || 'external-link'
  if (typeof icon === 'string' && icon.startsWith('<svg')) {
    icon = markRaw(h('div', { innerHTML: icon }))
  }
  _item.icon = spriteIcon(icon)

  if (_item.is_standard) {
    return getStandardItem(_item)
  }

  return {
    icon: _item.icon,
    label: __(_item.label),
    onClick: () =>
      window.open(_item.route, _item.open_in_new_window ? '_blank' : ''),
  }
}

function getStandardItem(item) {
  switch (item.name1) {
    case 'app_selector':
      return {
        icon: markRaw(AppsIcon),
        label: __(item.label),
        submenu: appMenuItems(),
      }
    case 'settings':
      return {
        icon: item.icon,
        label: __(item.label),
        onClick: () => (showSettings.value = true),
        condition: () => !isMobileView.value,
      }
    case 'login_to_fc':
      return {
        icon: h(FrappeCloudIcon),
        label: __(item.label),
        onClick: () => confirmLoginToFrappeCloud(),
        condition: () => false,
      }
    case 'about':
      return {
        icon: item.icon,
        label: __(item.label),
        onClick: () => (showAboutModal.value = true),
      }
    case 'logout':
      return {
        icon: item.icon,
        label: __(item.label),
        onClick: () => logout.submit(),
      }
  }
}

function appMenuItems() {
  return (apps.data || []).map((app) => ({
    label: app.title,
    onClick: () => (window.location.href = app.route),
    slots: {
      prefix: () => h('img', { class: 'size-5 rounded-4', src: app.logo }),
    },
  }))
}

function deskApp() {
  return {
    name: 'frappe',
    logo: '/assets/frappe/images/framework.png',
    title: __('Desk'),
    route: '/desk',
  }
}

function crmSiblingApps(data) {
  return data
    .filter((app) => app.name !== 'crm')
    .map((app) => ({
      name: app.name,
      logo: app.logo,
      title: __(app.title),
      route: app.route,
    }))
}
</script>
