<template>
  <div class="container row hero-small">
    <div class="col s6 ">
      <h2>{{ title }}</h2>
      <h4>{{ message }}</h4>
      <slot></slot>
    </div>
  </div>
  <hr>
</template>

<script>
import { useSites } from '@/composables/useSites'

export default {
  name: 'HeroSmall',
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

<style lang="scss">
  .hero-small {
    margin-top: 100px;
  }
</style>
