export default function scrollToElem(anchor) {
  const element = document.getElementById(anchor);

  element.scrollIntoView();
}