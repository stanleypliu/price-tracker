<template>
  <div class="container row hero-products">
    <div class="row">
      <h1>{{ title }}</h1>
    </div>
    <div class="row">
      <h3>{{ message }}</h3>
    </div>
    <slot></slot>
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
    const { message } = useProducts()
    
    return {
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
