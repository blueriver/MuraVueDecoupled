import Mura from "mura.js";
import Example from '@/components/modules/Example'
import Vue from 'vue'

Mura.init({
	rootpath:"http://localhost:8888",
	siteid:"default",
	queueObjects:false,
	processMarkup:false
});

Mura.loader()
	.loadcss(Mura.corepath + '/modules/v1/core_assets/css/mura.7.1.min.css')
	.loadcss(Mura.corepath + '/modules/v1/core_assets/css/mura.7.1.skin.css');

Mura.Module.example=Mura.UI.extend(
 {
	render:function(){
		//let response=this.context.myvar || 'Enter example variable in configurator';
		//Mura(this.context.targetEl).html(response);
		const container=Mura(this.context.targetEl)
		if(!container.attr('id')){
			container.attr('id','mc' + this.context.instanceid);
		}
		const ExampleCtor = Vue.extend(Example)
		const ExampleInstance = new ExampleCtor({ propsData: { context: this.context } })
		ExampleInstance.$mount('#' + container.attr('id'))


		this.trigger('afterRender');
	}
});
