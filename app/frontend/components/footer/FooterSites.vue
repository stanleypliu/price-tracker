<template>
  <div class="footer--sites">
    <div class="container">
      <h5>{{ message }}</h5>
      <slot></slot>
    </div>
  </div>
</template>

<script>
import { ref } from 'vue'

export default {
  name: 'FooterSites',
  setup() {
    const message = ref('If you think there are any sites missing, feel free to submit one and I\'ll check its suitability 😉')

    return {
      message
    }
  }
}
</script>

<style lang="scss" scoped>
   @keyframes move-in-from-bottom {
    0% { height: 0; }
    100% {  height: 20vh; }
  }

  .footer--sites {
    border-top: 1px solid black;

    position: fixed; 
    left: 0;
    bottom: 0;
    right: 0;

    z-index: 2;

    animation: move-in-from-bottom 1s forwards;
  }
</style>