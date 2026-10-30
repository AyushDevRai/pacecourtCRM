import ContactsIcon from '@/components/Icons/ContactsIcon.vue'
import DealsIcon from '@/components/Icons/DealsIcon.vue'
import FileTextIcon from '@/components/Icons/FileTextIcon.vue'
import LeadsIcon from '@/components/Icons/LeadsIcon.vue'
import NoteIcon from '@/components/Icons/NoteIcon.vue'
import OrganizationsIcon from '@/components/Icons/OrganizationsIcon.vue'
import DealersIcon from '@/components/Icons/DealersIcon.vue'
import DeadlinesIcon from '@/components/Icons/DeadlinesIcon.vue'
import PhoneIcon from '@/components/Icons/PhoneIcon.vue'
import TaskIcon from '@/components/Icons/TaskIcon.vue'
import LucideLayoutDashboard from '~icons/lucide/layout-dashboard'
import router from '@/router'

export const navigationItems = [
  {
    label: 'Dashboard',
    icon: LucideLayoutDashboard,
    route: 'Dashboard',
    desktopOnly: true,
  },
  { label: 'Leads', icon: LeadsIcon, route: 'Leads' },
  { label: 'Deals', icon: DealsIcon, route: 'Deals' },
  { label: 'Quotations', icon: FileTextIcon, route: 'Quotations' },
  { label: 'Contacts', icon: ContactsIcon, route: 'Contacts' },
  { label: 'Organizations', icon: OrganizationsIcon, route: 'Organizations' },
  { label: 'Dealers', icon: DealersIcon, route: 'Dealers' },
  { label: 'Deadlines', icon: DeadlinesIcon, route: 'Deadlines' },
  { label: 'Notes', icon: NoteIcon, route: 'Notes' },
  { label: 'Tasks', icon: TaskIcon, route: 'Tasks' },
  { label: 'Call Logs', icon: PhoneIcon, route: 'Call Logs' },
]

export const COORDINATOR_ALLOWED_ROUTES = [
  'Leads',
  'Deadlines',
  'Tasks',
  'Notes',
  'Call Logs',
]

export function getNavigationItems({ mobile = false, role = null } = {}) {
  return navigationItems.filter((item) => {
    if (!router.hasRoute(item.route)) return false
    if (mobile && item.desktopOnly) return false
    if (role === 'CRM Coordinator' && !COORDINATOR_ALLOWED_ROUTES.includes(item.route)) {
      return false
    }
    return true
  })
}
