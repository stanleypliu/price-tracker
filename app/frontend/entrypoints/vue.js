import { createApp } from 'vue/dist/vue.esm-bundler'

import CardsLarge from '../components/cards/CardsLarge.vue'
import HeroLarge from '../components/hero/HeroLarge.vue'
import HeroSite from '../components/hero/HeroSite.vue'
import HeroSites from '../components/hero/HeroSites.vue'
import NavBar from '../components/navbar/NavBar.vue'
import TableLarge from '../components/table/TableLarge.vue'
import VForm from '../components/forms/VForm.vue'

export default () => {
    document.addEventListener('DOMContentLoaded', () => {
        createApp({
          components: {
            CardsLarge,
            HeroLarge,
            HeroSite,
            HeroSites,
            NavBar,
            TableLarge,
            VForm
          }  
        }).mount('#v-app')
    })
}
