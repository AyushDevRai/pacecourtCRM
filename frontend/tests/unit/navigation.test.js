import { getNavigationItems, navigationItems } from '@/utils/navigation'

describe('navigationItems', () => {
  it('uses unique route names', () => {
    const routes = navigationItems.map((item) => item.route)
    expect(new Set(routes).size).toBe(routes.length)
  })

  it('omits desktop-only destinations on mobile', () => {
    const mobileRoutes = getNavigationItems({ mobile: true }).map(
      (item) => item.route,
    )
    expect(mobileRoutes).not.toContain('Dashboard')
    expect(mobileRoutes).not.toContain('Calendar')
    expect(mobileRoutes).toContain('Leads')
  })

  it('filters routes strictly for CRM Coordinator', () => {
    const coordinatorRoutes = getNavigationItems({ role: 'CRM Coordinator' }).map(
      (item) => item.route,
    )
    expect(coordinatorRoutes).toContain('Leads')
    expect(coordinatorRoutes).toContain('Deadlines')
    expect(coordinatorRoutes).toContain('Tasks')
    expect(coordinatorRoutes).toContain('Notes')
    expect(coordinatorRoutes).toContain('Call Logs')

    expect(coordinatorRoutes).not.toContain('Deals')
    expect(coordinatorRoutes).not.toContain('Quotations')
    expect(coordinatorRoutes).not.toContain('Contacts')
    expect(coordinatorRoutes).not.toContain('Organizations')
    expect(coordinatorRoutes).not.toContain('Dealers')
    expect(coordinatorRoutes).not.toContain('Dashboard')
  })
})
