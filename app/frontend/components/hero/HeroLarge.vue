<template>
  <div
    class="hero-large"
    :style="image"
  >
    <div class="container row">
      <div class="col s7 offset-s4">
        <h1 class="hero-large__title section">{{ title }}</h1>
        <br>
        <h3 class="hero-large__description section">{{ message }}</h3>
      </div>
    </div>
  </div>
</template>

<script>
import { computed } from 'vue'
import { getPhotoUrl } from '@/utils/photos'

export default {
  name: 'HeroLarge',
  props: {
    backgroundImage: {
      type: String,
      default: 'ecommerce'
    },
    title: {
      type: String,
      default: ''
    },
    message: {
      type: String,
      default: ''
    }
  },
  setup(props) {
    const image = computed(() => ({ 'background-image': `url("${getPhotoUrl(props.backgroundImage)}")` }))

    return {
      image
    }
  }
}
</script>

<style scoped lang="scss">
.hero-large {
  background-size: cover;
  background-position: right;

  color: white;

  height: 100vh;

  position: relative;

  &:before {
    background: #95a3b3; 
    content: '';
    filter: opacity(0.3);

    width: 100%;
    height: 100%;

    display: block;
    position: absolute;
    top: 0;
    left: 0;
    z-index: 2;
  }
}
</style>