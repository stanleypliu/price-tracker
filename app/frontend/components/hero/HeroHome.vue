<template>
  <div class="container row">
    <div class="col s6">
      <h1>{{ title }}</h1>
    </div>
  </div>
  <div class="container row">
    <div class="col s6">
      <h3>{{ message }}</h3>
    </div>
  </div>
</template>

<script>
import { ref } from 'vue'

export default {
  name: 'HelloWorld',
  setup() {
    const title = ref('Price Tracker')
    const message = ref('Set up price trackers that crawl the internet for your favourite products 📣')

    return {
      title,
      message
    }
  }
}
</script>