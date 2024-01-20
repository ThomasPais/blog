<script lang="ts">
	import { formatDate } from '$lib/utils';

	import Clock from '~icons/lucide/clock';

	import { Tag } from '$lib/components/tag';
	import { Button } from '$lib/components/button';

	export let title: string;
	export let description: string;
	export let date: string;
	export let slug: string;
	export let categories: string[];
</script>

<div class="wrapper">
	<img alt={title} src="https://placehold.co/1600x900" />

	<div class="content">
		<ul class="tags">
			{#each categories as category}
				<li>
					<Tag label={category.toUpperCase()} />
				</li>
			{/each}
		</ul>

		<h2>{title}</h2>
		<div class="info">
			<span>{formatDate(date)}</span>
			<span class="read-time"><Clock width="0.75rem" height="0.75rem" /> 8mn</span>
		</div>
		<p>{description}</p>
		<a href={slug}>
			<Button label="Read More" />
		</a>
	</div>
</div>

<style>
	.wrapper {
		box-sizing: border-box;
		border-radius: 8px;
		outline: 1px solid #e6e7ea;
		overflow: hidden;
	}

	li {
		list-style: none;
	}

	img {
		width: 100%;
		display: block;
	}

	.content {
		margin-inline: 1.5rem;
		padding-block: 2rem;
		--width: 100%;
	}

	.tags {
		display: flex;
		gap: 1.5rem;
		height: 2rem;
		align-items: center;
	}

	.info {
		font-size: 0.75rem;
		display: flex;
		justify-content: space-between;
		align-items: center;
		height: 1rem;
	}

	.read-time {
		display: flex;
		align-items: center;
		gap: 0.25rem;
	}

	h2 {
		margin-block: 0.25rem;
		display: flex;
		align-items: center;
	}

	p {
		margin-block: 1.5rem;
	}

	@media only screen and (min-width: 480px) {
		.content {
			--width: 10rem;
		}
	}

	@media only screen and (min-width: 768px) {
		.wrapper {
			display: grid;
			grid-template-columns: 1fr 1fr;
		}
	}
</style>
