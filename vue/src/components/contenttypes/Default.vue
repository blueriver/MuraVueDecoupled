<style>
/* Style the list */

	ul.breadcrumb {
		padding: 10px 16px;
		list-style: none;
		background-color: #eee;
	}

	/* Display list items side by side */
	ul.breadcrumb li {
		display: inline;
		font-size: 18px;
	}

	/* Add a slash symbol (/) before/behind each list item */
	ul.breadcrumb li+li:before {
		padding: 8px;
		color: black;
		content: "/\00a0";
	}

	/* Add a color to all links inside the list */
	ul.breadcrumb li a {
		color: #0275d8;
		text-decoration: none;
	}

	/* Add a color on mouse-over */
	ul.breadcrumb li a:hover {
		color: #01447e;
		text-decoration: underline;
	}
</style>

<template>
	<div v-if="content">
		<h1>{{content.get('title')}}</h1>
		<ul title="Crumb Navigtion" class="breadcrumb" v-if="crumbNav && crumbNav.length > 1">
			<li v-for="item of crumbNav">
					<a :href="item.url">{{item.menutitle}}</a>
			</li>
		</ul>

		<div id="content-body"></div>
		<div class="mura-region-container" data-region="maincontent"></div>
	</div>
</template>

<script>
export default {
	name: 'default-content-type-template',
	props: ['content','Mura'],
	mounted:function(){
		this.render()
	},
	data:function () {
		return {
			crumbNav: ''
		}
	},
	methods:{
		render(){
			this.Mura('#content-body').html(this.content.get('body'));
			this.Mura('.mura-region-container').each(
			(region)=>{
					region=this.Mura(region);
					region.html(
						this.content.renderDisplayRegion(region.data('region'))
					)
				}
			)
			this.content.get('crumbs')
			.then(collection=>{
				this.crumbNav=collection.getAll().items.reverse();
			});
		}
	}
}
</script>
