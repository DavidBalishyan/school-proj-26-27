<script>
  import Navbar from './components/Navbar.svelte'
  import Footer from './components/Footer.svelte'
  import Hero from './pages/Hero.svelte'
  import Overview from './pages/Overview.svelte'
  import Features from './pages/Features.svelte'
  import Hardware from './pages/Hardware.svelte'
  import Wiring from './pages/Wiring.svelte'
  import Commands from './pages/Commands.svelte'
  import Installation from './pages/Installation.svelte'
  import Docs from './pages/Docs.svelte'
</script>

<div class="site">
  <Navbar />

  <main class="content">
    <Hero />
    <Overview />
    <Features />
    <Hardware />
    <Wiring />
    <Commands />
    <Installation />
    <Docs />
  </main>

  <Footer />
</div>
