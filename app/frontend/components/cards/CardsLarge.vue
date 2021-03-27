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
  background-color: rgba($green, 0.1);
  height: 100vh;

  &__cards {
    margin: 0;
  }
}
</style>