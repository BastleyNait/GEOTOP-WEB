#!/bin/bash
# Revisa el registro DNS del staging y limpia la caché de nginx del hosting.

HOST=dev.geotop-aqp.com

echo "== Registros del subdominio en la zona DNS de cPanel"
uapi --output=jsonpretty DNS parse_zone zone=geotop-aqp.com 2>&1 \
  | grep -B3 -A12 -E 'ZGV2|"dev|dev\.geotop|dGVzdA' | grep -E '"(dname_b64|record_type|data_b64|line_index|ttl)"' | head -40
echo "(dname/data vienen en base64: ZGV2 = dev, dGVzdA = test)"

echo "== Resolución desde el servidor"
getent hosts "$HOST" || echo "no resuelve en el servidor"
getent hosts test.geotop-aqp.com || true

echo "== Documento raíz del subdominio"
uapi --output=jsonpretty DomainInfo single_domain_data domain="$HOST" 2>&1 | grep -E '"(documentroot|homedir|type|ip)"'

echo "== Caché de nginx"
uapi --output=jsonpretty NginxCaching clear_cache 2>&1 | grep -E '"(status|errors)"' -A2 | head -8

echo "== AutoSSL (de nuevo)"
uapi --output=json SSL start_autossl_check 2>&1 | grep -o '"status":[01]' || true
