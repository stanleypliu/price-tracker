import { createApp } from 'vue/dist/vue.esm-bundler'

import HelloWorld from '../components/app.vue'

export default () => {
    document.addEventListener('DOMContentLoaded', () => {
        createApp({
          components: {
            HelloWorld
          }  
        }).mount('#v-app')
    })
}
