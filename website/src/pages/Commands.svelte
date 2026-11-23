<script>
  import { dict } from '../lib/i18n.js'
  import SectionHeading from '../components/SectionHeading.svelte'
  import Terminal from '../components/Terminal.svelte'

  const commands = [
    { key: 'F', labelKey: 'forward', column: 2, row: 1 },
    { key: 'B', labelKey: 'backward', column: 2, row: 3 },
    { key: 'L', labelKey: 'left', column: 1, row: 2 },
    { key: 'R', labelKey: 'right', column: 3, row: 2 },
    { key: 'S', labelKey: 'stop', column: 2, row: 2 },
  ]
</script>

<section class="page" id="commands">
  <SectionHeading
    label={$dict.commandsLabel}
    title={$dict.commandsTitle}
    description={$dict.commandsDescription}
  />

  <Terminal>
    <div class="command-pad">
      {#each commands as command (command.key)}
        <div class="command-key" style="grid-column: {command.column}; grid-row: {command.row};">
          <code>{command.key}</code>
          <span>{$dict[command.labelKey]}</span>
        </div>
      {/each}
    </div>
  </Terminal>
</section>
