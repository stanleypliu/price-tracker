<template>
  <nav class="navbar">
    <div class="nav-wrapper container">
      <!-- TODO - make a logo? -->
      <a href="/" class="logo-text">Price<span class="logo-text__span">Tracker</span></a>
      <ul id="nav-mobile" class="right hide-on-med-and-down">
        <li><a href="/sites" class="navbar__link">Sites</a></li>
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

  &__span {
    color: $purple;
  }
}

.navbar {
  background-color: $light-green;
  
  &__link {
    color: $grey-light;
  }
}
</style>