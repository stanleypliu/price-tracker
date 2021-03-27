import { ref, onUnmounted } from 'vue'
import { debounce } from 'throttle-debounce'

export function scrollToElem(anchor) {
  const element = document.getElementById(anchor);

  element.scrollIntoView({behavior: 'smooth'});
}

export function scrolledDistance(distance = 1) {
  const hasScrolled = ref(false)

  // TODO - understand why this isn't firing as it should
  const checkScroll = debounce(250, function() {
    return document.documentElement.scrollTop > distance
  })

  function listenForScroll() {
    window.addEventListener('scroll', checkScroll)
  }

  function unlistenForScroll() {
    window.removeEventListener('scroll', checkScroll)
  }

  listenForScroll()

  onUnmounted(unlistenForScroll)

  return{
    listenForScroll,
    unlistenForScroll,
    hasScrolled,
    checkScroll
  } 
}