import Vue from 'vue'
import App from './App.vue'
import Router from 'vue-router'
import ContentNode from '@/components/ContentNode'
import Mura from "mura.js"

Mura.init({
	rootpath:"http://localhost:8888",
	siteid:"default"
});

Mura.loader()
	.loadcss(Mura.corepath + '/modules/v1/core_assets/css/mura.7.1.min.css')
	.loadcss(Mura.corepath + '/modules/v1/core_assets/css/mura.7.1.skin.css');

Vue.use(Router)

const routes = [
  { path: '*',
	component: ContentNode,
	props: {Mura:Mura}
	}
];

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
