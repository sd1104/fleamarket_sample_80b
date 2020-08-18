$(function(){

  let flash = ['.notice'];

  flash.forEach(function(Flash) {
    const flashMsg = document.querySelector(Flash)
    const TIMEOUT_DELAY = 4000
    const INTERVAL_DELAY = 20
    const OPACITY_SUB_VAL = 0.01
    const deleteFlashMessage = () => {
    const id = setInterval(() => {
    const opacity = flashMsg.style.opacity

    if (opacity > 0) {
      flashMsg.style.opacity = opacity - OPACITY_SUB_VAL
    } else {
      flashMsg.style.display = 'none'
      clearInterval(id)
    }
    }, INTERVAL_DELAY)
    }

    if (!!flashMsg) {
    flashMsg.style.opacity = 1
    setTimeout(deleteFlashMessage, TIMEOUT_DELAY)
    }
  });

});

