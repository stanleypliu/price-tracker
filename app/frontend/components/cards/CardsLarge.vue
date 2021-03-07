<template>
  <div class="cards-large" :id="anchorId">
    <ul class="cards-large__cards">
      <li></li>
      <li></li>
      <li></li>
    </ul>
  </div>
</template>

<script>
export default {
  name: 'CardsLarge',
  props: {
    anchorId: {
      type: String,
      default: ''
    },
    contents: {
      type: Array,
      default: () => ([])
    },
  },
  setup () {
    

    return {}
  }
}
</script>

<style lang="scss" scoped>
.cards-large {
  background-color: $grey-light;
  height: 100vh;

}
</style>