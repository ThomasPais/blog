<script lang="ts">
	import { Construction } from '$lib/components/construction';

	import { Header } from '$lib/layout/header';
	import { Footer } from '$lib/layout/footer';

	import '../app.css';
</script>

<Header />
<main>
	<div class="construction-message">
		<Construction />
	</div>

	<slot />
</main>
<Footer />

<style>
	.construction-message {
		display: flex;
		justify-content: center;
	}
</style>
