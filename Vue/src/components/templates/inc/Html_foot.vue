<template>
<div class="mura-html-queues" v-dyn-html="content.get('htmlheadqueue') + content.get('htmlfootqueue')"></div>
</template>

<script>
export default {
  name: 'html_foot',
	props: ['content']
}
</script>
