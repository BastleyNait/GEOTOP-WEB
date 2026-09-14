#!/bin/bash
# Ejecutor de trabajos para cuentas cPanel sin acceso shell.
# Un Cron Job lo corre cada minuto: toma los scripts que se suben por SFTP
# a ~/claude-runner/queue, los ejecuta uno a uno y guarda la salida en out/.
# Vive fuera de public_html, así que no es accesible desde la web.

BASE="$HOME/claude-runner"

# Caducidad: pasada esta fecha no ejecuta nada (borrar el Cron Job igual)
EXPIRA="2026-09-28"
[ "$(date +%F)" \> "$EXPIRA" ] && exit 0

mkdir -p "$BASE/queue" "$BASE/running" "$BASE/out" "$BASE/done"

# Evita que dos ejecuciones se pisen si un trabajo dura más de un minuto
LOCK="$BASE/.lock"
if ! mkdir "$LOCK" 2>/dev/null; then
  # Lock huérfano de más de 3 horas: se libera
  if [ -n "$(find "$LOCK" -maxdepth 0 -mmin +180 2>/dev/null)" ]; then
    rmdir "$LOCK" && mkdir "$LOCK" || exit 0
  else
    exit 0
  fi
fi
trap 'rmdir "$LOCK"' EXIT

date -Is > "$BASE/heartbeat"

shopt -s nullglob
for job in "$BASE"/queue/*.sh; do
  name=$(basename "$job" .sh)
  mv "$job" "$BASE/running/$name.sh"
  {
    echo "### inicio $(date -Is)"
    bash "$BASE/running/$name.sh"
    echo "### fin código=$? $(date -Is)"
  } > "$BASE/out/$name.log" 2>&1
  mv "$BASE/running/$name.sh" "$BASE/done/$name.sh"
done
