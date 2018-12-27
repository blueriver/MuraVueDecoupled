<template>
	<div>
		<h3 v-if="context.myvar">{{context.myvar}}</h3>
		<h3 v-if="!context.myvar">Enter example variable in configurator</h3>
	</div>
</template>

<script>
export default {
	name: 'example',
	props: ['context']
}
</script>
