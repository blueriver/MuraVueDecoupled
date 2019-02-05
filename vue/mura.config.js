import Mura from "mura.js";
import Example from '@/components/modules/Example'
import CollectionLayout from '@/components/modules/CollectionLayout'
import Vue from 'vue'

Mura.UI.Vue=Mura.UI.extend(
/** @lends Mura.UI.Vue.prototype */
{
	vm:'',

	$vm:function(){
		if(!this.vm){
			this.vm=new Vue(
				Object.assign({},
					this.component,
					{
						propsData:{ context: this.context }
					})
			);
		}
		return this.vm;
	},

	renderClient:function(){
		const container=Mura(this.context.targetEl)
		if(!container.node.firstChild){
			container.node.appendChild(document.createElement('DIV'));
		}
		container.node.firstChild.setAttribute('id','mc' + this.context.instanceid)
		this.$vm().$mount('#mc' + this.context.instanceid)
		this.trigger('afterRender');
	},

	destroy:function(){
		const container=Mura(this.context.targetEl)
		if(container.length && container.node.innerHTML){
			container.node.firstChild.setAttribute('id','mc' + this.context.instanceid)
			this.$vm().$destroy();
		}
	}

});

Mura.Module.Example=Mura.UI.Vue.extend(
 {
	component:Example
});

//This is registered as a collection layout in the mura.config.json
Mura.Module.VueCollectionLayout=Mura.UI.Vue.extend(
 {
	component:CollectionLayout
});

Mura.init({
	rootpath:"http://localhost:8888",
	siteid:"default",
	queueObjects:false,
	processMarkup:false
});

Mura.loader()
	.loadcss(Mura.corepath + '/modules/v1/core_assets/css/mura.7.1.min.css')
	.loadcss(Mura.corepath + '/modules/v1/core_assets/css/mura.7.1.skin.css');
