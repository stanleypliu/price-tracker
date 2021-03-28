<template>
  <table class="container">
    <thead>
      <tr>
        <th>Name</th>
        <th>Category</th>
        <th></th>
      </tr>
    </thead>
    <tbody>
      <tr v-for="product in currentProducts" :key="product.name">
        <td>{{ product.name }}</td>
        <td>'TODO - Not yet Implemented'</td>
        <td>
          <a :href="`/products/${product.id}`" class="waves-effect waves-light btn"
            >Browse offerings!</a
          >
        </td>
      </tr>
    </tbody>
  </table>
</template>

<script>
import { useProducts } from '@/composables/useProducts'

export default {
  name: 'TableLarge',
  setup() {
    const { currentProducts, getCurrentProducts } = useProducts()
    
    return {
      currentProducts,
      getCurrentProducts
    }
  }
}
</script>
