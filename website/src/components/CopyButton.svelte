<script>
  import { onDestroy } from 'svelte'
  import { dict } from '../lib/i18n.js'

  let { text } = $props()

  let label = $state(null)
  let timer

  async function copy() {
    try {
      await navigator.clipboard.writeText(text)
      label = 'Copied!'
    } catch {
      label = 'Error'
    }

    clearTimeout(timer)
    timer = setTimeout(() => {
      label = null
    }, 1400)
  }

  onDestroy(() => clearTimeout(timer))
</script>

<button class="copy-button" type="button" onclick={copy} aria-label={$dict.copy}>
  {#if label === 'Copied!'}
    <svg
      xmlns="http://www.w3.org/2000/svg"
      width="14"
      height="14"
      viewBox="0 0 24 24"
      fill="none"
      stroke="currentColor"
      stroke-width="2"
      stroke-linecap="round"
      stroke-linejoin="round"
      class="copy-check"
    >
      <path d="M20 6 9 17l-5-5" />
    </svg>
  {:else}
    <svg
      xmlns="http://www.w3.org/2000/svg"
      width="14"
      height="14"
      viewBox="0 0 24 24"
      fill="none"
      stroke="currentColor"
      stroke-width="2"
      stroke-linecap="round"
      stroke-linejoin="round"
    >
      <rect width="14" height="14" x="8" y="8" rx="2" ry="2" />
      <path d="M4 16c-1.1 0-2-.9-2-2V4c0-1.1.9-2 2-2h10c1.1 0 2 .9 2 2" />
    </svg>
  {/if}
  <span>{label ?? $dict.copy}</span>
</button>
