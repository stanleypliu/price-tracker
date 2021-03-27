<template>
  <div class="container row hero-site">
    <div class="row">
      <div class="col s6">
        <h1>{{ siteName }}</h1>
        <br />
        <a class="white-text waves-effect waves-light btn-large" :href="siteUrl"
          >VISIT</a
        >
      </div>
    </div>
    <div class="row section">
      <h3>{{ message }}</h3>
    </div>
  </div>
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
    const { numberOfProducts, siteName, siteUrl, getCurrentSiteAndProducts, message } = useSite(props.siteId)

    return {
      message,
      numberOfProducts,
      siteName,
      siteUrl,
      getCurrentSiteAndProducts
    }
  }
}
</script>

<style lang="scss" scoped>
.hero-site {
  margin-top: 100px;
}
</style>