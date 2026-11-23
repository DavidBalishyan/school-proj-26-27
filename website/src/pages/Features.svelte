<script>
  import { dict } from '../lib/i18n.js'
  import SectionHeading from '../components/SectionHeading.svelte'

  const features = [
    { titleKey: 'featureMovementTitle', textKey: 'featureMovementText' },
    { titleKey: 'featureBluetoothTitle', textKey: 'featureBluetoothText' },
    { titleKey: 'featureDisplayTitle', textKey: 'featureDisplayText' },
  ]
</script>

<section class="page" id="features">
  <SectionHeading label={$dict.featuresLabel} title={$dict.featuresTitle} />

  <div class="feature-grid">
    {#each features as feature, index (feature.titleKey)}
      <div class="feature-card">
        <span class="feature-index">0{index + 1}</span>
        <h2>{$dict[feature.titleKey]}</h2>
        <p>{$dict[feature.textKey]}</p>
      </div>
    {/each}
  </div>
</section>
