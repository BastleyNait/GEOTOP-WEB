#!/bin/bash
# Diagnóstico de solo lectura: qué módulos están enganchados a los
# hooks de la barra de navegación (displayNav1, displayNav2, displayTop).
set -euo pipefail
PROD_DB=geotop_presta
PREFIX=ps_ps5
R="$HOME/claude-runner"
CNF="$R/.my-prod.cnf"
PHP="/opt/cpanel/ea-php72/root/usr/bin/php"

if [ ! -f "$CNF" ]; then
  "$PHP" -r '
  $p = (require $argv[1])["parameters"];
  $q = function ($s) { return "\"" . addcslashes($s, "\"\\") . "\""; };
  file_put_contents($argv[2], "[client]\nuser=" . $q($p["database_user"]) . "\npassword=" . $q($p["database_password"]) . "\nhost=" . $p["database_host"] . "\n");
  ' "$HOME/public_html/app/config/parameters.php" "$CNF"
  chmod 600 "$CNF"
fi

mysql --defaults-extra-file="$CNF" -N -e "
SELECT h.name AS hook, m.name AS modulo, hm.position, m.active
FROM $PROD_DB.${PREFIX}hook_module hm
JOIN $PROD_DB.${PREFIX}hook h ON h.id_hook = hm.id_hook
JOIN $PROD_DB.${PREFIX}module m ON m.id_module = hm.id_module
WHERE h.name IN ('displayNav1','displayNav2','displayTop','displayCart','displayNavFullWidth')
ORDER BY h.name, hm.position;
"
echo "--- modulo ps_shoppingcart activo? ---"
mysql --defaults-extra-file="$CNF" -N -e "SELECT name, active FROM $PROD_DB.${PREFIX}module WHERE name='ps_shoppingcart';"
