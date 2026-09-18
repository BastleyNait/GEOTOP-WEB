#!/bin/bash
# Sincroniza el tema completo de STAGING (dev.geotop-aqp.com) hacia
# PRODUCCIÓN (geotop-aqp.com). Solo archivos del tema (themes/classic):
# no toca la base de datos ni var/ ni ningún otro directorio.
set -euo pipefail

PROD="$HOME/public_html"
DEV="$HOME/public_html/dev.geotop-aqp.com"
STAMP=$(date +%Y%m%d-%H%M%S)
BACKUP_DIR="$HOME/backups"
mkdir -p "$BACKUP_DIR"

echo "=== 1. Backup del tema actual de producción ==="
tar -czf "$BACKUP_DIR/themes-classic-preprod-$STAMP.tar.gz" -C "$PROD/themes" classic
ls -la "$BACKUP_DIR/themes-classic-preprod-$STAMP.tar.gz"

echo "=== 2. Sync dev -> prod (themes/classic) ==="
if command -v rsync >/dev/null 2>&1; then
  rsync -a "$DEV/themes/classic/" "$PROD/themes/classic/"
else
  echo "rsync no disponible, usando cp -a"
  cp -a "$DEV/themes/classic/." "$PROD/themes/classic/"
fi

echo "=== 3. Limpiar caché Smarty compilada de PRODUCCIÓN ==="
PROD_SMARTY="$PROD/var/cache/prod/smarty/compile"
if [ -d "$PROD_SMARTY" ]; then
  echo "Antes:"; find "$PROD_SMARTY" -type f | wc -l
  rm -rf "${PROD_SMARTY:?}"/*
  echo "Después:"; find "$PROD_SMARTY" -type f 2>/dev/null | wc -l
else
  echo "No existe $PROD_SMARTY"
fi

echo "=== 4. Limpiar caché nginx ==="
uapi --output=jsonpretty NginxCaching clear_cache

echo "backup guardado en: $BACKUP_DIR/themes-classic-preprod-$STAMP.tar.gz"
echo "listo"
