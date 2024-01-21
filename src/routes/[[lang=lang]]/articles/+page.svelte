<script lang="ts">
	import { Card } from '$lib/components/card';

	export let data;
</script>

<!-- Posts -->
<section>
	<ul class="posts">
		{#each data.posts as post}
			<li class="post">
				<Card
					title={post.title}
					description={post.description}
					date={post.date}
					slug={post.slug}
					categories={post.categories}
				/>
			</li>
		{/each}
	</ul>
</section>

<style>
	.posts {
		display: grid;
		gap: 2rem;
	}

	.post {
		list-style: none;
	}
</style>
