import { createApp } from 'vue/dist/vue.esm-bundler'

import CardsLarge from '../components/cards/CardsLarge.vue'
import FooterSites from '../components/footer/FooterSites.vue'
import HeroLarge from '../components/hero/HeroLarge.vue'
import HeroProducts from '../components/hero/HeroProducts.vue'
import HeroSite from '../components/hero/HeroSite.vue'
import HeroSites from '../components/hero/HeroSites.vue'
import ListSites from '../components/list/ListSites.vue'
import NavBar from '../components/navbar/NavBar.vue'
import TableLarge from '../components/table/TableLarge.vue'
import VForm from '../components/forms/VForm.vue'
import VFormProduct from '../components/forms/VFormProduct.vue'

export default () => {
    document.addEventListener('DOMContentLoaded', () => {
        createApp({
          components: {
            CardsLarge,
            FooterSites,
            HeroLarge,
            HeroProducts,
            HeroSite,
            HeroSites,
            ListSites,
            NavBar,
            TableLarge,
            VForm,
            VFormProduct
          }
        }).mount('#v-app')
    })
}
