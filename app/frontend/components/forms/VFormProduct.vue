<template>
  <div class="v-form__wrapper row section">
    <div class="col s6 offset-s4">
      <div class="v-form card-panel medium container">
        <h3 class="v-form__title">Add a new product:</h3>
        <form @submit.prevent="createNewProduct">
          <div class="input-field">
            <label class="product-name" for="product-name"
              >Product Name
              <tooltip-info
                class="tooltip-icon"
                :message="additionalInfo"
              ></tooltip-info
            ></label>
            <input
              class="validate"
              name="name"
              type="text"
              id="product-name"
              v-model.trim="productName"
              @blur="checkName"
            />
            <small class="red-text" v-if="nameValidity === 'invalid'"
              >Please enter a name for your product.</small
            >
          </div>

          <div class="submit-wrapper section">
            <button
              :disabled="productName === ''"
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
import { createProducts } from '@/composables/useProducts.js'
import { ref } from 'vue'
import TooltipInfo from '../tooltip/TooltipInfo.vue'

export default {
  name: 'VFormProduct',
  components: { TooltipInfo },
  props: {
    additionalInfo: {
      type: String,
      default: ''
    },
  },
  setup() {
    const { productName, createNewProduct } = createProducts()
    const nameValidity = ref('pending')
    function checkName() {
      productName.value === '' ? nameValidity.value = 'invalid' : nameValidity.value = 'valid'
    }

    return {
      checkName,
      nameValidity,
      productName,
      createNewProduct
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

.product-name {
  display: flex;
  align-items: center;
}

.tooltip-icon {
  margin-left: 8px;
}
</style>