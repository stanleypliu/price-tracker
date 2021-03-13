<template>
  <div class="container row hero-sites">
    <div class="row">
      <h1>{{ title }}</h1>
      <h3>{{ message }}</h3>
      <slot></slot>
    </div>
  </div>
  <hr>
</template>

<script>
import { useSites } from '@/composables/useSites'

export default {
  name: 'HeroSites',
  props: {
    title: {
      type: String,
      default: '' 
    }
  },
  setup() {
    const { currentSites, getCurrentSites, message } = useSites()
    
    return {
      currentSites,
      getCurrentSites,
      message
    }
  }
}
</script>

<style lang="scss" scoped>
  .hero-sites {
    margin-top: 100px;
  }
</style>
