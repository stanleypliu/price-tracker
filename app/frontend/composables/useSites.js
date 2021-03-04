import { ref, onMounted } from 'vue'
import { fetchCurrentSites } from '@/api/sites'

export default function useSites() {
  const currentSites = ref([])
  const getCurrentSites = async () => {
    const response = await fetchCurrentSites()
    currentSites.value = response
  }

  onMounted(getCurrentSites)

  return {
    currentSites,
    getCurrentSites
  }
}