/**
 * Helper utilities for CRM Deadlines and SLA tracking
 */

export function formatDurationMins(mins) {
  if (mins === null || mins === undefined || mins === '') return '-'
  const num = Number(mins)
  if (isNaN(num) || num < 0) return '-'
  if (num === 0) return '< 1m'
  if (num < 60) return `${Math.round(num)}m`
  const hours = Math.floor(num / 60)
  const remMins = Math.round(num % 60)
  return remMins > 0 ? `${hours}h ${remMins}m` : `${hours}h`
}

export function formatAllottedHours(hours) {
  if (hours === null || hours === undefined) return '-'
  const num = Number(hours)
  if (isNaN(num)) return '-'
  if (num < 1) return `${Math.round(num * 60)}m`
  return `${num}h`
}

export function getStageBadge(stage) {
  if (stage === 'Coordinator Triage') {
    return {
      label: 'Coordinator Triage',
      bg: '#EBF3FE',
      text: '#1E40AF',
      border: '#BFDBFE',
      className:
        'bg-[#EBF3FE] text-[#1E40AF] border border-[#BFDBFE] dark:bg-[rgba(59,130,246,0.15)] dark:text-[#93c5fd] dark:border-[rgba(59,130,246,0.3)]',
    }
  }
  if (stage === 'Sales Rep Follow-up') {
    return {
      label: 'Sales Rep Follow-up',
      bg: '#F5F3FF',
      text: '#6D28D9',
      border: '#DDD6FE',
      className:
        'bg-[#F5F3FF] text-[#6D28D9] border border-[#DDD6FE] dark:bg-[rgba(139,92,246,0.15)] dark:text-[#c4b5fd] dark:border-[rgba(139,92,246,0.3)]',
    }
  }
  return {
    label: stage || '-',
    bg: '#F3F4F6',
    text: '#374151',
    border: '#E5E7EB',
    className:
      'bg-[#F3F4F6] text-[#374151] border border-[#E5E7EB] dark:bg-[rgba(156,163,175,0.15)] dark:text-[#d1d5db] dark:border-[rgba(156,163,175,0.3)]',
  }
}

export function getDeadlineStatusInfo(
  status,
  deadlineAt,
  referenceNow = new Date(),
) {
  if (status === 'Fulfilled') {
    return {
      label: 'Fulfilled',
      theme: 'green',
      bg: '#EEF6DA',
      text: '#5F7F17',
      className:
        'bg-[#EEF6DA] text-[#5F7F17] dark:bg-[rgba(180,224,67,0.18)] dark:text-[#b4e043] dark:border dark:border-[rgba(180,224,67,0.3)]',
      isOverdue: false,
    }
  }

  if (status === 'Cancelled') {
    return {
      label: 'Cancelled',
      theme: 'gray',
      bg: '#F3F4F6',
      text: '#6B7280',
      className:
        'bg-[#F3F4F6] text-[#6B7280] dark:bg-[rgba(156,163,175,0.15)] dark:text-[#9ca3af] dark:border dark:border-[rgba(156,163,175,0.25)]',
      isOverdue: false,
    }
  }

  if (status === 'Breached') {
    return {
      label: 'Breached',
      theme: 'red',
      bg: '#FBECEB',
      text: '#A4342A',
      className:
        'bg-[#FBECEB] text-[#A4342A] dark:bg-[rgba(239,68,68,0.18)] dark:text-[#f87171] dark:border dark:border-[rgba(239,68,68,0.3)]',
      isOverdue: true,
    }
  }

  // Active status
  if (!deadlineAt) {
    return {
      label: 'Active',
      theme: 'blue',
      bg: '#EBF3FE',
      text: '#2563EB',
      className:
        'bg-[#EBF3FE] text-[#2563EB] dark:bg-[rgba(59,130,246,0.18)] dark:text-[#60a5fa] dark:border dark:border-[rgba(59,130,246,0.3)]',
      isOverdue: false,
    }
  }

  const deadlineTime = new Date(deadlineAt).getTime()
  const nowTime = new Date(referenceNow).getTime()
  const diffMins = Math.round((deadlineTime - nowTime) / 60000)

  if (diffMins < 0) {
    return {
      label: `Overdue (${Math.abs(diffMins)}m)`,
      theme: 'red',
      bg: '#FBECEB',
      text: '#A4342A',
      className:
        'bg-[#FBECEB] text-[#A4342A] dark:bg-[rgba(239,68,68,0.18)] dark:text-[#f87171] dark:border dark:border-[rgba(239,68,68,0.3)]',
      isOverdue: true,
    }
  }

  if (diffMins < 60) {
    return {
      label: `${diffMins}m left`,
      theme: 'amber',
      bg: '#FEF3C7',
      text: '#D97706',
      className:
        'bg-[#FEF3C7] text-[#D97706] dark:bg-[rgba(245,158,11,0.18)] dark:text-[#fbbf24] dark:border dark:border-[rgba(245,158,11,0.3)]',
      isOverdue: false,
    }
  }

  const hoursLeft = (diffMins / 60).toFixed(1)
  return {
    label: `${hoursLeft}h left`,
    theme: 'blue',
    bg: '#EBF3FE',
    text: '#2563EB',
    className:
      'bg-[#EBF3FE] text-[#2563EB] dark:bg-[rgba(59,130,246,0.18)] dark:text-[#60a5fa] dark:border dark:border-[rgba(59,130,246,0.3)]',
    isOverdue: false,
  }
}

export function calculateComplianceRate(fulfilled = 0, breached = 0) {
  const f = Math.max(0, Number(fulfilled) || 0)
  const b = Math.max(0, Number(breached) || 0)
  const total = f + b
  if (total === 0) return 100.0
  return Math.round((f / total) * 1000) / 10
}
