<script>
  import { dict } from '../lib/i18n.js'
  import SectionHeading from '../components/SectionHeading.svelte'
  import Terminal from '../components/Terminal.svelte'
</script>

<section class="page" id="docs">
  <SectionHeading title={$dict.docsTitle} />

  <div class="docs-card">
    <Terminal>
      <p class="docs-placeholder">{$dict.docsPlaceholder}</p>
      <div class="skeleton" aria-hidden="true">
        <span></span>
        <span></span>
        <span></span>
      </div>
    </Terminal>
  </div>
</section>
