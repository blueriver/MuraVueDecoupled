<template>
	<div v-if="content">
		<div class="mura-html-queues" v-dyn-html="content.get('htmlheadqueue') + content.get('htmlfootqueue')"></div>
	</div>
</template>

<script>
export default {
  name: 'footer_template',
	props: ['content','Mura'],
	mounted:function(){
		this.render();
	},
	data:function () {
		return {
		}
	},
	methods: {
		render:function(){
	
		}
	},
}
</script>
