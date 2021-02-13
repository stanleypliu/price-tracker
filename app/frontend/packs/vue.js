import { createApp } from 'vue/dist/vue.esm-bundler'

import HeroHome from '../components/hero/HeroHome.vue'
import NavBar from '../components/navbar/NavBar.vue'

export default () => {
    document.addEventListener('DOMContentLoaded', () => {
        createApp({
          components: {
            HeroHome,
            NavBar
          }  
        }).mount('#v-app')
    })
}
