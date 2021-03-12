import { ref, onMounted, computed } from 'vue'
import { fetchCurrentSites, fetchSite } from '@/api/sites'
import { createSite } from '@/api/sites'

export function useSites() {
  const currentSites = ref([])
  const getCurrentSites = async () => {
    const data = await fetchCurrentSites()
    currentSites.value = data
  }
  const message = computed(() => `Currently we have ${currentSites.value.length} site(s) in the system`)

  onMounted(getCurrentSites)

  return {
    message,
    currentSites,
    getCurrentSites
  }
}

export function useSite(id) {
  const siteName = ref('')
  const siteUrl = ref('')
  const getCurrentSite = async () => {
    const data = await fetchSite(id)
    siteName.value = data.name
    siteUrl.value = data.url
  }

  onMounted(getCurrentSite)

  return {
    siteName,
    siteUrl,
    getCurrentSite
  }
}

export function createSites() {
  const siteName = ref('')
  const siteUrl = ref('') 
  const createNewSite = async () => {
    await createSite({
      'name': siteName.value.toUpperCase,
      'url': encodeURI(siteUrl.value)
    })
    siteName = ''
    siteUrl = ''
  }
 
  return {
    siteName,
    siteUrl,
    createNewSite
  }
}