<script lang="ts">
	import { browser } from '$app/environment';
	import { createTooltip, melt } from '@melt-ui/svelte';
	import { fade } from 'svelte/transition';

	const {
		elements: { trigger, content, arrow },
		states: { open }
	} = createTooltip({
		forceVisible: true,
		openDelay: 500
	});

	export let text = 'Tooltip text';
</script>

<div use:melt={$trigger}>
	<slot />
</div>

{#if $open}
	<div
		use:melt={$content}
		transition:fade={{ duration: 100 }}
		class="z-50 rounded-md bg-neutral-700 px-2 py-1 text-sm text-neutral-50 shadow-sm"
		data-open={$open ? '' : undefined}
		class:hidden={!browser}
	>
		<div use:melt={$arrow} />
		<p>{text}</p>
	</div>
{/if}

<style>
	/*
	[data-melt-tooltip-trigger] {
		display: grid;
		place-items: center;
	}

	[data-melt-tooltip-content] {
		opacity: 0;
		visibility: hidden;
		transition: 150ms ease;

		&[data-open] {
			opacity: 1;
			visibility: visible;
		}
	}*/
</style>
