import Mura from "mura.js";

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
		Mura(this.context.targetEl).html('Hello!');
		this.trigger('afterRender');
	}
});
