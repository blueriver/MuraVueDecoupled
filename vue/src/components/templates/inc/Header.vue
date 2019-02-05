<style>
ul.primarynav {
	padding: 10px 16px;
	list-style: none;
	background-color: #eee;
}

/* Display list items side by side */
ul.primarynav li {
	display: inline;
	font-size: 18px;
}

/* Add a slash symbol (/) before/behind each list item */
ul.primarynav li+li:before {
	padding: 8px;
	color: black;
	content: "/\00a0";
}

/* Add a color to all links inside the list */
ul.primarynav li a {
	color: #0275d8;
	text-decoration: none;
}

/* Add a color on mouse-over */
ul.primarynav li a:hover {
	color: #01447e;
	text-decoration: underline;
}
</style>

<template>
	<div v-if="primaryNav">
		<ul title="Primary Navigtion" class="primarynav" v-if="primaryNav">
			<li v-for="item of primaryNav" :key="item.contentid">
					<a v-bind:href="item.url">{{item.menutitle}}</a>
			</li>
		</ul>
	</div>
</template>

<script>
export default {
	name: 'header_template',
	props: ['content','Mura'],
	mounted:function(){
		this.render();
	},
	data:function () {
		return {
			primaryNav:''
		}
	},
	methods:{
		render(){
			this.Mura.getFeed('content')
			.where()
			.prop('parentid').isEQ('00000000000000000000000000000000001')
			.sort('orderno')
			.getQuery()
			.then(collection=>{
				let tempArray=collection.getAll().items;
				tempArray.unshift({url:"/",menutitle:"Home"});
				this.primaryNav=tempArray;
			});
		}
	}
}
</script>
