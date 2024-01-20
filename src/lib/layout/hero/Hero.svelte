<script lang="ts">
	import Mail from '~icons/lucide/mail';
	import Linkedin from '~icons/lucide/linkedin';
	import Github from '~icons/lucide/github';
	import Download from '~icons/lucide/download';
</script>

<section class="container">
	<div class="grid">
		<h1 class="title">Thomas Païs</h1>

		<div class="perfil">
			<img src="perfil.png" alt="Thomas Païs" class="image" />

			<div class="socials">
				<a href="/" target="_blank" class="social"><Mail /></a>
				<a href="/" target="_blank" class="social"><Linkedin /></a>
				<a href="/" target="_blank" class="social"><Github /></a>
			</div>
		</div>

		<div class="info">
			<p class="description">
				<b>Étudiant en école d'ingénieur</b> Lorem ipsum, dolor sit amet consectetur adipisicing elit.
				Impedit temporibus perferendis libero totam, rerum voluptas tenetur debitis enim quo doloremque
				repudiandae distinctio vel ea reprehenderit cupiditate laboriosam iusto optio obcaecati.
			</p>
		</div>
		<a href="/" class="resume">Download CV <Download /></a>
	</div>
</section>

<style>
	section {
		padding-block: 2.5rem;
	}

	.title {
		text-align: center;
		margin-bottom: 0;
		font-size: var(--biggest-font-size);
	}

	.perfil {
		position: relative;
		justify-self: center;
	}

	.image {
		width: 224px;
		border: 4px solid black;
	}

	.socials {
		height: max-content;
		display: grid;
		row-gap: 1rem;
		position: absolute;
		margin: auto 0;
		top: 0;
		bottom: 0;
		left: -3rem;
	}

	.social {
		padding: 0.375rem;
		background: grey;
		color: white;
		font-size: 1.25rem;
		display: grid;
		place-items: center;
		transition: background-color 300ms ease;
	}

	.social:hover {
		background: black;
	}

	.description {
		text-align: center;
		margin-block: 0;
		font-size: var(--h3-font-size);
	}

	.resume {
		padding: 0.5rem 1rem;
		color: white;
		background: gray;
		transition: background-color 300ms ease;
		justify-self: center;
	}

	.resume:hover {
		background: black;
	}

	/* Medium devices (landscape tablets, 768px and up) */
	@media only screen and (min-width: 768px) {
		.grid {
			grid-template-columns: 1fr 1fr;
			gap: 2rem 4rem;
			align-items: center;
			padding: 5rem;
		}

		.title,
		.description {
			text-align: justify;
		}

		.title {
			align-self: flex-end;
		}

		.perfil {
			grid-column: 2/3;
			grid-row: 1/4;
		}

		.image {
			width: 320px;
		}

		.socials {
			left: auto;
			right: -3rem;
		}

		.info {
			align-self: flex-start;
		}

		.description {
			position: relative;
			padding-left: 3rem;
			font-size: 1.25rem;
		}

		.resume {
			align-self: start;
		}
	}
</style>
