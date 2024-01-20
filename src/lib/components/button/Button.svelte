<script lang="ts">
	import Arrow from '~icons/lucide/arrow-right';

	export let label = '';
</script>

<button>{label} <Arrow width="16px" height="16px" /></button>

<style>
	button {
		background: none;
		border: 1px solid royalblue;
		cursor: pointer;
		width: var(--width, 100%);
		height: 48px;
		border-radius: 8px;
		color: royalblue;
		font-size: 1rem;
		display: flex;
		justify-content: center;
		align-items: center;
		gap: 0.25rem;
	}
</style>
