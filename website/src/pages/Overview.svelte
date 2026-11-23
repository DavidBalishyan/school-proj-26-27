<script>
  import { dict } from '../lib/i18n.js'
  import SectionHeading from '../components/SectionHeading.svelte'

  const specs = [
    { key: 'specController', value: 'Arduino Uno' },
    { key: 'specBluetooth', value: 'HM-10' },
    { key: 'specDisplay', value: '8×16 LED' },
    { key: 'specDriver', value: 'L298P' },
    { key: 'specFirmware', value: 'Arduino C++' },
    { key: 'specBoard', value: 'arduino:avr:uno' },
  ]
</script>

<section class="page" id="overview">
  <SectionHeading
    label={$dict.overviewLabel}
    title={$dict.overviewTitle}
    description={$dict.overviewDescription}
  />

  <div class="overview-grid">
    <div class="panel panel-accent">
      <h2>{$dict.overviewPanelTitle}</h2>
      <p>{$dict.overviewPanelText}</p>
    </div>

    <div class="panel">
      <h2>{$dict.specifications}</h2>
      <div class="spec-grid">
        {#each specs as spec (spec.key)}
          <div class="spec-row">
            <span>{$dict[spec.key]}</span>
            <code>{spec.value}</code>
          </div>
        {/each}
      </div>
    </div>
  </div>
</section>
