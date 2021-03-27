import { ref, computed } from 'vue'
import { fetchCurrentProducts } from '@/api/products'

export function useProducts() {
  const currentProducts = ref([])
  const getCurrentProducts = async () => {
    const data = await fetchCurrentProducts()
    currentProducts.value = data
  }
  const message = computed(() => `Currently we have ${currentProducts.value.length} product(s) in the system`)

  getCurrentProducts()

  return {
    message,
    currentProducts,
    getCurrentProducts
  }
}
