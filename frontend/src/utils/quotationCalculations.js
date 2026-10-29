/**
 * Pure calculation helpers for Zoho CRM Quotations Engine.
 */

export function calculateLineItem(item) {
  const qty = Number(item.qty || 0)
  const rate = Number(item.rate || 0)
  const amount = Number((qty * rate).toFixed(2))

  let discountAmount = 0
  const discountPct = Number(item.discount_percentage || 0)
  if (discountPct > 0) {
    discountAmount = Number(((amount * discountPct) / 100).toFixed(2))
  } else if (item.discount_amount) {
    discountAmount = Number(Number(item.discount_amount).toFixed(2))
  }

  const netAmount = Number(Math.max(0, amount - discountAmount).toFixed(2))
  const taxRate = item.tax_rate !== undefined && item.tax_rate !== null ? Number(item.tax_rate) : 18.0
  const taxAmount = Number(((netAmount * taxRate) / 100).toFixed(2))
  const totalAmount = Number((netAmount + taxAmount).toFixed(2))

  return {
    ...item,
    amount,
    discount_amount: discountAmount,
    net_amount: netAmount,
    tax_rate: taxRate,
    tax_amount: taxAmount,
    total_amount: totalAmount,
  }
}

export function calculateQuotationTotals(quote) {
  const items = (quote.items || []).map(calculateLineItem)

  const totalQty = Number(items.reduce((acc, i) => acc + (Number(i.qty) || 0), 0).toFixed(2))
  const netTotal = Number(items.reduce((acc, i) => acc + (Number(i.net_amount) || 0), 0).toFixed(2))
  const totalTax = Number(items.reduce((acc, i) => acc + (Number(i.tax_amount) || 0), 0).toFixed(2))

  let globalDiscount = 0
  const discountType = quote.discount_type || 'Percentage'
  const discountPct = Number(quote.discount_percentage || 0)
  if (discountType === 'Percentage' && discountPct > 0) {
    globalDiscount = Number(((netTotal * discountPct) / 100).toFixed(2))
  } else if (quote.discount_amount) {
    globalDiscount = Number(Number(quote.discount_amount).toFixed(2))
  }

  const taxableSubtotal = Number(Math.max(0, netTotal - globalDiscount).toFixed(2))

  let adjustedTax = totalTax
  if (netTotal > 0 && globalDiscount > 0) {
    adjustedTax = Number(((totalTax * taxableSubtotal) / netTotal).toFixed(2))
  }

  const freight = Number(Number(quote.shipping_freight_charges || 0).toFixed(2))
  const adjustment = Number(Number(quote.rounding_adjustment || 0).toFixed(2))

  const grandTotal = Number((taxableSubtotal + adjustedTax + freight + adjustment).toFixed(2))

  return {
    items,
    total_qty: totalQty,
    net_total: netTotal,
    discount_amount: globalDiscount,
    tax_amount: adjustedTax,
    grand_total: grandTotal,
  }
}

