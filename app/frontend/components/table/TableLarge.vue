<template>
  <table class="container">
    <thead>
      <tr>
        <th>Name</th>
        <th>URL</th>
        <th></th>
      </tr>
    </thead>
    <tbody>
      <tr v-for="site in currentSites" :key="site.name">
        <td>{{ site.name }}</td>
        <td>{{ site.url }}</td>
        <td>
          <a :href="`/sites/${site.id}`" class="waves-effect waves-light btn"
            >Check it out!</a
          >
        </td>
      </tr>
    </tbody>
  </table>
</template>

<script>
import { useSites } from '@/composables/useSites'

export default {
  name: 'TableLarge',
  setup() {
    const { currentSites, getCurrentSites } = useSites()

    return {
      currentSites,
      getCurrentSites
    }
  }
}
</script>
