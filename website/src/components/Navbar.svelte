<script>
  import { onMount } from 'svelte'
  import { dict, language } from '../lib/i18n.js'
  import { theme } from '../lib/theme.js'
  import { navItems } from '../lib/router.js'

  let mobileOpen = $state(false)
  let active = $state(navItems[0].id)
  let themeLabel = $derived(
    $theme === 'dark' ? 'Switch to light mode' : 'Switch to dark mode',
  )

  onMount(() => {
    const updateActive = () => {
      const marker = window.innerHeight * 0.3
      let current = navItems[0].id

      for (const item of navItems) {
        const element = document.getElementById(item.id)
        if (element && element.getBoundingClientRect().top <= marker) {
          current = item.id
        }
      }

      active = current
    }

    updateActive()
    window.addEventListener('scroll', updateActive, { passive: true })
    window.addEventListener('resize', updateActive)

    return () => {
      window.removeEventListener('scroll', updateActive)
      window.removeEventListener('resize', updateActive)
    }
  })
</script>

<nav>
  <div class="nav-shell">
    <a class="brand" href="#top">MINI TANK / V2.1</a>

    <div class="nav-links">
      {#each navItems as link (link.id)}
        <a
          href={`#${link.id}`}
          class:active={active === link.id}
          aria-current={active === link.id ? 'location' : undefined}
        >
          {$dict[link.key]}
        </a>
      {/each}
    </div>

    <div class="nav-actions">
      <select class="language-select" bind:value={$language} aria-label="Language">
        <option value="en">English</option>
        <option value="hy">Հայերեն</option>
        <option value="fr">Français</option>
      </select>

      <button
        class="icon-button"
        type="button"
        onclick={() => ($theme = $theme === 'dark' ? 'light' : 'dark')}
        aria-label={themeLabel}
        title={themeLabel}
      >
        <span>{$theme === 'dark' ? '☀' : '☾'}</span>
      </button>

      <button
        class="icon-button menu-button"
        type="button"
        onclick={() => (mobileOpen = !mobileOpen)}
        aria-label="Toggle menu"
        aria-expanded={mobileOpen}
      >
        {#if mobileOpen}
          <svg
            xmlns="http://www.w3.org/2000/svg"
            width="18"
            height="18"
            viewBox="0 0 24 24"
            fill="none"
            stroke="currentColor"
            stroke-width="2"
            stroke-linecap="round"
            stroke-linejoin="round"
          >
            <path d="M18 6 6 18" />
            <path d="m6 6 12 12" />
          </svg>
        {:else}
          <svg
            xmlns="http://www.w3.org/2000/svg"
            width="18"
            height="18"
            viewBox="0 0 24 24"
            fill="none"
            stroke="currentColor"
            stroke-width="2"
            stroke-linecap="round"
            stroke-linejoin="round"
          >
            <line x1="4" x2="20" y1="12" y2="12" />
            <line x1="4" x2="20" y1="6" y2="6" />
            <line x1="4" x2="20" y1="18" y2="18" />
          </svg>
        {/if}
      </button>
    </div>
  </div>

  {#if mobileOpen}
    <div class="mobile-menu">
      {#each navItems as link (link.id)}
        <a
          href={`#${link.id}`}
          class:active={active === link.id}
          onclick={() => (mobileOpen = false)}
        >
          {$dict[link.key]}
        </a>
      {/each}
    </div>
  {/if}
</nav>
