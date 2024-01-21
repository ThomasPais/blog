<script lang="ts">
	import { page } from '$app/stores';
	import { availableLanguageTags, sourceLanguageTag } from '$paraglide/runtime';
	import { translatePath } from './i18n';
</script>

<svelte:head>
	{#each availableLanguageTags as lang}
		<link rel="alternate" hreflang={lang} href={translatePath($page.url.pathname, lang)} />
	{/each}
</svelte:head>
