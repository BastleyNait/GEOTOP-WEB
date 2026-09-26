# GEOTOP AQP — tema PrestaShop

Repositorio del tema `classic` de **geotop-aqp.com** (tienda de equipos topográficos, Arequipa).
PrestaShop **1.7.4.4**, PHP 7.2, MariaDB, hosting cPanel (con nginx haciendo de caché delante de Apache).

Para el diagnóstico completo del proyecto (bugs, deuda técnica, riesgos) ver [REVIEW.md](REVIEW.md).

## Estructura del repo

```
remote/                 Espejo de public_html/ del servidor (mismas rutas)
  themes/classic/       El tema: templates/*.tpl (Smarty), assets/css, assets/js, modules/
tools/
  runner/runner.sh      Ejecutor por cron que corre scripts en el servidor (ver más abajo)
  runner/jobs/*.sh      Scripts que se subieron al ejecutor (diagnóstico, staging, cachés, deploy)
  analysis/home.html    Copia del HTML ya renderizado de la portada (para analizar el marcado sin conexión)
_referencia/            (ignorado por git) copias bajadas del servidor
```

`remote/` solo versiona el tema. La base de datos, `modules/`, `img/` y el resto de PrestaShop **no** están en el repo.
Las fotos del hero viven dentro del tema (`themes/classic/assets/img/home/`), así que sí viajan con el deploy.

## Entornos

| | Producción | Staging |
|---|---|---|
| URL | https://geotop-aqp.com | http://dev.geotop-aqp.com |
| Carpeta | `~/public_html` | `~/public_html/dev.geotop-aqp.com` |
| Base de datos | `geotop_presta` (prefijo `ps_ps5`) | `geotop_dev` (copia liviana, sin tablas de estadísticas) |

- Staging tiene correos desactivados, `noindex` y la caché de PrestaShop apagada. **Todo cambio se prueba primero ahí.**
- El DNS público de `dev.geotop-aqp.com` nunca sincronizó: se accede con una línea en el archivo `hosts` de Windows
  (`136.243.77.111 dev.geotop-aqp.com`).
- Los dos entornos tienen bases de datos **separadas**. El deploy solo mueve archivos del tema; nunca toca la base de datos
  (nombre de la tienda, productos, pedidos, configuración).

## Acceso al servidor

- `sftp geotop@geotop-aqp.com` (puerto 22) con llave SSH. El shell SSH está deshabilitado por el hosting.
- Para correr comandos en el servidor se usa el **ejecutor por cron**: se sube un script por SFTP a
  `~/claude-runner/queue/NNN-nombre.sh`, el cron (cada minuto) lo ejecuta y deja la salida en
  `~/claude-runner/out/NNN-nombre.log`. El ejecutor está programado para **caducar el 2026-09-28**.
- Nunca guardar contraseñas (cPanel, base de datos) en el repo.

## Flujo de trabajo

1. Editar en `remote/themes/classic/...` en local.
2. Subir a staging por SFTP (mismo path, bajo `public_html/dev.geotop-aqp.com/`).
3. Limpiar cachés (ver abajo) y verificar en `dev.geotop-aqp.com`.
4. Commit en git.
5. Desplegar a producción (ver abajo) y verificar en `geotop-aqp.com`.

### Cachés: hay cuatro capas y cualquiera puede esconder un cambio

| Capa | Dónde | Cómo se limpia |
|---|---|---|
| Navegador | Caché HTTP | Subir a mano el `?v=N` del `<link>`/`<script>` en `stylesheets.tpl` / `javascript.tpl`. Ctrl+Shift+R al probar. |
| nginx | Delante de Apache | `uapi NginxCaching clear_cache` (`tools/runner/jobs/006-clear-nginx-cache.sh`) |
| Smarty compilado | `var/cache/prod/smarty/compile/` | Borrar su contenido (`005-clear-smarty-cache-staging.sh`). No se invalida solo. |
| **CSS/JS combinados (CCC)** | `themes/classic/assets/cache/*.css` y `*.js` — **solo producción** | Borrar esos archivos (`022-clear-css-combine-prod.sh`). PrestaShop los regenera. |

La cuarta capa es la traicionera: staging no la usa, y en producción sirve un `theme-HASH.css` congelado que puede
pelear con el CSS nuevo (fue lo que rompió "Nuestros Servicios" en el primer deploy).

### Deploy a producción

`tools/runner/jobs/021-deploy-prod-sync.sh` hace, en orden:
1. Backup del tema actual de producción en `~/backups/themes-classic-preprod-<fecha>.tar.gz`.
2. Copia `dev.geotop-aqp.com/themes/classic/` sobre `public_html/themes/classic/` (`cp -a`; no hay `rsync`; **no borra** archivos que ya no existan en dev).
3. Limpia Smarty y nginx.

Después correr también `022-clear-css-combine-prod.sh` (capa CCC) y verificar en el navegador.

**Rollback:** extraer el backup sobre `public_html/themes/` (`tar -xzf <backup> -C ~/public_html/themes`), y limpiar las cuatro cachés.
(Procedimiento no probado todavía.)

## Reglas propias de este tema (cosas que ya nos costaron un tropiezo)

- **`theme.css` está compilado contra un Bootstrap 4 *alpha***: grid por floats con sufijo obligatorio
  (`.col-xs-6`, nunca `.col-6`/`.col`), y **sin utilidades flex** (`.d-flex`, `.d-none`, `.align-items-*`…).
  `assets/css/utilities.css` las redefine con `!important`. No mezclar `.row d-flex` con columnas pensadas para floats.
- **No registrar CSS/JS nuevos por `theme.yml`**: PrestaShop guarda ese registro en la base de datos y genera un `<link>` sin `?v=`,
  imposible de invalidar. Enlazar siempre a mano en `stylesheets.tpl` / `javascript.tpl` con `?v=N`.
  `custom.css` quedó **vacío a propósito** por esto.
- **Smarty usa `{` `}` como delimitadores incluso dentro de comentarios y bloques `<style>` de un `.tpl`.**
  Un fragmento como `p{color:red}` (llave seguida de letra, sin espacio) rompe la compilación y tumba la página con un 500.
  Escribir los comentarios en prosa, o dejar un espacio tras la llave.
- El log de errores PHP de staging está en `~/logs/dev_geotop-aqp_com.php.error.log`.
- `position: sticky` no sirve para el header (su contenedor mide lo mismo que su contenido). Se usa `position: fixed`
  y `header.js` mide la altura real para el `padding-top` de `<main>`.

## Qué se hizo (2026-09-14 → 2026-09-18)

1. **Base segura:** snapshot del tema de producción en git, staging `dev.geotop-aqp.com` con su propia base de datos,
   y el ejecutor por cron (el hosting no da shell SSH).
2. **Portada:** el hero y los servicios vivían por error dentro de `header.tpl` y se mostraban en todas las páginas;
   se movieron a `index.tpl`. Consolidación de varios CSS sueltos en `home.css`.
3. **Hero rediseñado:** carrusel con 5 fotos reales del taller (optimizadas de PNG a JPEG, ~90 % menos peso), insignia
   ISO 9001:2015, título con degradado, franja de tres tarjetas de confianza, puntos de navegación, pausa al pasar el mouse.
   Se excluyeron dos collages generados con IA que tenían errores de tipeo en la marca.
4. **Navbar:** se eliminó una "F" suelta, el menú móvil pasó a ser un desplegable real (`header.js`), hover naranja de la marca,
   submenús con transición de 0.12 s, botón "Buscar certificados" en naranja, header fijo y opaco, y **una sola barra**
   que integra logo, menú, buscador, "Iniciar sesión" y certificados.
5. **Secciones a todo el ancho** y tarjetas de "Nuestros Servicios" estilo galería (foto completa, degradado, detalle al pasar el mouse).
6. **Footer:** texto de contacto ilegible (gris sobre gris por una regla global `p{color:#7a7a7a}`), crédito tapado por el botón de
   WhatsApp, y botón de WhatsApp con el SVG oficial.
7. **Deploy a producción (2026-09-18)** con backup previo, y corrección de la caché CCC.

Historial detallado en `git log` — cada commit explica el porqué, no solo el qué.
