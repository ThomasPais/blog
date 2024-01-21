<script lang="ts">
	import Languages from '~icons/lucide/languages';
	import FR from '~icons/circle-flags/fr';
	import EN from '~icons/circle-flags/gb';
	import ES from '~icons/circle-flags/es';

	import { type Select, createSelect, melt, type SelectOption } from '@melt-ui/svelte';
	import { fade } from 'svelte/transition';
	import { translatePath } from '$lib/i18n';
	import {
		availableLanguageTags,
		languageTag,
		type AvailableLanguageTag
	} from '$paraglide/runtime';

	import Tooltip from '../tooltip/tooltip.svelte';
	import { goto } from '$app/navigation';

	function optionToLang(option: SelectOption<AvailableLanguageTag>): AvailableLanguageTag {
		return option.value;
	}

	const {
		elements: { trigger, menu, arrow, option },
		states: { open }
	} = createSelect<string>({
		forceVisible: true,
		loop: false,
		positioning: {
			placement: 'bottom',
			gutter: 10,
			fitViewport: true
		},

		onSelectedChange: ({ curr, next }) => {
			const definedNext = next ?? curr ?? availableLanguageTags[0];
			goto(translatePath('/', optionToLang(definedNext)));
			return definedNext;
		}
	});
</script>

<Tooltip text="Switch language">
	<button
		class="trigger"
		data-open={$open ? '' : undefined}
		use:melt={$trigger}
		aria-label="Open language switcher"
	>
		<Languages width="24px" height="24px" stroke="currentColor" />
	</button>
</Tooltip>

{#if $open}
	<div use:melt={$menu} transition:fade={{ duration: 150 }} class="dropdown">
		<div use:melt={$arrow} />
		{#each availableLanguageTags as value}
			<button use:melt={$option({ value })}>
				<svelte:component this={value === 'fr' ? FR : value === 'es' ? ES : EN} />
				<span>{value.toUpperCase()}</span>
			</button>
		{/each}
	</div>
{/if}

<style>
	button {
		color: var(--text-color);
		background: none;
		border: none;
	}

	.dropdown {
		display: flex;
		flex-direction: column;
		background-color: lightgrey;
		border-radius: 12px;
		padding: 0.25rem;
		gap: 0.5rem;
	}
</style>
