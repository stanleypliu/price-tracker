<template>
  <div
    class="hero-large"
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
// import ECommerceImage from '@/images/photos/ecommerce.jpg'

export default {
  name: 'HeroLarge',
  props: {
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
    

    return {
      // style
      // ECommerceImage
    }
  }
}
</script>

<style scoped lang="scss">
.hero-large {
  background-image: url("../../images/photos/ecommerce.jpg");
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