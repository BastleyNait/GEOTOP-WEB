# Review general del proyecto — 2026-09-26

Alcance: el tema `classic` en este repo, el flujo de trabajo/deploy, y lo que se sabe del servidor.
Se marca qué está **verificado** (medido en esta revisión), qué viene de la **auditoría inicial del 2026-09-14** (no re-verificado)
y qué **no se probó**.

## Resumen

La portada, la navbar y el footer quedaron en buen estado y son idénticos en staging y producción. El riesgo principal ya no está
en el diseño sino en tres cosas: un bug de JavaScript que introdujo la fusión de la navbar, una plataforma vieja (PrestaShop 2018 /
PHP 7.2), y un montón de CSS heredado con `!important` que sostiene las páginas internas y que nadie ha revisado.

## Qué está bien

- Portada, navbar y footer rediseñados, con el mismo resultado en staging y producción. **Verificado** en 375, 800 y 1440 px, sin desbordes horizontales.
- Las 5 fotos del hero responden 200 en producción y pesan 130–230 KB cada una. **Verificado.**
- Flujo con staging propio, historial de git con mensajes que explican el porqué, y backup del tema previo a cada deploy.
- Las trampas del tema (Bootstrap alpha, cachés, llaves de Smarty) están documentadas en [README.md](README.md).

## Prioridad alta

1. **`custom.js` lanza un error en cada scroll (regresión de la fusión de la navbar).**
   Busca `.header-nav`, que ya no existe desde que se unificó la barra, y hace `headerNav.classList` sobre `null`.
   Tampoco hay ningún `.fade-in` en el sitio, así que **todo el archivo es código muerto**. Reproducido en producción: `TypeError … reading 'classList'`
   al disparar `scroll`. No rompe la vista, pero llena la consola y aborta el resto del manejador.
   *Arreglo:* dejar de cargar `custom.js` (o borrarlo). Requiere deploy + limpiar la caché CCC.
2. **El copyright dice "© 2025"** (`footer.tpl`, fijo a mano) y ya es 2026. *Arreglo:* año dinámico con Smarty (cuidado con las llaves, ver README).
3. **El ejecutor por cron caduca el 2026-09-28 (en 2 días).** Al terminar de usarlo hay que borrar la entrada de cron y la carpeta `~/claude-runner`,
   que según la configuración de la auditoría contiene archivos con credenciales de base de datos (`.my-prod.cnf`, `.my-dev.cnf`).
   Los backups (`~/backups/*.tar.gz`, 58 MB) conviene bajarlos y borrarlos del servidor cuando ya no hagan falta.
4. **Plataforma obsoleta** *(auditoría inicial)*: PrestaShop 1.7.4.4 es de 2018 y PHP 7.2 dejó de recibir parches en 2020. Es el mayor riesgo de seguridad
   del proyecto y limita cualquier módulo/tema nuevo. Conviene decidir una ruta de actualización **antes** de invertir más en el tema.

## Prioridad media

5. **Fotos de los servicios traídas de Unsplash.** Las 4 tarjetas de "Nuestros Servicios" cargan imágenes de `images.unsplash.com` (`index.tpl`):
   dependen de un tercero, y son fotos genéricas, no de la empresa. *Arreglo:* bajarlas/optimizarlas (o reemplazarlas por fotos propias) y servirlas desde el tema.
6. **Enlaces atados a IDs fijos.** El hero usa `getCategoryLink(5)` y `getCMSLink(6)`; el footer usa `id_cms=8` y `id_cms=6`.
   Si esas páginas se borran o renumeran, los botones se rompen sin aviso. Además, "Mantenimiento" y "Venta de Equipos" del footer apuntan a `#` (no llevan a ningún lado).
7. **Deuda de CSS.** 16 archivos CSS; `theme.css` pesa 434 KB, tiene 265 `!important` y restos de rediseños anteriores
   (p. ej. `.modern-hero-wrapper{height:600px}` y un fondo de Unsplash en `.modern-hero-bg`). Las páginas internas se sostienen con parches:
   `category-pro-redesign.css` (165 `!important`), `contact-redesign.css` (129), `mobile-category-fix.css` (80).
   `category-grid-5col.css` y `error.css` no están enlazados desde ninguna plantilla (verificar antes de borrar).
   El comentario de `config/theme.yml` sobre `custom.css` quedó desactualizado.
8. **Estilos en línea.** `footer.tpl` tiene 27 `style=""` más un `<style>` embebido, e `index.tpl` 13. Deberían pasar a CSS para poder mantenerlos.
9. **Errores preexistentes que no se investigaron:** `core.js` lanza `Cannot read properties of undefined (reading 'quantityWanted')` en cada página;
   y el ícono del carrito (`ps_shoppingcart`) no se dibuja aunque el módulo está enganchado correctamente a `displayNav2` en la base de datos.
10. **Buscador duplicado en la base de datos:** `ps_searchbar` está enganchado a `displayTop` y a `displaySearch` a la vez; hoy se oculta una copia por CSS.
    Lo correcto es desenganchar una en el back office.
11. **Fragilidad de `utilities.css`.** Emula utilidades de Bootstrap 4 final sobre un `theme.css` alpha. Funciona, pero cualquier clase nueva que se asuma
    "normal" de Bootstrap puede no existir. La salida de fondo es reconstruir el tema (o un child theme) sobre una versión actual.

## Prioridad baja / higiene

12. **Repo:** 10 scripts casi idénticos de limpieza de caché en `tools/runner/jobs` (007–014, 017–020) → unificarlos en uno con parámetros.
    `.marker-check.txt` es un archivo suelto sin uso (el commit `2269b60` lo agregó junto con `tools/analysis/home.html`; no cambió nada del tema).
13. **Deploy manual.** SFTP + ejecutor, sin un script único que encadene backup → sync → las 4 cachés → verificación. El `cp -a` no borra archivos que ya
    no existan en staging, así que producción puede acumular archivos huérfanos.
14. **Deriva entre entornos.** Producción y staging tienen bases de datos separadas: si se edita contenido en el back office de producción, staging queda desactualizado.
15. **Servidor** *(auditoría inicial, no re-verificado)*: ~2.7 GB de la base en tablas de estadísticas (`ps_ps5connections`, `ps_ps5guest`), cuatro instalaciones
    vacías dentro de la misma base, ~8 GB de basura en el home (`tmp`, zips, `public_html.tar.gz` de 396 MB), temas `classic_old*`, y muchos permisos 666/777.
    No hay evidencia de un backup automático de producción; el único verificado es el manual del 2026-09-14.
16. **Tres fuentes de íconos/tipografías externas** cargadas en cada página (Google Fonts Manrope, Font Awesome 4.7 por CDN y Material Icons). Rendimiento **no medido** en esta revisión.

## Lo que no se probó

Los cambios de header y footer son **sitewide**, pero solo se verificó la **portada** (y el footer). No se recorrieron en esta revisión: categorías, ficha de producto,
carrito/checkout, cuenta de cliente, contacto ni las páginas CMS, ni la accesibilidad (contraste, teclado, lectores de pantalla).
Sobre todo hay que mirar, con el header ahora fijo y su `padding-top` medido por JS: las páginas con buscador, filtros laterales y el flujo de compra.

## Orden sugerido

1. Quitar `custom.js` y corregir el año del copyright (10 minutos + un deploy).
2. Recorrer a mano categorías, producto y checkout en móvil y escritorio con el header nuevo.
3. Al terminar el trabajo con el ejecutor: borrar el cron, `~/claude-runner` y los backups del servidor.
4. Bajar y servir localmente las fotos de servicios; reemplazar los IDs fijos de los enlaces.
5. Definir la actualización de PrestaShop/PHP antes de seguir rediseñando páginas internas.
