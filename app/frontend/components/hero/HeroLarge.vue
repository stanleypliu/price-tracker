<template>
  <div class="section" :style="`${ECommerceImage}`">
    <div class="container row">
      <div class="col s6">
        <h1>{{ title }}</h1>
        <h3>{{ message }}</h3>
      </div>
    </div>      
  </div>
</template>

<script>
import ECommerceImage from '../../images/photos/ecommerce.jpg'

import { ref } from 'vue'

export default {
  name: 'HeroLarge',
  setup() {
    const title = ref('Price Tracker')
    const message = ref('Set up price trackers that crawl the internet for your favourite products 📣')

    return {
      title,
      message,
      ECommerceImage
    }
  }
}
</script>