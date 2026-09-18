/**
 * Carrusel del hero de la portada: rotación automática, puntos para
 * saltar a una foto y pausa al pasar el mouse (o al enfocar un punto
 * con el teclado).
 */
document.addEventListener('DOMContentLoaded', function () {
  var wrapper = document.querySelector('.modern-hero-wrapper');
  var slides = document.querySelectorAll('.hero-slide');
  var dots = document.querySelectorAll('.hero-dot');
  if (!wrapper || !slides.length) {
    return;
  }

  var current = 0;
  var timer = null;
  var reduceMotion = window.matchMedia && window.matchMedia('(prefers-reduced-motion: reduce)').matches;

  function goTo(index) {
    slides[current].classList.remove('active');
    dots[current] && dots[current].classList.remove('active');
    current = (index + slides.length) % slides.length;
    slides[current].classList.add('active');
    dots[current] && dots[current].classList.add('active');
  }

  function start() {
    if (reduceMotion || slides.length < 2) {
      return;
    }
    stop();
    timer = setInterval(function () { goTo(current + 1); }, 5000);
  }

  function stop() {
    if (timer) {
      clearInterval(timer);
      timer = null;
    }
  }

  dots.forEach(function (dot, index) {
    dot.addEventListener('click', function () {
      goTo(index);
      start(); // reinicia el conteo de 5s desde la foto elegida
    });
  });

  wrapper.addEventListener('mouseenter', stop);
  wrapper.addEventListener('mouseleave', start);
  wrapper.addEventListener('focusin', stop);
  wrapper.addEventListener('focusout', start);

  start();
});
