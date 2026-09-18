#!/bin/bash
# Borra SOLO la caché de plantillas Smarty compiladas del STAGING
# (dev.geotop-aqp.com). No toca producción. PS_SMARTY_FORCE_COMPILE
# debería evitar esto, pero var/cache/prod sigue sirviendo versiones
# viejas de los .tpl editados - se limpia a mano.
set -euo pipefail
DIR="$HOME/public_html/dev.geotop-aqp.com/var/cache/prod/smarty/compile"

if [ ! -d "$DIR" ]; then
  echo "No existe $DIR, nada que hacer"
  exit 0
fi

echo "Antes:"; find "$DIR" -type f | wc -l
rm -rf "${DIR:?}"/*
echo "Después:"; find "$DIR" -type f 2>/dev/null | wc -l
echo "listo"
