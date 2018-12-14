<template>
	<div v-if="content">
		<header-template :content="content" :Mura="Mura"/>
 		<default-content-type-template :content="content" :Mura="Mura"/>
		<footer-template :content="content" :Mura="Mura"/>
	</div>
</template>

<script>
import FooterTemplate from './inc/Footer'
import HeaderTemplate from './inc/Header'
import DefaultContentTypeTemplate from '@/components/contenttypes/Default'

export default {
  name: 'default-content-template',
	props:['content','Mura'],
	mounted:function(){
		this.render();
	},
	data:function () {
		return {}
	},
	methods: {
		render:function(){

		}
	},
	components: {
      HeaderTemplate,
			FooterTemplate,
			DefaultContentTypeTemplate
  }
}
</script>
