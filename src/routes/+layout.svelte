<script lang="ts">
	import { Header } from '$lib/layout/header';
	import { Footer } from '$lib/layout/footer';

	import '../app.css';
</script>

<Header />
<main>
	<slot />
</main>
<Footer />
