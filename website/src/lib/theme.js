import { writable } from 'svelte/store'

const saved = typeof localStorage === 'undefined'
  ? null
  : localStorage.getItem('mini-tank-theme')

export const theme = writable(
  saved === 'light' || saved === 'dark' ? saved : 'dark',
)

theme.subscribe((value) => {
  if (typeof document !== 'undefined') {
    document.documentElement.dataset.theme = value
  }
  if (typeof localStorage !== 'undefined') {
    localStorage.setItem('mini-tank-theme', value)
  }
})
