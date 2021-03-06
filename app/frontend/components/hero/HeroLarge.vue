<template>
  <div style="position: relative">
    <div class="hero-large" :style="image"></div>
    <icon-arrow-down
      v-if="downArrow"
      @click="scrollToElem('instructions')"
      class="icon-arrow-down"
    ></icon-arrow-down>
    <div class="hero-large__banner container row">
      <div class="hero-large__text col s7 offset-s3">
        <h1 class="hero-large__title section">{{ title }}</h1>
        <br />
        <h3 class="hero-large__description section">{{ message }}</h3>
      </div>
    </div>
  </div>
</template>

<script>
import { computed } from 'vue'
import { getPhotoUrl } from '@/utils/photos'
import scrollToElem from '@/composables/scrollTo'
import IconArrowDown from '@/components/icons/IconArrowDown.vue'

export default {
  name: 'HeroLarge',
  components: {
    IconArrowDown,
  },
  props: {
    backgroundImage: {
      type: String,
      default: 'ecommerce'
    },
    downArrow: {
      type: Boolean,
      default: true
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
    const image = computed(() => (
      {
        'background-image': `url("${getPhotoUrl(props.backgroundImage)}")`
      }
    ))

    return {
      image,
      scrollToElem
    }
  }
}
</script>

<style scoped lang="scss">
.hero-large {
  background-color: $grey-light;
  background-size: cover;
  background-position: right;

  filter: blur(3px);

  height: 100vh;

  &__banner {
    background-color: rgba($white, 0.8);
    border-right: 1px solid $blue;

    height: 100vh;

    position: absolute;
    top: 0;
  }

  &__text {
    position: absolute;
    top: 20%;
  }

  &__title {
    font-weight: 500;
  }

  &__description {
    font-weight: 200;
  }
}

.icon-arrow-down {
  cursor: pointer;

  height: 40px;
  width: 40px;

  position: absolute;
  bottom: 10px;
  left: 50%;

  z-index: 2;
}
</style>