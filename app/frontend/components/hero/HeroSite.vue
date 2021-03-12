<template>
  <div class="container row hero-site">
    <div class="col s6">
      <h2>{{ siteName }}</h2>
      <!-- <button class="waves-effect waves-light btn"> -->
        <a :href="siteUrl">VISIT</a>
      <!-- </button> -->
    </div>
  </div>
  <hr />
</template>

<script>
import { useSite } from '@/composables/useSites'

export default {
  name: 'HeroSite',
  props: {
    siteId: {
      type: Number,
      required: true
    },
  },
  setup(props) {
    const { siteName, siteUrl, getCurrentSite } = useSite(props.siteId)

    return {
      siteName,
      siteUrl,
      getCurrentSite
    }
  }
}
</script>

<style lang="scss" scoped>
.hero-site {
  margin-top: 100px;
}
</style>