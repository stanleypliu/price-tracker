import { ref, computed } from 'vue'
import { fetchCurrentSites, fetchSiteAndProducts } from '@/api/sites'
import { createSite } from '@/api/sites'
import { capitalise } from '@/helpers/capitalise'

export function useSites() {
  const currentSites = ref([])
  const getCurrentSites = async () => {
    const data = await fetchCurrentSites()
    currentSites.value = data
  }
  const message = computed(() => `Currently we are scanning through ${currentSites.value.length} site(s) to find the best prices!`)

  getCurrentSites()

  return {
    message,
    currentSites,
    getCurrentSites
  }
}

export function useSite(id) {
  const siteName = ref('')
  const siteUrl = ref('')
  const numberOfProducts = ref(undefined)
  const getCurrentSiteAndProducts = async () => {
    const data = await fetchSiteAndProducts(id)
    siteName.value = data.site.name
    siteUrl.value = data.site.url
    numberOfProducts.value = data.products.length
  }

  const message = computed(() => {
    if (numberOfProducts) {
      if (numberOfProducts.value === 0) {
        return 'No products found for this site. Why not track one?'
      } else {
        return `There are ${numberOfProducts.value} products registered for this site`
      }
    }
  })

  getCurrentSiteAndProducts()

  return {
    numberOfProducts,
    message,
    siteName,
    siteUrl,
    getCurrentSiteAndProducts
  }
}

export function createSites() {
  const siteName = ref('')
  const siteUrl = ref('') 
  const createNewSite = async () => {
    await createSite({
      'name': capitalise(siteName.value),
      'url': encodeURI(siteUrl.value)
    })
    siteName.value = ''
    siteUrl.value = ''
  }
 
  return {
    siteName,
    siteUrl,
    createNewSite
  }
}