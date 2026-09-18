/**
 * Carrusel automático del hero de la portada.
 * Antes vivía como <script> inline dentro de header.tpl.
 */
document.addEventListener('DOMContentLoaded', function () {
  var slides = document.querySelectorAll('.hero-slide');
  if (!slides.length) {
    return;
  }

  var current = 0;

  setInterval(function () {
    slides[current].classList.remove('active');
    current = (current + 1) % slides.length;
    slides[current].classList.add('active');
  }, 5000);
});
