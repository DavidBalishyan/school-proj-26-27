<script>
  import { dict } from '../lib/i18n.js'
</script>

<section class="hero" id="top">
  <div class="hero-eyebrow">{$dict.eyebrow}</div>
  <h1>{$dict.heroTitle}</h1>
  <p class="hero-description">{$dict.heroDescription}</p>

  <div class="hero-actions">
    <a href="#installation" class="button button-primary">{$dict.getStarted}</a>
    <a
      href="https://docs.keyestudio.com/projects/KS0605/en/latest/docs/2.%20Product%20installation/Product%20installation.html"
      target="_blank"
      rel="noopener noreferrer"
      class="button button-secondary"
    >
      {$dict.assemblyGuide}
    </a>
  </div>
</section>
