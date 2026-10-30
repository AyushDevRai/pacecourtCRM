<!-- eslint-disable vue/no-v-html -->
<template>
  <Teleport to="body">
    <Transition name="fade">
      <div v-if="visible" class="fixed inset-0 z-50 overflow-hidden">
        <!-- Fullscreen Backdrop: Clicking anywhere outside closes the panel immediately -->
        <div
          class="fixed inset-0 bg-black/35 backdrop-blur-[2px] transition-opacity cursor-pointer"
          @click.stop="close"
        />

        <!-- Floating Notification Card following Pacecourt design -->
        <Transition name="slide-fade">
          <div
            v-if="visible"
            ref="target"
            class="fixed top-3 bottom-3 z-50 h-[calc(100vh-24px)] w-[410px] max-w-[92vw] bg-[var(--pc-surface)] border border-[var(--pc-border)] rounded-[22px] shadow-2xl flex flex-col overflow-hidden text-[var(--pc-ink)]"
            :style="{ left: panelLeftOffset }"
            @click.stop
          >
            <!-- Top Pacecourt Lime Accent Bar -->
            <div class="h-[3px] w-full shrink-0 bg-gradient-to-r from-[#A3D858] to-[#5F7F17]" />

            <!-- Header -->
            <div class="flex justify-between items-center border-b border-[var(--pc-border)] px-4 py-3 bg-[var(--pc-surface)] shrink-0">
              <div class="flex items-center gap-2">
                <span class="font-bold text-base text-[var(--pc-ink-heading)]">
                  {{ __('Notifications') }}
                </span>
                <span
                  v-if="notifications.data?.length"
                  class="px-2 py-0.5 rounded-full text-xs font-semibold bg-[var(--pc-lime-tint)] text-[var(--pc-lime-dark)] dark:bg-[rgba(180,224,67,0.18)] dark:text-[#b4e043]"
                >
                  {{ notifications.data.length }}
                </span>
              </div>

              <div class="flex items-center gap-1">
                <Button
                  v-if="notifications.data?.length"
                  :tooltip="__('Mark all as read')"
                  :icon="MarkAsDoneIcon"
                  variant="ghost"
                  @click="markAllAsRead"
                />
                <Button
                  v-if="notifications.data?.length"
                  :tooltip="__('Clear all notifications')"
                  icon="lucide-trash-2"
                  variant="ghost"
                  theme="red"
                  @click="onClearAll"
                />
                <Button
                  :tooltip="__('Close')"
                  icon="lucide-x"
                  variant="ghost"
                  @click="close"
                />
              </div>
            </div>

            <!-- Body list -->
            <div class="flex-1 overflow-y-auto">
              <div
                v-if="notifications.data?.length"
                class="divide-y divide-[var(--pc-border-soft)] text-sm"
              >
                <div
                  v-for="n in notifications.data"
                  :key="n.name || n.comment"
                  class="group relative flex items-start gap-3 px-4 py-3 hover:bg-[var(--pc-surface-subtle)] transition-colors cursor-pointer"
                  @click="handleNotificationClick(n)"
                >
                  <div class="mt-1 flex items-center gap-2 shrink-0">
                    <div
                      class="size-2 rounded-full shrink-0"
                      :class="[n.read ? 'bg-transparent' : 'bg-[var(--pc-lime)] shadow-xs']"
                    />
                    <WhatsAppIcon v-if="n.type == 'WhatsApp'" class="size-6" />
                    <UserAvatar v-else-if="n.from_user?.name" :user="n.from_user.name" size="md" />
                  </div>

                  <div class="flex-1 pr-6 min-w-0">
                    <div
                      v-if="n.notification_text"
                      class="text-xs text-[var(--pc-ink)] leading-relaxed"
                      v-html="sanitizeHTML(n.notification_text)"
                    />
                    <div v-else class="text-xs text-[var(--pc-muted)] leading-relaxed">
                      <span class="font-semibold text-[var(--pc-ink)]">
                        {{ n.from_user?.full_name || 'System' }}
                      </span>
                      <span>
                        {{ __('mentioned you in {0}', [n.reference_doctype]) }}
                      </span>
                      <span class="font-semibold text-[var(--pc-ink)]">
                        {{ n.reference_name }}
                      </span>
                    </div>
                    <div class="text-[11px] text-[var(--pc-muted-2)] mt-1 font-mono">
                      {{ __(timeAgo(n.creation)) }}
                    </div>
                  </div>

                  <!-- Delete single button on hover -->
                  <button
                    v-if="n.name"
                    class="absolute right-3 top-3 opacity-0 group-hover:opacity-100 p-1 rounded-md text-[var(--pc-muted)] hover:text-red-500 hover:bg-red-500/10 transition-all cursor-pointer"
                    :title="__('Delete notification')"
                    @click.stop="onClearSingle(n.name)"
                  >
                    <span class="lucide-x size-3.5 block" />
                  </button>
                </div>
              </div>

              <EmptyState
                v-else
                :title="__('No Notifications')"
                :description="__('You are all caught up!')"
                :icon="NotificationsIcon"
                class="h-full flex items-center justify-center p-6"
              />
            </div>
          </div>
        </Transition>
      </div>
    </Transition>
  </Teleport>
</template>

<script setup>
import { ref, watch, onMounted, onBeforeUnmount } from 'vue'
import { useRouter } from 'vue-router'
import { Button } from 'frappe-ui'
import { onClickOutside } from '@vueuse/core'
import WhatsAppIcon from '@/components/Icons/WhatsAppIcon.vue'
import MarkAsDoneIcon from '@/components/Icons/MarkAsDoneIcon.vue'
import NotificationsIcon from '@/components/Icons/NotificationsIcon.vue'
import EmptyState from '@/components/ListViews/EmptyState.vue'
import UserAvatar from '@/components/UserAvatar.vue'
import {
  visible,
  notifications,
  notificationsStore,
} from '@/stores/notifications'
import { globalStore } from '@/stores/global'
import { timeAgo, sanitizeHTML } from '@/utils'
import { useTelemetry } from '@framework/ui/telemetry'

const router = useRouter()
const { $socket } = globalStore()
const { mark_as_read, toggle, mark_doc_as_read, clearAll, clearNotification } =
  notificationsStore()
const { capture } = useTelemetry()

const target = ref(null)
const panelLeftOffset = ref('274px')

function close() {
  visible.value = false
}

function updateOffset() {
  if (typeof window === 'undefined') return
  const btn = document.getElementById('notifications-btn')
  if (btn) {
    const parentContainer =
      btn.closest('.h-full.rounded-\\[22px\\]') ||
      btn.closest('.border-r') ||
      btn.closest('aside')
    if (parentContainer) {
      const rect = parentContainer.getBoundingClientRect()
      panelLeftOffset.value = `${Math.round(rect.right + 10)}px`
      return
    }
  }
  panelLeftOffset.value = window.innerWidth > 768 ? '274px' : '10px'
}

watch(visible, (isOpen) => {
  if (isOpen) {
    updateOffset()
  }
})

onClickOutside(
  target,
  () => {
    if (visible.value) close()
  },
  {
    ignore: ['#notifications-btn'],
  },
)

function markAsRead(doc) {
  capture('notification_mark_as_read')
  mark_doc_as_read(doc)
}

function markAllAsRead() {
  capture('notification_mark_all_as_read')
  mark_as_read.reload()
}

function onClearAll() {
  capture('notification_clear_all')
  clearAll()
}

function onClearSingle(name) {
  clearNotification(name)
}

function handleNotificationClick(n) {
  if (n.comment || n.notification_type_doc) {
    markAsRead(n.comment || n.notification_type_doc)
  }
  const route = getRoute(n)
  if (route?.name) {
    router.push(route)
    close()
  }
}

onBeforeUnmount(() => {
  $socket?.off('crm_notification')
})

onMounted(() => {
  $socket?.on('crm_notification', () => notifications.reload())
})

function getRoute(notification) {
  let params = {
    leadId: notification.reference_name,
  }
  if (notification.route_name === 'Deal') {
    params = {
      dealId: notification.reference_name,
    }
  }

  return {
    name: notification.route_name,
    params: params,
    hash: notification.hash,
  }
}
</script>

<style scoped>
.fade-enter-active,
.fade-leave-active {
  transition: opacity 0.2s ease;
}
.fade-enter-from,
.fade-leave-to {
  opacity: 0;
}

.slide-fade-enter-active {
  transition: all 0.25s cubic-bezier(0.16, 1, 0.3, 1);
}
.slide-fade-leave-active {
  transition: all 0.2s cubic-bezier(0.16, 1, 0.3, 1);
}
.slide-fade-enter-from,
.slide-fade-leave-to {
  transform: translateX(-14px) scale(0.98);
  opacity: 0;
}
</style>
