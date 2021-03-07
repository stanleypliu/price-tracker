export default function getPhotos() {
  return import.meta.globEager('../images/photos/**/*')
}