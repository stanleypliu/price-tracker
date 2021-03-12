import { ref, onMounted, computed } from 'vue'
import { fetchCurrentSites } from '@/api/sites'
import { createSite } from '@/api/sites'

export function useSites() {
  const currentSites = ref([])
  const getCurrentSites = async () => {
    const response = await fetchCurrentSites()
    currentSites.value = response
  }
  const message = computed(() => `Currently we have ${currentSites.value.length} site(s) in the system`)

  onMounted(getCurrentSites)

  return {
    message,
    currentSites,
    getCurrentSites
  }
}

export function createSites() {
  const siteName = ref('')
  const siteUrl = ref('') 
  const createNewSite = async () => {
    await createSite({
      'name': siteName,
      'url': siteUrl
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