import { ref, computed } from 'vue'
import { fetchCurrentProducts } from '@/api/products'
import { createObject } from '@/api/create'
import { capitalise } from '@/helpers/capitalise'

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

export function createProducts() {
  const productName = ref('')
  const createNewProduct = async () => {
    await createObject('/products', {
      'name': capitalise(productName.value)
    })
    productName.value = ''
  }
 
  return {
    productName,
    createNewProduct
  }
}