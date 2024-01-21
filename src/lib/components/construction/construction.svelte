<script lang="ts">
	import Construction from '~icons/lucide/construction';
	import * as m from '$paraglide/messages';
</script>

<div>
	<p>
		<Construction color="#e47312" width="1.5rem" height="1.5rem" style="vertical-align: middle;" />
		<b>{m.construction()}</b>
		{m.construction_text()} 🚀
	</p>
</div>

<style>
	div {
		display: flex;
		justify-content: center;
		background-color: #f7f0e3;
		border: 1px solid orange;
		border-radius: 16px;
	}

	p {
		margin-inline: 1.5rem;
	}
</style>
