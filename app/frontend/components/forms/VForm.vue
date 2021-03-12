<template>
  <div class="v-form__wrapper row section">
    <div class="col s6 offset-s4">
      <div class="v-form card-panel medium container">
        <h3 class="v-form__title">Add a site:</h3>
        <form @submit="createNewSite">
          <div class="input-field">
            <label for="site-url">Site URL</label>
            <input
              name="site"
              type="url"
              id="site-url"
              v-model.trim="siteUrl"
              @blur="checkIfEmpty(siteUrl)"
            />
          </div>
          <div class="input-field">
            <label for="site-name">Site Name</label>
            <input
              name="name"
              type="text"
              id="site-name"
              v-model.trim="siteName"
              @blur="checkIfEmpty(siteName)"
            />
          </div>

          <div class="submit-wrapper section">
            <button
              :disabled="siteName === '' || siteUrl === ''"
              type="submit"
              class="waves-effect waves-light btn"
            >
              <i class="material-icons right">send</i>Submit
            </button>
          </div>
        </form>
      </div>
    </div>
  </div>
</template>

<script>
import { createSites } from '@/composables/useSites.js'
import { formValidation } from '@/composables/forms.js'

export default {
  name: 'VForm',
  setup() {
    const { siteUrl, siteName, createNewSite } = createSites()
    const { checkIfEmpty } = formValidation()

    return {
      checkIfEmpty,
      siteUrl,
      siteName,
      createNewSite
    }
  }
}
</script>

<style lang="scss" scoped>
.v-form {
  padding: 40px;

  &__title {
    margin-top: 0;
  }

  &__wrapper {
    margin-top: 80px;
  }
}
</style>