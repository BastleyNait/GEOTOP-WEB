/**
 * Abre/cierra el menú móvil al tocar el botón hamburguesa.
 *
 * theme.js (el bundle de PrestaShop) trae su propio manejador para
 * #menu-icon, pero depende de que su sistema de componentes se
 * inicialice sobre el menú (.js-top-menu) y no está pasando con esta
 * estructura de header. Se hace acá directo, sin depender de eso.
 */
(function () {
  // Este script va al final de <body> (javascript_bottom), así que el
  // DOM ya existe: engancharse a DOMContentLoaded acá llega tarde, ese
  // evento ya disparó antes de que este <script> se ejecute.
  var button = document.getElementById('menu-icon');
  var menu = document.getElementById('mobile_top_menu_wrapper');
  if (!button || !menu) {
    return;
  }

  button.addEventListener('click', function () {
    var isOpen = menu.style.display === 'block';
    menu.style.display = isOpen ? 'none' : 'block';
  });
})();
