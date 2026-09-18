#!/bin/bash
set -uo pipefail
echo "--- find error_log / *.error.log modified last 30 min ---"
find "$HOME" -maxdepth 4 \( -iname "error_log" -o -iname "*.error.log" -o -iname "error.log" \) -newermt '-30 minutes' 2>/dev/null
echo "--- any error_log anywhere under home (just list, no time filter) ---"
find "$HOME" -maxdepth 3 -iname "error_log" 2>/dev/null
find "$HOME/public_html" -maxdepth 3 -iname "error_log" 2>/dev/null
echo "--- var/logs dev full listing ---"
find "$HOME/public_html/dev.geotop-aqp.com/var/logs" -maxdepth 2 2>&1
echo "listo"
