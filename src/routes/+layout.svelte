<script lang="ts">
	import { Construction } from '$lib/components/construction';

	import { Navbar } from '$lib/layout/navbar';
	import { Footer } from '$lib/layout/footer';

	import Header from '$lib/Header.svelte';

	import '../app.css';

	import { browser } from '$app/environment';
	import { page } from '$app/stores';
	import { getTextDirection } from '$lib/i18n.js';
	import { setLanguageTag, sourceLanguageTag, type AvailableLanguageTag } from '$paraglide/runtime';

	//Determine the current language from the URL. Fall back to the source language if none is specified.
	$: lang = ($page.params.lang as AvailableLanguageTag) ?? sourceLanguageTag;

	//Set the language tag in the Paraglide runtime.
	//This determines which language the strings are translated to.
	//You should only do this in the template, to avoid concurrent requests interfering with each other.
	$: setLanguageTag(lang);

	//Determine the text direction of the current language
	$: textDirection = getTextDirection(lang);

	//Keep the <html> lang and dir attributes in sync with the current language
	$: if (browser) {
		document.documentElement.dir = textDirection;
		document.documentElement.lang = lang;
	}
</script>

<Header />

{#key lang}
	<Navbar />
	<main>
		<div class="construction-message">
			<Construction />
		</div>

		<slot />
	</main>
	<Footer />
{/key}

<style>
	.construction-message {
		display: flex;
		justify-content: center;
		margin-inline: 2.5rem;
	}
</style>
