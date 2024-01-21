<script lang="ts">
	import { Hamburger } from '$lib/components/hamburger';
	import { LanguageButton } from '$lib/components/language-button';
	import { Tooltip } from '$lib/components/tooltip';

	import { createSeparator, melt, type CreateSeparatorProps } from '@melt-ui/svelte';

	import Search from '~icons/lucide/search';
	import Moon from '~icons/lucide/moon';

	import { page } from '$app/stores';
	$: pathname = $page.url.pathname;

	export let orientation: CreateSeparatorProps['orientation'] = 'vertical';

	const {
		elements: { root: vertical }
	} = createSeparator({
		orientation,
		decorative: true
	});

	let open = false;
</script>

<header>
	<a href="/" class="logo"
		><span class="small-logo">TP</span>
		<span class="big-logo">Thomas Païs</span>
	</a>

	<div class="navbar">
		<nav>
			<ul>
				<li>
					<a href="/about" class="link" class:active={pathname == '/about'}>About</a>
				</li>
				<li>
					<a href="/projects" class="link" class:active={pathname == '/projects'}>Projects</a>
				</li>
				<li>
					<a href="/articles" class="link" class:active={pathname == '/articles'}>Articles</a>
				</li>
				<li>
					<a href="/contact" class="link" class:active={pathname == '/contact'}>Contact</a>
				</li>
			</ul>
		</nav>

		<div use:melt={$vertical} class="separator-vertical" />

		<div class="settings">
			<LanguageButton />
			<Tooltip text="Search"><Search width="24px" height="24px" stroke="currentColor" /></Tooltip>
			<Tooltip text="Switch theme"
				><Moon width="24px" height="24px" stroke="currentColor" /></Tooltip
			>
		</div>

		<div use:melt={$vertical} class="separator-vertical" />

		<div class="mobile-button">
			<Hamburger --size="1.75rem" --color="currentColor" open />
		</div>
	</div>
</header>

<style>
	header {
		height: 64px;
		padding-inline: 16px;
		display: flex;
		justify-content: space-between;
		align-items: center;
	}

	.logo {
		font-size: 1.5rem;
	}

	.big-logo {
		display: none;
	}

	.navbar {
		display: flex;
		align-items: center;
	}

	nav {
		display: none;
	}

	ul {
		margin: 0;
		list-style-type: none;
		display: flex;
		gap: 1rem;
	}

	.link {
		position: relative;
	}

	.link::after {
		position: absolute;
		bottom: 0;
		left: 0;
		content: '';
		transform: scaleX(0);
		display: block;
		width: 100%;
		height: 0.1em;
		background: var(--highlight-color);
		transition: transform 0.1s cubic-bezier(0.5, 0, 0.5, 1);
		transform-origin: right;
	}

	.active {
		font-weight: 700;
	}

	.link:hover::after,
	.active::after {
		transform: scaleX(1);
	}

	.separator-vertical {
		height: 1.5rem;
		width: 1px;
		background-color: var(--text-color);
		margin-inline: 1rem;
	}

	.settings {
		display: flex;
		align-items: center;
		gap: 1rem;
	}

	@media only screen and (min-width: 640px) {
		header {
			padding-inline: 32px;
		}

		.small-logo {
			display: none;
		}

		.big-logo {
			display: block;
		}

		.settings {
			gap: 1.5rem;
		}

		.mobile-button {
			margin-left: 0.75rem;
		}
	}

	@media only screen and (min-width: 768px) {
		nav {
			display: block;
		}

		ul {
			gap: 1.5rem;
		}

		.mobile-button {
			display: none;
		}
	}

	@media only screen and (min-width: 1024px) {
		header {
			padding-inline: 64px;
		}
	}
</style>
