<template>
  <nav class="blue darken-1">
    <div class="nav-wrapper blue darken-1 container">
      <!-- TODO - make a logo? -->
      <a href="/" class="logo-text">Price<span class="red-text">Tracker</span></a>
      <ul id="nav-mobile" class="right hide-on-med-and-down">
        <li><a href="/sites">Sites</a></li>
      </ul>
    </div>
  </nav>
</template>

<script>
import { ref } from 'vue'

export default {
  setup () {
    const isCurrentPage = ref(false)

    return {
      isCurrentPage
    }
  }
}
</script>

<style lang="scss" scoped>
.logo-text {
  font-size: 32px;
}
</style>