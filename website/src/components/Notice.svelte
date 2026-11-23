<script>
  let { title, children } = $props()
</script>

<div class="notice">
  <strong>{title}</strong>
  <div class="notice-text">
    {@render children?.()}
  </div>
</div>
