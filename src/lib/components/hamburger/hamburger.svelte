<script lang="ts">
	export let open = false;

	function setOpen(value: boolean) {
		open = value;
	}
</script>

<button
	type="button"
	aria-controls="navbar"
	aria-expanded={open}
	aria-label={open ? 'Close navigation menu' : 'Open navigation menu'}
	on:click={() => setOpen(!open)}
>
	<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="currentColor">
		<rect class="top" width="18" height="2" x="3" y="5" rx="1"> </rect>
		<rect class="middle" width="18" height="2" x="3" y="11" rx="1"> </rect>
		<rect class="bottom" width="18" height="2" x="3" y="17" rx="1"> </rect>
	</svg>
</button>

<style>
	button {
		background: none;
		border: none;
		color: var(--color, black);
		cursor: pointer;
		padding: 0;
		display: flex;
		align-items: center;
		justify-content: center;
	}

	svg {
		width: var(--size, 1.75rem);
		height: var(--size, 1.75rem);
	}

	rect {
		transform-origin: center;
		transition:
			y 250ms ease 250ms,
			rotate 250ms ease,
			opacity 0ms 250ms;
	}

	[aria-expanded='true'] rect {
		transition:
			y 250ms ease,
			rotate 250ms ease 250ms,
			opacity 0ms 250ms;
	}

	[aria-expanded='true'] :is(.top, .bottom) {
		y: 11px;
	}

	[aria-expanded='true'] .top {
		rotate: 45deg;
	}

	[aria-expanded='true'] .middle {
		opacity: 0;
	}

	[aria-expanded='true'] .bottom {
		rotate: -45deg;
	}
</style>
