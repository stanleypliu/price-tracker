import { createApp } from 'vue/dist/vue.esm-bundler'

import CardsLarge from '../components/cards/CardsLarge.vue'
import HeroLarge from '../components/hero/HeroLarge.vue'
import HeroSmall from '../components/hero/HeroSmall.vue'
import NavBar from '../components/navbar/NavBar.vue'
import TableLarge from '../components/table/TableLarge.vue'

export default () => {
    document.addEventListener('DOMContentLoaded', () => {
        createApp({
          components: {
            CardsLarge,
            HeroLarge,
            HeroSmall,
            NavBar,
            TableLarge
          }  
        }).mount('#v-app')
    })
}
