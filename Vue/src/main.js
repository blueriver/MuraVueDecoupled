import Vue from 'vue'
import App from './App.vue'
import Router from 'vue-router'
import ContentNode from '@/components/ContentNode'
import Mura from "mura.js"

require("../mura.config.js")

Vue.use(Router)

const routes = [
  { path: '*',
	component: ContentNode,
	props: {Mura:Mura}
	}
]

const router= new Router({
	routes:routes}
)

Vue.config.productionTip = false

// Register a global custom directive called `v-focus`
Vue.directive('dyn-html', {
	bind: function (el,binding) {
		Mura(el).html(binding.value)
	}
})

new Vue({
	router,
  render: h => h(App)
}).$mount('#app')
