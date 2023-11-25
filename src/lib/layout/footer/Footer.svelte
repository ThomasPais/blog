<script lang="ts">
	import Mail from '~icons/lucide/mail';
	import Linkedin from '~icons/lucide/linkedin';
	import Github from '~icons/lucide/github';
</script>

<footer class="container footer-container">
	<div class="socials">
		<a href="/" target="_blank" class="social"><Mail /></a>
		<a href="/" target="_blank" class="social"><Linkedin /></a>
		<a href="/" target="_blank" class="social"><Github /></a>
	</div>
	<div class="copyrights">
		<p>Thomas Païs • &copy; {new Date().getFullYear()} • All rights reserved</p>
	</div>
	<div class="author"><p>Made with Sveltekit</p></div>
</footer>

<style>
	.footer-container {
		margin-top: 64px;
		display: flex;
		flex-direction: column;
		align-items: center;
	}

	.socials {
		display: flex;
		gap: 1rem;
		margin-bottom: 0.75rem;
	}

	.social {
		background-color: gray;
		color: white;
		font-size: 1.25rem;
		padding: 0.375rem;
		display: grid;
		place-items: center;
		transition: background-color 300ms;
	}

	.social:hover {
		background-color: black;
	}

	p {
		margin-block: 0;
		font-size: 0.875rem;
		line-height: 1.25rem;
	}

	.copyrights {
		margin-bottom: 0.5rem;
	}

	.author {
		margin-bottom: 2rem;
	}
</style>
