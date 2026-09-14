#!/bin/bash
# Crea el staging dev.geotop-aqp.com como copia de producción.
# Producción solo se LEE (archivos con tar, base de datos con mysqldump).
# Todo lo que se escribe va al subdominio y a la base de datos nuevos.
set -euo pipefail

SUB=dev
DOM=geotop-aqp.com
HOST="$SUB.$DOM"
PROD="$HOME/public_html"
PROD_DB=geotop_presta
PREFIX=ps_ps5
DEV_DB=geotop_dev
DEV_USER=geotop_dev
R="$HOME/claude-runner"
MARK="$R/.staging-creado"
CNF_PROD="$R/.my-prod.cnf"
CNF_DEV="$R/.my-dev.cnf"

# Tablas de estadísticas de visitas: se copia su estructura pero no sus datos (~2.7 GB)
SIN_DATOS="connections connections_page connections_source guest pagenotfound"

paso() { echo; echo "== $(date +%T) $*"; }
# Ejecuta uapi y falla si no devuelve status 1 (sin pipes: con pipefail, grep -q provoca SIGPIPE)
uapi_ok() { local out; out=$(uapi --output=json "$@"); [[ "$out" == *'"status":1'* ]] || { echo "uapi $1 $2 falló: $out"; return 1; }; }
umask 077

if [ -e "$MARK" ]; then
  echo "El staging ya fue creado el $(cat "$MARK"). No hago nada."
  exit 0
fi

paso "PHP de línea de comandos"
PHP=""
for v in 72 74 81 83; do
  c="/opt/cpanel/ea-php$v/root/usr/bin/php"
  if [ -x "$c" ] && [ "$("$c" -r 'echo "ok";' 2>/dev/null | tail -1)" = "ok" ]; then PHP="$c"; break; fi
done
[ -n "$PHP" ] || { echo "No encontré un PHP CLI usable"; exit 1; }
echo "$PHP"

paso "Espacio libre"
CUOTA=$(uapi --output=json Quota get_quota_info)
LIBRE=$(grep -o '"megabytes_remain":"\?[0-9.]*' <<<"$CUOTA" | grep -o '[0-9.]*$' | cut -d. -f1 || true)
echo "${LIBRE} MB libres"
[ "${LIBRE:-0}" -gt 3000 ] || { echo "Menos de 3 GB libres, aborto"; exit 1; }

paso "Conexión a la base de datos de producción"
# Genera un .cnf con las credenciales leídas de parameters.php (no se imprimen)
"$PHP" -r '
$p = (require $argv[1])["parameters"];
$q = function ($s) { return "\"" . addcslashes($s, "\"\\") . "\""; };
file_put_contents($argv[2], "[client]\nuser=" . $q($p["database_user"]) . "\npassword=" . $q($p["database_password"]) . "\nhost=" . $p["database_host"] . "\n");
' "$PROD/app/config/parameters.php" "$CNF_PROD"
chmod 600 "$CNF_PROD"
mysql --defaults-extra-file="$CNF_PROD" -N -e "
SELECT 'productos', COUNT(*) FROM $PROD_DB.${PREFIX}product;
SELECT 'pedidos', COUNT(*) FROM $PROD_DB.${PREFIX}orders;
SELECT 'clientes', COUNT(*) FROM $PROD_DB.${PREFIX}customer;
SELECT 'MB total DB', ROUND(SUM(data_length+index_length)/1048576) FROM information_schema.tables WHERE table_schema='$PROD_DB';
SELECT 'MB tablas $PREFIX', ROUND(SUM(data_length+index_length)/1048576) FROM information_schema.tables WHERE table_schema='$PROD_DB' AND LEFT(table_name, ${#PREFIX}) = '$PREFIX';"

paso "Subdominio $HOST"
DOMINIOS=$(uapi --output=json DomainInfo list_domains)
if [[ "$DOMINIOS" == *"\"$HOST\""* ]]; then
  echo "El subdominio $HOST ya existe; lo reviso a mano antes de tocar nada. Aborto."
  exit 1
fi
uapi_ok SubDomain addsubdomain domain="$SUB" rootdomain="$DOM" dir="public_html/$HOST"
# cPanel puede forzar otra ruta (en esta cuenta obliga a public_html): usar la que realmente asignó
DATOS=$(uapi --output=json DomainInfo single_domain_data domain="$HOST")
DEV=$(grep -o '"documentroot":"[^"]*' <<<"$DATOS" | cut -d'"' -f4 || true)
[ -n "$DEV" ] || { echo "No pude leer el documentroot del subdominio: $DATOS"; exit 1; }
echo "Carpeta del staging: $DEV"
[ "$DEV" != "$PROD" ] || { echo "La carpeta del staging coincide con producción, aborto"; exit 1; }
mkdir -p "$DEV"
[ ! -e "$DEV/index.php" ] || { echo "$DEV ya tiene un index.php, aborto"; exit 1; }

paso "Base de datos $DEV_DB"
DEV_PW=$(openssl rand -base64 48 | tr -dc 'A-Za-z0-9' | cut -c1-32)
uapi_ok Mysql create_database name="$DEV_DB"
uapi_ok Mysql create_user name="$DEV_USER" password="$DEV_PW"
uapi_ok Mysql set_privileges_on_database user="$DEV_USER" database="$DEV_DB" privileges='ALL PRIVILEGES'
printf '[client]\nuser="%s"\npassword="%s"\nhost=localhost\n' "$DEV_USER" "$DEV_PW" > "$CNF_DEV"
chmod 600 "$CNF_DEV"
echo "Base de datos y usuario creados (la contraseña solo queda en archivos del servidor)"

paso "Copiando archivos (sin temas viejos, caché ni logs)"
tar -C "$PROD" -cf - \
  --exclude=./themes/classic_old2 \
  --exclude=./themes/classic_old \
  --exclude=./themes/classic/assets.zip \
  --exclude='./var/cache/*' \
  --exclude='./var/logs/*' \
  --exclude='./img/tmp/*' \
  --exclude="./$HOST" \
  --exclude=./test.geotop-aqp.com \
  --exclude=./.well-known \
  --exclude=./cgi-bin \
  . | tar -C "$DEV" -xpf -
mkdir -p "$DEV/var/cache" "$DEV/var/logs"
du -sh "$DEV"

paso "Copiando base de datos (tablas $PREFIX, sin estadísticas de visitas)"
TABLAS=$(mysql --defaults-extra-file="$CNF_PROD" -N -e "SELECT table_name FROM information_schema.tables WHERE table_schema='$PROD_DB' AND LEFT(table_name, ${#PREFIX}) = '$PREFIX' ORDER BY table_name")
EXCLUIR=$(for t in $SIN_DATOS; do echo "$PREFIX$t"; done)
TABLAS_DATOS=$(echo "$TABLAS" | grep -vxF "$EXCLUIR")
echo "$(echo "$TABLAS" | wc -l) tablas; $(echo "$TABLAS_DATOS" | wc -l) con datos"
# shellcheck disable=SC2086
mysqldump --defaults-extra-file="$CNF_PROD" --single-transaction --no-data "$PROD_DB" $TABLAS \
  | mysql --defaults-extra-file="$CNF_DEV" "$DEV_DB"
# shellcheck disable=SC2086
mysqldump --defaults-extra-file="$CNF_PROD" --single-transaction --quick --no-create-info "$PROD_DB" $TABLAS_DATOS \
  | mysql --defaults-extra-file="$CNF_DEV" "$DEV_DB"
mysql --defaults-extra-file="$CNF_DEV" -N -e "
SELECT 'productos', COUNT(*) FROM $DEV_DB.${PREFIX}product;
SELECT 'pedidos', COUNT(*) FROM $DEV_DB.${PREFIX}orders;
SELECT 'clientes', COUNT(*) FROM $DEV_DB.${PREFIX}customer;
SELECT 'MB staging', ROUND(SUM(data_length+index_length)/1048576) FROM information_schema.tables WHERE table_schema='$DEV_DB';"

paso "Apuntando el staging a su base de datos"
export DEV_DB DEV_USER DEV_PW
"$PHP" -r '
$f = $argv[1];
$p = require $f;
$p["parameters"]["database_name"] = getenv("DEV_DB");
$p["parameters"]["database_user"] = getenv("DEV_USER");
$p["parameters"]["database_password"] = getenv("DEV_PW");
$p["parameters"]["ps_cache_enable"] = false; // no compartir Memcache con producción
file_put_contents($f, "<?php return " . var_export($p, true) . ";\n");
' "$DEV/app/config/parameters.php"
unset DEV_PW
grep -E "'(database_name|database_user|database_prefix|ps_cache_enable)'" "$DEV/app/config/parameters.php"
if [ -f "$DEV/config/settings.inc.php" ]; then
  echo "AVISO: existe config/settings.inc.php con $(grep -c '_DB_' "$DEV/config/settings.inc.php") líneas _DB_"
fi

paso "Ajustes de la tienda en staging"
mysql --defaults-extra-file="$CNF_DEV" "$DEV_DB" -e "
UPDATE ${PREFIX}shop_url SET domain='$HOST', domain_ssl='$HOST';
UPDATE ${PREFIX}configuration SET value='$HOST' WHERE name IN ('PS_SHOP_DOMAIN','PS_SHOP_DOMAIN_SSL');
-- Sin HTTPS hasta que AutoSSL emita el certificado del subdominio
UPDATE ${PREFIX}configuration SET value='0' WHERE name IN ('PS_SSL_ENABLED','PS_SSL_ENABLED_EVERYWHERE');
-- Nunca enviar correos desde staging (clientes reales en la copia)
UPDATE ${PREFIX}configuration SET value='3' WHERE name='PS_MAIL_METHOD';
-- Ver los cambios al instante: sin caché de CSS/JS/Smarty, recompilar plantillas modificadas
UPDATE ${PREFIX}configuration SET value='0' WHERE name IN ('PS_CSS_THEME_CACHE','PS_JS_THEME_CACHE','PS_SMARTY_CACHE');
UPDATE ${PREFIX}configuration SET value='1' WHERE name='PS_SMARTY_FORCE_COMPILE';
UPDATE ${PREFIX}configuration SET value=CONCAT('[STAGING] ', value) WHERE name='PS_SHOP_NAME' AND value NOT LIKE '[STAGING]%';
SELECT name, value FROM ${PREFIX}configuration WHERE name IN ('PS_SHOP_DOMAIN','PS_SHOP_DOMAIN_SSL','PS_SSL_ENABLED','PS_MAIL_METHOD','PS_SHOP_NAME');
SELECT domain, domain_ssl, physical_uri FROM ${PREFIX}shop_url;"

sed -i "s/^#Domain: $DOM\$/#Domain: $HOST/" "$DEV/.htaccess"
cat >> "$DEV/.htaccess" <<'EOF'

# Staging: que los buscadores no lo indexen
<IfModule mod_headers.c>
Header set X-Robots-Tag "noindex, nofollow"
</IfModule>
EOF
printf 'User-agent: *\nDisallow: /\n' > "$DEV/robots.txt"
rm -rf "$DEV/var/cache/"*

paso "Certificado SSL (AutoSSL)"
uapi --output=json SSL start_autossl_check | grep -o '"status":[01]' || true

paso "Prueba HTTP"
sleep 20
curl -s -m 60 -o "$R/staging-home.html" -w "http=%{http_code} redirect=%{redirect_url}\n" "http://$HOST/" || true
grep -o '<title>[^<]*' "$R/staging-home.html" 2>/dev/null | head -1 || true

date -Is > "$MARK"
echo
echo "STAGING LISTO: http://$HOST/"
