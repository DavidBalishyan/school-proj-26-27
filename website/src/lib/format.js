const command = 'make upload PORT=/dev/ttyACM0'

export function noteParts(text) {
  return text.split(command).map((part, index) => ({
    text: part,
    isCode: index % 2 === 1,
  }))
}
