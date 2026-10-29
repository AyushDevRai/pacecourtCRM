import { describe, expect, it } from 'vitest'
import {
  cleanPhoneNumber,
  buildDealerWhatsAppUrl,
  formatDealerBriefText,
} from '@/utils/dealerBrief'

describe('dealerBrief utility', () => {
  it('cleans 10-digit phone number and prepends India country code 91', () => {
    expect(cleanPhoneNumber('9810123456')).toBe('919810123456')
    expect(cleanPhoneNumber('+91 98101 23456')).toBe('919810123456')
    expect(cleanPhoneNumber('09810123456')).toBe('09810123456')
    expect(cleanPhoneNumber('')).toBe('')
    expect(cleanPhoneNumber(null)).toBe('')
  })

  it('builds wa.me URL with encoded text query', () => {
    const url = buildDealerWhatsAppUrl('9810123456', 'Hello Dealer')
    expect(url).toBe('https://wa.me/919810123456?text=Hello%20Dealer')
  })

  it('formats dealer brief with client details and requirements', () => {
    const brief = formatDealerBriefText({
      clientName: 'Sunrise Sports Club',
      phone: '9876543210',
      city: 'Noida',
      courtType: 'Acrylic 8-Layer',
      courtCount: '2',
      notes: 'Site visit requested on Saturday',
    })

    expect(brief).toContain('*PACECOURT LEAD ASSIGNMENT*')
    expect(brief).toContain('Sunrise Sports Club')
    expect(brief).toContain('9876543210')
    expect(brief).toContain('Acrylic 8-Layer (2 court)')
    expect(brief).toContain('Site visit requested on Saturday')
  })
})

