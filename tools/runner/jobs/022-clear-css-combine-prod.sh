#!/bin/bash
set -uo pipefail
PROD="$HOME/public_html"
CACHE_DIR="$PROD/themes/classic/assets/cache"

echo "=== contenido antes ==="
ls -la "$CACHE_DIR" 2>&1

echo "=== borrando bundles combinados (CSS/JS) ==="
find "$CACHE_DIR" -maxdepth 1 -type f \( -name "*.css" -o -name "*.js" \) -exec rm -f {} \;

echo "=== contenido después ==="
ls -la "$CACHE_DIR" 2>&1

echo "=== limpiar smarty compile de nuevo por las dudas ==="
PROD_SMARTY="$PROD/var/cache/prod/smarty/compile"
rm -rf "${PROD_SMARTY:?}"/* 2>/dev/null || true
find "$PROD_SMARTY" -type f 2>/dev/null | wc -l

echo "=== limpiar nginx ==="
uapi --output=jsonpretty NginxCaching clear_cache

echo "listo"
