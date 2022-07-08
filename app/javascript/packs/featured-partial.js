// function getPics() {} //just for this demo
// const imgs = document.querySelectorAll('.featured-image');
// console.log(imgs);
// console.log(imgs[0].src)
// const fullPage = document.querySelector('#fullpage');
// console.log(fullPage);
// console.log()
// imgs.forEach(img => {
// imgs[0].addEventListener('click', function() {
//   fullPage.style.backgroundImage = 'url(' + imgs[0].src + ')';
//   fullPage.style.display = 'block';
// });
// }
// );
const fScreen = document.querySelector("#toggle-fullscreen");
console.log(fScreen);
fScreen.addEventListener("click", function () {
  // if already full screen; exit
  // else go fullscreen
  if (
    document.fullscreenElement ||
    document.webkitFullscreenElement ||
    document.mozFullScreenElement ||
    document.msFullscreenElement
  ) {
    if (document.exitFullscreen) {
      document.exitFullscreen();
    } else if (document.mozCancelFullScreen) {
      document.mozCancelFullScreen();
    } else if (document.webkitExitFullscreen) {
      document.webkitExitFullscreen();
    } else if (document.msExitFullscreen) {
      document.msExitFullscreen();
    }
  } else {
    element = document.querySelector("#container");
    if (element.requestFullscreen) {
      element.requestFullscreen();
    } else if (element.mozRequestFullScreen) {
      element.mozRequestFullScreen();
    } else if (element.webkitRequestFullscreen) {
      element.webkitRequestFullscreen(Element.ALLOW_KEYBOARD_INPUT);
    } else if (element.msRequestFullscreen) {
      element.msRequestFullscreen();
    }
  }
  element.style = "display: flex;justify-items:center;align-items:cener;";
  fScreen.style = "margin: auto;";
});
