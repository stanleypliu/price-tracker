import { createApp } from 'vue/dist/vue.esm-bundler'

import HeroLarge from '../components/hero/HeroLarge.vue'
import HeroSmall from '../components/hero/HeroSmall.vue'
import NavBar from '../components/navbar/NavBar.vue'
import TableLarge from '../components/table/TableLarge.vue'

export default () => {
    document.addEventListener('DOMContentLoaded', () => {
        createApp({
          components: {
            HeroLarge,
            HeroSmall,
            NavBar,
            TableLarge
          }  
        }).mount('#v-app')
    })
}
