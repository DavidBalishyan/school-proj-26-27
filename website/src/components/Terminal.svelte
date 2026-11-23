<script>
  import CopyButton from './CopyButton.svelte'

  let { title = '', copyText = '', children } = $props()
</script>

<div class="terminal">
  <div class="terminal-bar">
    <div class="terminal-dots" aria-hidden="true">
      <span class="dot dot-red"></span>
      <span class="dot dot-yellow"></span>
      <span class="dot dot-green"></span>
    </div>
    {#if title}
      <span class="terminal-title">{title}</span>
    {:else}
      <span></span>
    {/if}
    <div class="terminal-actions">
      {#if copyText}
        <CopyButton text={copyText} />
      {/if}
    </div>
  </div>
  <div class="terminal-body">
    {@render children?.()}
  </div>
</div>
