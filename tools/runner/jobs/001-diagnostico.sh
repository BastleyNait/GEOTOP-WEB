#!/bin/bash
# Diagnóstico de solo lectura antes de crear el staging.

echo "== usuario"; whoami; id
echo "== binarios"
for b in php mysql mysqldump rsync tar gzip uapi find sed; do printf "%-10s " "$b"; command -v "$b" || echo "NO"; done
php -v 2>&1 | head -1
ls -d /opt/cpanel/ea-php*/root/usr/bin/php 2>/dev/null

echo "== cuota"
uapi --output=jsonpretty Quota get_quota_info 2>&1 | grep -E '"(megabytes_used|megabyte_limit|megabytes_remain|inodes_used|inode_limit)"'

echo "== tamaño home"
du -sh "$HOME" 2>/dev/null
du -sh "$HOME"/* "$HOME"/.[!.]* 2>/dev/null | sort -h | tail -12

echo "== tamaño public_html"
du -sh "$HOME/public_html" 2>/dev/null
du -sh "$HOME"/public_html/* 2>/dev/null | sort -h | tail -12
du -sh "$HOME"/public_html/img/* 2>/dev/null | sort -h | tail -5
du -sh "$HOME"/public_html/var/* "$HOME"/public_html/themes/* 2>/dev/null

echo "== dominios"
uapi --output=jsonpretty DomainInfo list_domains 2>&1 | head -30

echo "== versiones PHP disponibles"
uapi --output=jsonpretty LangPHP php_get_installed_versions 2>&1 | grep -o 'ea-php[0-9]*' | sort -u

echo "== base de datos (tamaño por tabla, top 15)"
CNF="$HOME/claude-runner/.my.cnf"
php -r '$p = require getenv("HOME")."/public_html/app/config/parameters.php"; $c = $p["parameters"];
echo "[client]\nuser=\"{$c["database_user"]}\"\npassword=\"{$c["database_password"]}\"\nhost={$c["database_host"]}\n";' > "$CNF"
chmod 600 "$CNF"
mysql --defaults-extra-file="$CNF" -N -e "
SELECT CONCAT(ROUND(SUM(data_length+index_length)/1048576,1),' MB total') FROM information_schema.tables WHERE table_schema='geotop_presta';
SELECT CONCAT(ROUND(SUM(data_length+index_length)/1048576,1),' MB solo ps_ps5') FROM information_schema.tables WHERE table_schema='geotop_presta' AND table_name LIKE 'ps\_ps5%';
SELECT table_name, ROUND((data_length+index_length)/1048576,1) AS mb, table_rows FROM information_schema.tables WHERE table_schema='geotop_presta' ORDER BY (data_length+index_length) DESC LIMIT 15;
SELECT 'pedidos', COUNT(*) FROM geotop_presta.ps_ps5orders;
SELECT 'productos', COUNT(*) FROM geotop_presta.ps_ps5product;
SELECT 'clientes', COUNT(*) FROM geotop_presta.ps_ps5customer;
SELECT name, value FROM geotop_presta.ps_ps5configuration WHERE name IN ('PS_SHOP_DOMAIN','PS_SHOP_DOMAIN_SSL','PS_SSL_ENABLED','PS_SSL_ENABLED_EVERYWHERE','PS_MAIL_METHOD','PS_CSS_THEME_CACHE','PS_JS_THEME_CACHE','PS_SMARTY_CACHE','PS_REWRITING_SETTINGS');
SELECT id_shop_url, domain, domain_ssl, physical_uri FROM geotop_presta.ps_ps5shop_url;
" 2>&1

echo "== memcache"
php -r 'echo class_exists("Memcache") ? "Memcache ext: si\n" : "Memcache ext: no\n"; echo class_exists("Memcached") ? "Memcached ext: si\n" : "Memcached ext: no\n";'
