<script>
  import { dict } from '../lib/i18n.js'
  import { noteParts } from '../lib/format.js'
  import SectionHeading from '../components/SectionHeading.svelte'
  import Terminal from '../components/Terminal.svelte'
  import Notice from '../components/Notice.svelte'

  const linuxSteps = [
    {
      titleKey: 'linuxStep1Title',
      textKey: 'linuxStep1Text',
      code: 'curl -fsSL https://raw.githubusercontent.com/arduino/arduino-cli/master/install.sh | sh',
    },
    { titleKey: 'linuxStep2Title', textKey: 'linuxStep2Text', code: 'make setup' },
    { titleKey: 'linuxStep3Title', textKey: 'linuxStep3Text', code: 'make ports' },
    { titleKey: 'linuxStep4Title', textKey: 'linuxStep4Text', code: 'make build\nmake upload' },
    { titleKey: 'linuxStep5Title', textKey: 'linuxStep5Text', code: 'make monitor' },
  ]

  const windowsSteps = [
    { titleKey: 'windowsStep1Title', textKey: 'windowsStep1Text', link: true },
    {
      titleKey: 'windowsStep2Title',
      textKey: 'windowsStep2Text',
      code: 'arduino-cli core update-index\narduino-cli core install arduino:avr',
    },
    { titleKey: 'windowsStep3Title', textKey: 'windowsStep3Text', code: 'arduino-cli board list' },
    {
      titleKey: 'windowsStep4Title',
      textKey: 'windowsStep4Text',
      code: 'arduino-cli compile --fqbn arduino:avr:uno .\\MiniTankRobotV2',
    },
    {
      titleKey: 'windowsStep5Title',
      textKey: 'windowsStep5Text',
      code: 'arduino-cli upload -p COM3 --fqbn arduino:avr:uno .\\MiniTankRobotV2',
    },
    {
      titleKey: 'windowsStep6Title',
      textKey: 'windowsStep6Text',
      code: 'arduino-cli monitor -p COM3 -c baudrate=9600',
    },
  ]

  let platform = $state('linux')
  let steps = $derived(platform === 'linux' ? linuxSteps : windowsSteps)
  let note = $derived(platform === 'linux' ? $dict.linuxNote : $dict.windowsNote)
</script>

<section class="page" id="installation">
  <SectionHeading
    label={$dict.installationLabel}
    title={$dict.installationTitle}
    description={$dict.installationDescription}
  />

  <div class="install-body">
    <div class="tabs" role="tablist">
      <button
        type="button"
        role="tab"
        class:active={platform === 'linux'}
        aria-selected={platform === 'linux'}
        onclick={() => (platform = 'linux')}
      >
        {$dict.linux}
      </button>
      <button
        type="button"
        role="tab"
        class:active={platform === 'windows'}
        aria-selected={platform === 'windows'}
        onclick={() => (platform = 'windows')}
      >
        {$dict.windows}
      </button>
    </div>

    <div class="steps">
      {#each steps as step (step.titleKey)}
        <div class="install-step">
          <h2>{$dict[step.titleKey]}</h2>
          <p>{$dict[step.textKey]}</p>
          {#if step.link}
            <a
              href="https://arduino.github.io/arduino-cli/latest/installation/"
              target="_blank"
              rel="noopener noreferrer"
            >Arduino CLI installation guide</a>
          {/if}
          {#if step.code}
            <Terminal copyText={step.code}><pre>{step.code}</pre></Terminal>
          {/if}
        </div>
      {/each}

      <div class="install-note">{#each noteParts(note) as part}{#if part.isCode}<code>{part.text}</code>{:else}{part.text}{/if}{/each}</div>
    </div>
  </div>

  <div class="notice-row notice-single">
    <Notice title={$dict.bluetoothUploadTitle}>
      {$dict.bluetoothUploadText}
    </Notice>
  </div>
</section>
