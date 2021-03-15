import { ref, computed } from 'vue'
import { fetchCurrentSites, fetchSite } from '@/api/sites'
import { fetchProducts } from '@/api/products'
import { createSite } from '@/api/sites'

export function useSites() {
  const currentSites = ref([])
  const getCurrentSites = async () => {
    const data = await fetchCurrentSites()
    currentSites.value = data
  }
  const message = computed(() => `Currently we have ${currentSites.value.length} site(s) in the system`)

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
  const getCurrentSite = async () => {
    const data = await fetchSite(id)
    siteName.value = data.name
    siteUrl.value = data.url
  }

  const getProducts = async () => {
    const data = await fetchProducts(id) 
    numberOfProducts.value = data.productCount
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

  getProducts()
  getCurrentSite()

  return {
    numberOfProducts,
    message,
    siteName,
    siteUrl,
    getCurrentSite,
    getProducts
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