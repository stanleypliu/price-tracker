<template>
  <div class="list-sites container">
    <ul>
      <li v-for="site in currentSites" :key="site.name">
        <h5>{{ site.name }}</h5>
      </li>
    </ul>
  </div>
</template>

<script>
import { useSites } from '@/composables/useSites'

export default {
  name: 'ListSites',
  setup() {
    const { currentSites, getCurrentSites } = useSites()

    return {
      currentSites,
      getCurrentSites
    }
  }
}
</script>

<style lang="scss" scoped>

</style>