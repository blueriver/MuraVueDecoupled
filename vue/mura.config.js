import Mura from "mura.js";
import Example from '@/components/modules/Example'
import Vue from 'vue'

require('mura.js/src/core/ui.vue')

Mura.init({
	rootpath:"http://localhost:8888",
	siteid:"default",
	queueObjects:false,
	processMarkup:false
});

Mura.loader()
	.loadcss(Mura.corepath + '/modules/v1/core_assets/css/mura.7.1.min.css')
	.loadcss(Mura.corepath + '/modules/v1/core_assets/css/mura.7.1.skin.css');

Mura.Module.example=Mura.UI.Vue.extend(
 {
	component:Example
});
