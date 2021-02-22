<template>
  <div class="container row">
    <div class="col s6">
      <h2>{{ title }}</h2>
      <h4>{{ message }}</h4>
    </div>
  </div>
</template>

<script>
import useSites from '../../composables/useSites'
import { ref, computed } from 'vue'

export default {
  name: 'HeroSmall',
  setup() {
    const title = ref('All Sites')
    const { currentSites, getCurrentSites } = useSites()
    const message = computed(() => `Currently we have ${currentSites.value.length} site(s) in the system`)
    console.log(currentSites)
    return {
      title, 
      currentSites,
      getCurrentSites,
      message
    }
  }
}
</script>
