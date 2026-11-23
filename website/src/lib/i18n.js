import { derived, writable } from 'svelte/store'
import { translations } from './translations.js'

const saved = typeof localStorage === 'undefined'
  ? null
  : localStorage.getItem('mini-tank-language')

export const language = writable(saved && translations[saved] ? saved : 'en')

export const dict = derived(
  language,
  ($language) => translations[$language] ?? translations.en,
)

language.subscribe((value) => {
  if (typeof document !== 'undefined') {
    document.documentElement.lang = value
  }
  if (typeof localStorage !== 'undefined') {
    localStorage.setItem('mini-tank-language', value)
  }
})
