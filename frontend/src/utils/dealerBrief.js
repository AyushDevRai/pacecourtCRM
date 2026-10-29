/**
 * Pure utility functions for Dealer Handover and WhatsApp brief generation.
 */

export function cleanPhoneNumber(phone) {
  if (!phone) return ''
  const digits = String(phone).replace(/\D/g, '')
  if (digits.length === 10) {
    return `91${digits}`
  }
  return digits
}

export function buildDealerWhatsAppUrl(phone, text) {
  const clean = cleanPhoneNumber(phone)
  if (!clean) return ''
  return `https://wa.me/${clean}?text=${encodeURIComponent(text || '')}`
}

export function formatDealerBriefText({ clientName, phone, city, courtType, courtCount, notes }) {
  const lines = [
    `*PACECOURT LEAD ASSIGNMENT*`,
    `A new prospective client lead has been assigned:`,
    `• *Client*: ${clientName || 'Prospective Client'}`,
    `• *Phone*: ${phone || 'Not provided'}`,
    `• *Location*: ${city || 'Not specified'}`,
    `• *Requirements*: ${courtType || 'Court Flooring'} (${courtCount || '1'} court)`,
  ]
  if (notes) {
    lines.push(`• *Remarks*: ${notes}`)
  }
  lines.push(``, `Please connect with the client and share execution updates.`)
  return lines.join('\n')
}

