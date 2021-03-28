<template>
  <div class="v-form__wrapper row section">
    <div class="col s6 offset-s4">
      <div class="v-form card-panel medium container">
        <h3 class="v-form__title">Add a site:</h3>
        <form @submit.prevent="createNewSite">
          <div class="input-field">
            <label for="site-url">Site URL (needs to include a https:// or http:// in front)</label>
            <input
              class="validate"
              name="site"
              type="url"
              id="site-url"
              v-model.trim="siteUrl"
              @blur="checkUrl"
            />
            <small class="red-text" v-if="urlValidity === 'invalid'">Please enter a URL.</small>
          </div>
          <div class="input-field">
            <label for="site-name">Site Name</label>
            <input
              class="validate"
              name="name"
              type="text"
              id="site-name"
              v-model.trim="siteName"
              @blur="checkName"
            />
            <small class="red-text" v-if="nameValidity === 'invalid'">Please enter a name for your site.</small>
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
import { ref } from 'vue'

export default {
  name: 'VForm',
  setup() {
    const { siteUrl, siteName, createNewSite } = createSites()
    const urlValidity = ref('pending')
    const nameValidity = ref('pending')
    function checkUrl() {
      siteUrl.value === '' ? urlValidity.value = 'invalid' : urlValidity.value = 'valid'
    }

    function checkName() {
      siteName.value === '' ? nameValidity.value = 'invalid' : nameValidity.value = 'valid'
    } 

    return {
      checkUrl,
      checkName,
      urlValidity,
      nameValidity,
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
    margin-bottom: 40px;
  }

  &__wrapper {
    margin-top: 80px;
  }
}
</style>