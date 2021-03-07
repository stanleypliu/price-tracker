const photos = import.meta.globEager('../images/photos/**/*')

export function getPhotoUrl(name) {
  const mod = photos[`../images/photos/${name}.jpg`]
  if (!mod) throw new Error(`No photo available for ${name}`)
  return mod.default
}