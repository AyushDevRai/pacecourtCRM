<template>
  <div class="flex h-screen w-screen">
    <MobileSidebar />
    <div class="flex h-full flex-1 flex-col overflow-auto bg-surface-base relative">
      <Watermark />
      <MobileAppHeader class="relative z-[1]" />
      <div class="flex-1 overflow-auto relative z-[1]">
        <slot />
      </div>
    </div>
    <GlobalModals />
  </div>
</template>
<script setup>
import MobileSidebar from '@/components/Mobile/MobileSidebar.vue'
import MobileAppHeader from '@/components/Mobile/MobileAppHeader.vue'
import Watermark from '@/components/Watermark.vue'
import GlobalModals from '@/components/Modals/GlobalModals.vue'
</script>
