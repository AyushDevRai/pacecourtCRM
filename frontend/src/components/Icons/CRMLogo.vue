<template>
  <svg
    viewBox="0 0 40 40"
    fill="none"
    xmlns="http://www.w3.org/2000/svg"
    class="size-8 shrink-0 rounded-2xl shadow-sm"
  >
    <rect width="40" height="40" rx="12" fill="url(#pc-chip-grad)" />
    <!-- Pacecourt chevron / court mark -->
    <path
      d="M12 24L20 14L28 24"
      stroke="#9AC72C"
      stroke-width="3.5"
      stroke-linecap="round"
      stroke-linejoin="round"
    />
    <path
      d="M16 26L20 20L24 26"
      stroke="#FFFFFF"
      stroke-width="2.5"
      stroke-linecap="round"
      stroke-linejoin="round"
    />
    <defs>
      <linearGradient id="pc-chip-grad" x1="0" y1="0" x2="40" y2="40" gradientUnits="userSpaceOnUse">
        <stop stop-color="#0F2A45" />
        <stop offset="0.6" stop-color="#1D6F86" />
        <stop offset="1" stop-color="#9AC72C" />
      </linearGradient>
    </defs>
  </svg>
</template>
