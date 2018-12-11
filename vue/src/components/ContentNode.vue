<template>
  <div class="content-container">
		<div v-if="isloading" class="centerFlex">
			<BeatLoader size="100px"/>
		</div>
		<div v-else>
			<component :is="template" :content="content" :Mura="Mura" :key="filename"/>
		</div>
	</div>
</template>

<script>
import Default from '@/components/templates/Default'
import BeatLoader from 'vue-spinner/src/BeatLoader'

const validTemplates=['default'];

export default {
  name: 'ContentNode',
	props: ['Mura'],
	mounted:function(){
		this.renderNode(this.$router.currentRoute.path.substr(1));
	},
	watch:{
		'$route':function (to) {
			this.renderNode(to.path.substr(1));
		}
	},
	data:function () {
		return {
			isloading: true,
			content: '',
			filename: '',
			template: 'Default'
		}
	},
	methods: {
		renderNode:function(path){
			this.filename=path
			this.isloading=true;
			this.Mura
				.renderFilename(this.filename,this.Mura.getQueryStringParams())
					.then((result) => {

					if(validTemplates.find((element) =>{ return (element == result.get('template'))})){
						this.template=result.get('template');
					} else {

						this.template='Default';
					}

					this.isloading=false;
					this.content=result;

				},
				() => {
				//add logic to handle 404
			});
		},

	},
	components:{
		Default,
		BeatLoader
	}
}
</script>

<style>
	.content-container {
		width: 800px;
	}
</style>
