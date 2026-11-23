<script>
  let { label, title, description = '' } = $props()
</script>

<div class="page-head">
  {#if label}
    <div class="section-label">{label}</div>
  {/if}
  <h2>{title}</h2>
  {#if description}
    <p>{description}</p>
  {/if}
</div>
