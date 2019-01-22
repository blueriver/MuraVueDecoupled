<template>
	<div>
	<ul>
		<li v-for="item in context.collection.get('items')">
			<a v-bind:href="item.get('url')">{{item.get('menutitle')}}</a>
		</li>
	</ul>
	<button v-if="context.collection.has('first')"  v-on:click="goToPage('first')">First</button>
	<button v-if="context.collection.has('previous')"  v-on:click="goToPage('previous')">&lt;&lt; Previous</button>
	<button v-if="context.collection.has('next')"  v-on:click="goToPage('next')">Next &gt;&gt;</button>
	<button v-if="context.collection.has('last')"  v-on:click="goToPage('last')">Last</button>
	</div>
</template>

<script>

export default {
	name: 'collection-layout',
	props: ['context'],
	methods:{
		goToPage:function(link){
			link=link || 'missing';
			if(this.context.collection.has(link)){
				this.context.collection.get(link).then((collection)=>{
					this.context.collection=collection;
				})
			}
		}
	}
}
</script>
