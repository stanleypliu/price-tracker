export function scrollToElem(anchor) {
  const element = document.getElementById(anchor);

  element.scrollIntoView({behavior: 'smooth'});
}