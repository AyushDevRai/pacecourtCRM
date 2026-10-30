<template>
  <div
    class="pointer-events-none absolute top-0 bottom-0 z-0 flex items-center justify-center overflow-hidden select-none transition-[left,right] duration-200 ease-out"
    :style="{
      left: `${leftOffset}px`,
      right: `${rightOffset}px`,
    }"
    aria-hidden="true"
  >
    <!-- Light Mode Watermark (navy "COURT" + brand lime "PACE") -->
    <img
      :src="watermarkLightUrl"
      alt=""
      class="dark:hidden w-[72%] max-w-[920px] min-w-[320px] select-none opacity-[0.055] transition-opacity duration-300 filter contrast-110"
      draggable="false"
    />
    <!-- Dark Mode Watermark (white "COURT" + brand lime "PACE") -->
    <img
      :src="watermarkDarkUrl"
      alt=""
      class="hidden dark:block w-[72%] max-w-[920px] min-w-[320px] select-none opacity-[0.045] brightness-125 transition-opacity duration-300"
      draggable="false"
    />
  </div>
</template>

<script setup>
import { ref, onMounted, onBeforeUnmount, watch, nextTick } from 'vue'
import { useRoute } from 'vue-router'
import watermarkDarkUrl from '@/images/pacecourt-watermark.webp'
import watermarkLightUrl from '@/images/pacecourt-watermark-light.webp'

const route = useRoute()
const rightOffset = ref(0)
const leftOffset = ref(0)

let resizeObserver = null
let mutationObserver = null
let trackedRightPanel = null

function updateOffsets() {
  if (typeof document === 'undefined') return

  // Find right side panel (used in Lead, Deal, etc.)
  const rightPanel = document.querySelector(
    '[data-side-panel="right"], [data-side="right"], [side="right"]',
  )

  if (rightPanel && rightPanel.offsetParent !== null) {
    const width = rightPanel.offsetWidth || 0
    rightOffset.value = width

    // Keep track of right panel to attach ResizeObserver if new
    if (rightPanel !== trackedRightPanel) {
      if (trackedRightPanel && resizeObserver) {
        resizeObserver.unobserve(trackedRightPanel)
      }
      trackedRightPanel = rightPanel
      if (resizeObserver) {
        resizeObserver.observe(rightPanel)
      }
    }
  } else {
    rightOffset.value = 0
    if (trackedRightPanel && resizeObserver) {
      resizeObserver.unobserve(trackedRightPanel)
      trackedRightPanel = null
    }
  }

  // Find left side panel if any (e.g. in Contact, Organization)
  const leftPanel = document.querySelector('[data-side-panel="left"]')
  if (leftPanel && leftPanel.offsetParent !== null) {
    leftOffset.value = leftPanel.offsetWidth || 0
  } else {
    leftOffset.value = 0
  }
}

// Watch for route navigation between lists and details
watch(
  () => route?.fullPath,
  () => {
    nextTick(() => {
      updateOffsets()
      setTimeout(updateOffsets, 100)
      setTimeout(updateOffsets, 300)
    })
  },
)

onMounted(() => {
  updateOffsets()
  nextTick(() => {
    updateOffsets()
    setTimeout(updateOffsets, 150)
  })

  window.addEventListener('resize', updateOffsets)

  // Observe DOM changes to dynamically detect panels mounting/unmounting
  if (typeof MutationObserver !== 'undefined') {
    mutationObserver = new MutationObserver(() => {
      updateOffsets()
    })
    mutationObserver.observe(document.body, {
      childList: true,
      subtree: true,
      attributes: true,
      attributeFilter: ['style', 'class', 'data-side-panel'],
    })
  }

  // Observe resizing of panels (e.g. when dragging Resizer)
  if (typeof ResizeObserver !== 'undefined') {
    resizeObserver = new ResizeObserver(() => {
      updateOffsets()
    })
  }
})

onBeforeUnmount(() => {
  window.removeEventListener('resize', updateOffsets)
  if (mutationObserver) {
    mutationObserver.disconnect()
  }
  if (resizeObserver) {
    resizeObserver.disconnect()
  }
})
</script>
