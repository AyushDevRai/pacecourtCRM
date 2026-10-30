import { describe, it, expect } from 'vitest'
import {
  formatDurationMins,
  formatAllottedHours,
  getStageBadge,
  getDeadlineStatusInfo,
  calculateComplianceRate,
} from '@/utils/deadlines'

describe('deadlines utility', () => {
  describe('formatDurationMins', () => {
    it('formats minutes under an hour', () => {
      expect(formatDurationMins(25)).toBe('25m')
      expect(formatDurationMins(0)).toBe('< 1m')
    })

    it('formats hours and remaining minutes', () => {
      expect(formatDurationMins(60)).toBe('1h')
      expect(formatDurationMins(90)).toBe('1h 30m')
      expect(formatDurationMins(125)).toBe('2h 5m')
    })

    it('handles null and invalid values safely', () => {
      expect(formatDurationMins(null)).toBe('-')
      expect(formatDurationMins(undefined)).toBe('-')
      expect(formatDurationMins('')).toBe('-')
      expect(formatDurationMins(-10)).toBe('-')
    })
  })

  describe('formatAllottedHours', () => {
    it('formats hours and fractional hours', () => {
      expect(formatAllottedHours(1)).toBe('1h')
      expect(formatAllottedHours(4)).toBe('4h')
      expect(formatAllottedHours(0.5)).toBe('30m')
      expect(formatAllottedHours(null)).toBe('-')
    })
  })

  describe('getStageBadge', () => {
    it('returns proper styling for Coordinator Triage', () => {
      const badge = getStageBadge('Coordinator Triage')
      expect(badge.label).toBe('Coordinator Triage')
      expect(badge.bg).toBe('#EBF3FE')
    })

    it('returns proper styling for Sales Rep Follow-up', () => {
      const badge = getStageBadge('Sales Rep Follow-up')
      expect(badge.label).toBe('Sales Rep Follow-up')
      expect(badge.bg).toBe('#F5F3FF')
    })

    it('falls back for unknown stages', () => {
      const badge = getStageBadge('Custom Stage')
      expect(badge.label).toBe('Custom Stage')
    })
  })

  describe('getDeadlineStatusInfo', () => {
    const fixedNow = new Date('2026-10-29T12:00:00Z')

    it('handles Fulfilled status', () => {
      const info = getDeadlineStatusInfo('Fulfilled')
      expect(info.label).toBe('Fulfilled')
      expect(info.theme).toBe('green')
      expect(info.isOverdue).toBe(false)
    })

    it('handles Breached status', () => {
      const info = getDeadlineStatusInfo('Breached')
      expect(info.label).toBe('Breached')
      expect(info.theme).toBe('red')
      expect(info.isOverdue).toBe(true)
    })

    it('handles Active status with > 1 hour remaining', () => {
      const deadline = new Date('2026-10-29T15:00:00Z') // 3 hours left
      const info = getDeadlineStatusInfo('Active', deadline, fixedNow)
      expect(info.label).toBe('3.0h left')
      expect(info.theme).toBe('blue')
      expect(info.isOverdue).toBe(false)
    })

    it('handles Active status with < 1 hour remaining', () => {
      const deadline = new Date('2026-10-29T12:45:00Z') // 45 mins left
      const info = getDeadlineStatusInfo('Active', deadline, fixedNow)
      expect(info.label).toBe('45m left')
      expect(info.theme).toBe('amber')
      expect(info.isOverdue).toBe(false)
    })

    it('handles Active status that has passed deadline (overdue)', () => {
      const deadline = new Date('2026-10-29T11:40:00Z') // 20 mins overdue
      const info = getDeadlineStatusInfo('Active', deadline, fixedNow)
      expect(info.label).toBe('Overdue (20m)')
      expect(info.theme).toBe('red')
      expect(info.isOverdue).toBe(true)
    })
  })

  describe('calculateComplianceRate', () => {
    it('calculates 100% when no breaches', () => {
      expect(calculateComplianceRate(10, 0)).toBe(100.0)
      expect(calculateComplianceRate(0, 0)).toBe(100.0)
    })

    it('calculates compliance accurately', () => {
      expect(calculateComplianceRate(9, 1)).toBe(90.0)
      expect(calculateComplianceRate(95, 5)).toBe(95.0)
      expect(calculateComplianceRate(2, 1)).toBe(66.7)
    })
  })
})

