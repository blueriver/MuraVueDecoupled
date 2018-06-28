<template>
	<transition name="fade">
	<div>
	<h1>Headless Example Site</h1>
	<div class="wrapper">
		<div class="box header">
			<h1>{{content.get('title')}}</h1>

			<h3>Primary Nav</h3>
			<ul class="mura-primary-nav mura-nav-vertical">
			</ul>
		</div>
		<div class="box sidebar">
			<h3>Child Nav</h3>
			<ul class="mura-child-nav"></ul>
			<div class="mura-region-container" data-region="leftcolumn" v-dyn-html="content.renderDisplayRegion('leftcolumn')"></div>
		</div>
		<div class="box content">
			<h3>Crumb Nav</h3>
			<ul class="mura-crumb-nav mura-nav-vertical"></ul>
			<div class="mura-content" v-dyn-html="content.get('body')"></div>
			<div class="mura-region-container" data-region="maincontent" v-dyn-html="content.renderDisplayRegion('maincontent')"></div>
		</div>
	</div>
		<Html_foot :content="content"/>
	</div>
	</transition>
</template>

<script>
import Html_foot from './inc/Html_foot'

export default {
  name: 'default',
	mounted:function(){
		this.renderNode();
	},
	props:['content','Mura'],
	data:function () {
		return {
			primarynav:{}
		}
	},
	methods: {
		buildNav:function(container,parentid){
			container.html('');

			if(parentid=='00000000000000000000000000000000001'){
				container.html('<li><a href="./#/">Home</a></li>');
			}

			this.Mura.getFeed('content')
			.where()
			.prop('parentid').isEQ(parentid)
			.getQuery()
			.then(collection=>{
				collection.forEach(item=>{
						container.append('<li><a href="' + item.get('url') + '">' + item.get('menutitle') + '</a></li>');
				});
			});
		},
		renderNav:function(container,collection){
			container.html('');
			collection.forEach(item=>{
				container.append('<li><a href="' + item.get('url') + '">' + item.get('menutitle') + '</a></li>');
			});
		},
		buildCrumbs:function(content){
			content.get('crumbs').then(collection=>{
				collection.get('items').reverse();
				this.renderNav( this.Mura('.mura-crumb-nav'),collection);
			});
		},
		renderNode:function(){
			this.buildNav(this.Mura('.mura-primary-nav'),'00000000000000000000000000000000001')
			this.Mura.extend(this.Mura,this.content.get('config'));

			if(this.content.hasParent() && this.content.get('type') != 'Folder' && this.content.get('type') != 'Calendar'){
				this.buildNav(this.Mura('.mura-child-nav'),this.content.get('contentid'));
			} else {
				this.Mura('.mura-child-nav').html('');
			}

			this.buildCrumbs(this.content);

			this.Mura(document).processMarkup();
		}
	},
	components: {
      Html_foot
  }
}
</script>

<style>
.fade-enter-active {
  transition: opacity .5s;
}
.fade-enter, .fade-leave-to /* .fade-leave-active below version 2.1.8 */ {
  opacity: 0;
}
</style>
