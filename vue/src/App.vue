<template>
	<div id="app" class="centerFlex">
		<router-view></router-view>
	</div>
</template>

<script>
export default {
  name: 'app'
}
</script>

<style>
body {
	margin: 40px;
}

.sidebar {
	grid-area: sidebar;
}

.content {
	grid-area: content;
	position: relative;
}

.header {
	grid-area: header;
}

.footer {
	grid-area: footer;
}


.wrapper {
	display: grid;
	grid-gap: 10px;
	grid-template-columns: 33% 33% 33%;
	grid-template-areas:
	"header  header  header"
	"sidebar content content"
	"footer  footer  footer";

}

.box {
	border: 1px solid black;
	border-radius: 5px;
	padding: 50px;
	font-size: 150%;

}

.header, .footer {

}

li {
	list-style: none;
}
ul.mura-nav-vertical > li {
	display: inline-block;
}

ul.mura-nav-vertical>  li+li:before {
    padding: 8px;
    color: black;
    content: "/\00a0";
}

.centerFlex {
  align-items: center;
  display: flex;
  justify-content: center;
}

</style>
