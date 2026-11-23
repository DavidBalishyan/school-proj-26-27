<script>
  import { dict } from '../lib/i18n.js'
  import SectionHeading from '../components/SectionHeading.svelte'
  import Notice from '../components/Notice.svelte'
</script>

<section class="page" id="wiring">
  <SectionHeading
    label={$dict.wiringLabel}
    title={$dict.wiringTitle}
    description={$dict.wiringDescription}
  />

  <div class="wiring-stack">
    <div class="wiring-group">
      <h2>{$dict.ledConnections}</h2>
      <div class="table-wrap">
        <table>
          <thead>
            <tr>
              <th>{$dict.component}</th>
              <th>{$dict.arduinoConnection}</th>
            </tr>
          </thead>
          <tbody>
            <tr><td>GND</td><td><code>-GND</code></td></tr>
            <tr><td>VCC</td><td><code>+VCC</code></td></tr>
            <tr><td>SDA</td><td><code>A4</code></td></tr>
            <tr><td>SCL</td><td><code>A5</code></td></tr>
          </tbody>
        </table>
      </div>
    </div>

    <div class="wiring-group">
      <h2>{$dict.bluetoothConnections}</h2>
      <div class="table-wrap">
        <table>
          <thead>
            <tr>
              <th>{$dict.component}</th>
              <th>{$dict.arduinoConnection}</th>
            </tr>
          </thead>
          <tbody>
            <tr><td>RXD</td><td><code>TX</code></td></tr>
            <tr><td>TXD</td><td><code>RX</code></td></tr>
            <tr><td>VCC</td><td><code>+VCC</code></td></tr>
            <tr><td>GND</td><td><code>-GND</code></td></tr>
          </tbody>
        </table>
      </div>
    </div>

    <div class="wiring-group">
      <h2>{$dict.motorConnections}</h2>
      <div class="table-wrap">
        <table>
          <thead>
            <tr>
              <th>{$dict.motor}</th>
              <th>{$dict.directionPin}</th>
              <th>{$dict.pwmPin}</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td>{$dict.leftMotor}</td>
              <td><code>D13</code></td>
              <td><code>D11</code></td>
            </tr>
            <tr>
              <td>{$dict.rightMotor}</td>
              <td><code>D12</code></td>
              <td><code>D3</code></td>
            </tr>
          </tbody>
        </table>
      </div>
    </div>

    <div class="notice-row">
      <Notice title={$dict.motorTerminalTitle}>
        {$dict.motorTerminalText}
      </Notice>
      <Notice title={$dict.dipTitle}>
        {$dict.dipText}
      </Notice>
    </div>
  </div>
</section>
