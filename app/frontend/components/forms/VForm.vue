<template>
  <div class="row section">
    <div class="col s6 offset-s4">
      <div class="v-form container">
        <h3 class="v-form__header">Add a site:</h3>
        <label for="site">Site URL</label>
        <input type="text" id="site" />
        <label for="name">Site Name</label>
        <input type="text" id="name" />

        <div class="submit-wrapper">
          <button
            type="submit"
            class="waves-effect waves-light btn"
            name="action"
            @click="createNewSite"
          >
            <i class="material-icons right">send</i>Submit
          </button>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: 'VForm',
  setup() {


    return {}
  }
}
</script>

<style lang="scss" scoped>
@import "materialize-css/dist/css/materialize";

.v-form {
  @extend .card;

  padding: 40px;

  &__header {
    margin-top: 0;
  }
}

.submit-wrapper {
  @extend .section;
}
</style>