import Mura from "mura.js";
import Example from '@/components/modules/Example'
import CollectionLayout from '@/components/modules/CollectionLayout'
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

Mura.Module.Example=Mura.UI.Vue.extend(
 {
	component:Example
});

//This is registered as a collection layout in the mura.config.json
Mura.Module.VueCollectionLayout=Mura.UI.Vue.extend(
 {
	component:CollectionLayout
});
