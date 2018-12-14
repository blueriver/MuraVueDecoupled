<template>
	<div v-if="content && content.get('template')">
		<div v-if="content.get('template')=='Alternate'">
			<!--<alternate-template  :content="content" :Mura="Mura" :key="filename"/>-->
		</div>
		<div v-else-if="content.get('template')=='Another'">
		<!--<another-template  :content="content" :Mura="Mura" :key="filename"/>-->
		</div>
		<div v-else>
			<default-content-template :content="content" :Mura="Mura"/>
		</div>
	</div>
</template>

<script>
import defaultContentTemplate from '@/components/templates/Default'
//import alterateContentTemplate from '@/components/templates/Alternate'
//import anotherContentTemplate from '@/components/templates/Another'

export default {
  name: 'content-default',
	props: ['Mura'],
	mounted:function(){
		this.render(this.$router.currentRoute.path.substr(1));
	},
	watch:{
		'$route':function (to) {
			this.render(to.path.substr(1));
		}
	},
	data:function () {
		return {
			content: ''
		}
	},
	methods: {
		render:function(path){
			this.Mura
				.renderFilename(path,this.Mura.getQueryStringParams())
					.then((rendered) => {
						this.content=rendered;
						this.Mura.init(this.content.get('config'));
				},
				() => {
				//add logic to handle 404
			});
		},

	},
	components:{
		defaultContentTemplate
	}
}
</script>
