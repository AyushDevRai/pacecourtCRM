import { describe, expect, it } from 'vitest'
import {
  calculateLineItem,
  calculateQuotationTotals,
} from '@/utils/quotationCalculations.js'

describe('calculateLineItem', () => {
  it('calculates amount from qty and rate', () => {
    const item = { qty: 10, rate: 100 }
    const result = calculateLineItem(item)
    expect(result.amount).toBe(1000)
    expect(result.net_amount).toBe(1000)
    expect(result.tax_amount).toBe(180) // 18% default tax
    expect(result.total_amount).toBe(1180)
  })

  it('applies percentage discount correctly', () => {
    const item = { qty: 2, rate: 500, discount_percentage: 10 }
    const result = calculateLineItem(item)
    expect(result.amount).toBe(1000)
    expect(result.discount_amount).toBe(100)
    expect(result.net_amount).toBe(900)
    expect(result.tax_amount).toBe(162) // 18% of 900
    expect(result.total_amount).toBe(1062)
  })

  it('applies flat discount amount correctly', () => {
    const item = { qty: 5, rate: 200, discount_amount: 150 }
    const result = calculateLineItem(item)
    expect(result.amount).toBe(1000)
    expect(result.discount_amount).toBe(150)
    expect(result.net_amount).toBe(850)
    expect(result.tax_amount).toBe(153) // 18% of 850
    expect(result.total_amount).toBe(1003)
  })

  it('handles custom tax rate', () => {
    const item = { qty: 1, rate: 1000, tax_rate: 12 }
    const result = calculateLineItem(item)
    expect(result.tax_amount).toBe(120)
    expect(result.total_amount).toBe(1120)
  })
})

describe('calculateQuotationTotals', () => {
  it('aggregates multiple line items with subtotal and grand total', () => {
    const quote = {
      items: [
        { qty: 1000, rate: 45, tax_rate: 18 }, // Acrylic Primer: 45,000 net, 8,100 tax
        { qty: 1000, rate: 75, tax_rate: 18 }, // Resurfacer: 75,000 net, 13,500 tax
      ],
      shipping_freight_charges: 5000,
      rounding_adjustment: 0,
    }

    const result = calculateQuotationTotals(quote)
    expect(result.total_qty).toBe(2000)
    expect(result.net_total).toBe(120000)
    expect(result.tax_amount).toBe(21600)
    expect(result.grand_total).toBe(146600) // 120,000 + 21,600 + 5,000
  })

  it('applies global discount and adjusts tax proportionally', () => {
    const quote = {
      items: [
        { qty: 10, rate: 1000, tax_rate: 18 }, // 10,000 net, 1,800 tax
      ],
      discount_type: 'Percentage',
      discount_percentage: 10, // 1,000 discount
      shipping_freight_charges: 0,
    }

    const result = calculateQuotationTotals(quote)
    expect(result.net_total).toBe(10000)
    expect(result.discount_amount).toBe(1000)
    expect(result.tax_amount).toBe(1620) // 18% on taxable base of 9,000
    expect(result.grand_total).toBe(10620)
  })
})

