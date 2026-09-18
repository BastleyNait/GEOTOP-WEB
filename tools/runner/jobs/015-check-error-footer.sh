#!/bin/bash
set -uo pipefail
echo "--- public_html/dev.geotop-aqp.com/error_log (tail) ---"
tail -n 60 "$HOME/public_html/dev.geotop-aqp.com/error_log" 2>&1
echo "--- var/logs (dev) ---"
find "$HOME/public_html/dev.geotop-aqp.com/var/logs" -type f -newermt '-10 minutes' 2>&1
for f in $(find "$HOME/public_html/dev.geotop-aqp.com/var/logs" -type f -newermt '-10 minutes' 2>/dev/null); do
  echo "== $f =="
  tail -n 60 "$f"
done
echo "--- cpanel main error_log (tail) ---"
tail -n 40 "$HOME/logs/dev.geotop-aqp.com.error.log" 2>&1
echo "listo"
