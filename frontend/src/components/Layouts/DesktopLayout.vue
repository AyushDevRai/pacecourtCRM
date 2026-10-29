<template>
  <div class="flex h-screen w-screen p-2 sm:p-3 gap-2 sm:gap-3 bg-[var(--pc-bg)] overflow-hidden">
    <div class="h-full rounded-[22px] border border-[var(--pc-border)] shadow-sm bg-[var(--pc-surface)] overflow-hidden flex flex-col shrink-0">
      <AppSidebar />
    </div>
    <div class="flex-1 flex flex-col h-full overflow-hidden bg-[var(--pc-surface)] rounded-[22px] border border-[var(--pc-border)] shadow-sm">
      <AppHeader />
      <div class="flex-1 overflow-auto">
        <slot />
      </div>
    </div>
    <GlobalModals />
  </div>
</template>
<script setup>
import AppSidebar from '@/components/Layouts/AppSidebar.vue'
import AppHeader from '@/components/Layouts/AppHeader.vue'
import GlobalModals from '@/components/Modals/GlobalModals.vue'
</script>
