#!/bin/bash

# --- RUTA ROBUSTA ---
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
OUTPUT_DIR="$SCRIPT_DIR/../evidence"
OUTPUT="$OUTPUT_DIR/users_and_permissions.txt"

mkdir -p "$OUTPUT_DIR"
> "$OUTPUT"

# --- ENCABEZADO ---
echo "=== AUDITORÍA DE USUARIOS, GRUPOS Y PERMISOS ===" >> "$OUTPUT"
echo "Fecha de recolección: $(date -u '+%Y-%m-%d %H:%M:%S UTC')" >> "$OUTPUT"
echo "" >> "$OUTPUT"

# --- USUARIOS INTERACTIVOS (Username + GECOS + Home anonimizados) ---
echo "--- USUARIOS INTERACTIVOS (/bin/bash o /bin/zsh) ---" >> "$OUTPUT"
grep -E '(/bin/bash|/bin/zsh)$' /etc/passwd | \
  awk -F: 'BEGIN{OFS=":"} {
    if ($1 != "root") {
      $1="analyst"
      $5="analyst"
      $6="/home/analyst"
    }
    print
  }' >> "$OUTPUT"
echo "" >> "$OUTPUT"

# --- MIEMBROS DEL GRUPO SUDO (sanitizado con awk, no sed) ---
echo "--- MIEMBROS DEL GRUPO SUDO (ADMINISTRADORES) ---" >> "$OUTPUT"
CURRENT_USER=$(whoami)
(getent group sudo 2>/dev/null || grep '^sudo:' /etc/group) | \
  awk -v user="$CURRENT_USER" '{gsub(user, "analyst"); print}' >> "$OUTPUT"
echo "" >> "$OUTPUT"

# --- BINARIOS SUID ---
echo "--- ARCHIVOS CON PERMISOS ESPECIALES SUID (ROOT) ---" >> "$OUTPUT"
find / -perm -4000 -type f 2>/dev/null >> "$OUTPUT"
echo "" >> "$OUTPUT"

# --- BINARIOS SGID ---
echo "--- ARCHIVOS CON PERMISOS ESPECIALES SGID ---" >> "$OUTPUT"
find / -perm -2000 -type f 2>/dev/null >> "$OUTPUT"
echo "" >> "$OUTPUT"

# --- ADVERTENCIA SI NO ES ROOT ---
if [[ $EUID -ne 0 ]]; then
    echo "[!] ADVERTENCIA: Ejecutado sin root. Algunos SUID pueden faltar." >> "$OUTPUT"
fi

# --- SANITIZACIÓN DE RED E IDENTIFICADORES ---
CURRENT_HOST=$(hostname)

# Escapar hostname para sed (por si tiene puntos o guiones)
HOST_ESCAPED=$(echo "$CURRENT_HOST" | sed 's/[].*[]/\&/g')

sed -i \
  -e "s/$HOST_ESCAPED/soc-lab-node1/g" \
  -e 's/192\.168\.[0-9]\{1,3\}\.[0-9]\{1,3\}/192.168.1.100/g' \
  -e 's/10\.[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}/10.0.0.100/g' \
  -e 's/172\.1[6-9]\.[0-9]\{1,3\}\.[0-9]\{1,3\}/172.16.0.100/g' \
  -e 's/172\.2[0-9]\.[0-9]\{1,3\}\.[0-9]\{1,3\}/172.16.0.100/g' \
  -e 's/172\.3[0-1]\.[0-9]\{1,3\}\.[0-9]\{1,3\}/172.16.0.100/g' \
  -e 's/fe80::[0-9a-fA-F:]*/fe80::1234:5678:90ab:cdef/g' \
  -e 's/[0-9a-fA-F]\{2\}:[0-9a-fA-F]\{2\}:[0-9a-fA-F]\{2\}:[0-9a-fA-F]\{2\}:[0-9a-fA-F]\{2\}:[0-9a-fA-F]\{2\}/aa:bb:cc:dd:ee:ff/g' \
  "$OUTPUT"

echo "[+] Auditoría y sanitización completadas con éxito en $OUTPUT"
