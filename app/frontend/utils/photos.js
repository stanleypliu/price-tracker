import getPhotos from '@/composables/usePhotos'

const photos = getPhotos()

export function getPhotoUrl(name) {
  const photo = photos[`../images/photos/${name}.jpg`]

  if (!photo) { throw new Error(`No photo available for ${name}`) }

  return photo.default
}