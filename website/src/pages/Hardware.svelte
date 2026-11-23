<script>
  import { dict } from '../lib/i18n.js'
  import SectionHeading from '../components/SectionHeading.svelte'
  import Notice from '../components/Notice.svelte'

  const items = [
    {
      name: 'Arduino Uno',
      key: 'hardwareArduino',
      icon: '<rect x="3" y="5" width="18" height="14" rx="2"/><path d="M7 9h10M7 13h6M6 3v2M18 3v2"/>',
    },
    {
      name: 'HM-10 Bluetooth module',
      key: 'hardwareBluetooth',
      icon: '<path d="m7 7 10 10-5 5V2l5 5L7 17"/>',
    },
    {
      name: '8×16 LED panel',
      key: 'hardwareLED',
      icon: '<rect x="3" y="4" width="18" height="12" rx="1"/><circle cx="7" cy="8" r=".6"/><circle cx="12" cy="8" r=".6"/><circle cx="17" cy="8" r=".6"/><circle cx="7" cy="12" r=".6"/><circle cx="12" cy="12" r=".6"/><circle cx="17" cy="12" r=".6"/>',
    },
    {
      name: 'L298P motor driver',
      key: 'hardwareMotor',
      icon: '<rect x="3" y="6" width="18" height="12" rx="2"/><path d="M7 10h10M7 14h6M17 14h.01"/>',
    },
    {
      name: 'DC motors and tracks',
      key: 'hardwareTracks',
      icon: '<path d="M4 8h16M4 16h16"/><rect x="6" y="6" width="12" height="12" rx="6"/>',
    },
    {
      name: 'Power supply',
      key: 'hardwarePower',
      icon: '<path d="M12 3v4M6 7h12v12H6zM10 11l-1.5 3h3L10 17"/>',
    },
  ]
</script>

<section class="page" id="hardware">
  <SectionHeading
    label={$dict.hardwareLabel}
    title={$dict.hardwareTitle}
    description={$dict.hardwareDescription}
  />

  <div class="part-grid">
    {#each items as item, index (item.name)}
      <div class="part">
        <span class="part-index">0{index + 1}</span>
        <svg
          viewBox="0 0 24 24"
          fill="none"
          stroke="currentColor"
          stroke-width="1.5"
          stroke-linecap="round"
          stroke-linejoin="round"
          aria-hidden="true"
        >
          {@html item.icon}
        </svg>
        <h2>{item.name}</h2>
        <p>{$dict[item.key]}</p>
      </div>
    {/each}
  </div>

  <div class="notice-row notice-single">
    <Notice title={$dict.powerNoticeTitle}>
      {$dict.powerNoticeText}
    </Notice>
  </div>
</section>
