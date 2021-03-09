<template>
  <div class="container row section">
    <div class="col s6 ">
      <h2>{{ title }}</h2>
      <h4>{{ message }}</h4>
      <slot></slot>
    </div>
  </div>
  <hr>
</template>

<script>
import useSites from '@/composables/useSites'
import { computed } from 'vue'

export default {
  name: 'HeroSmall',
  props: {
    title: {
      type: String,
      default: '' 
    }
  },
  setup() {
    const { currentSites, getCurrentSites } = useSites()
    const message = computed(() => `Currently we have ${currentSites.value.length} site(s) in the system`)

    return {
      currentSites,
      getCurrentSites,
      message
    }
  }
}
</script>
