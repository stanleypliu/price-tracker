<template>
  <div class="container row hero-products">
    <div class="row">
      <h1>{{ title }}</h1>
      <h3>{{ message }}</h3>
      <slot></slot>
    </div>
  </div>
  <hr>
</template>

<script>
import { useProducts } from '@/composables/useProducts'

export default {
  name: 'HeroProducts',
  props: {
    title: {
      type: String,
      default: '' 
    }
  },
  setup() {
    const { currentProducts, getCurrentProducts, message } = useProducts()
    
    return {
      currentProducts,
      getCurrentProducts,
      message
    }
  }
}
</script>

<style lang="scss" scoped>
  .hero-products {
    margin-top: 100px;
  }
</style>
