#!/bin/bash

# --- RUTA ROBUSTA ---
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
OUTPUT_DIR="$SCRIPT_DIR/../evidence"
OUTPUT="$OUTPUT_DIR/process_info.txt"

mkdir -p "$OUTPUT_DIR"

CURRENT_HOST=$(hostname)

# Escapar hostname para sed
HOST_ESCAPED=$(echo "$CURRENT_HOST" | sed 's/[].*[]/\&/g')

{
    echo "=== AUDITORÍA DE PROCESOS Y SERVICIOS ==="
    echo "Fecha de recolección: $(date -u '+%Y-%m-%d %H:%M:%S UTC')"
    echo ""

    echo "--- TOP 10 PROCESOS POR CONSUMO DE RECURSOS ---"
    echo "USER       PID  %CPU %MEM  COMMAND"
    ps aux --sort=-%cpu | awk 'NR>1 {
        # Extraer solo el nombre del ejecutable
        cmd = $11
        sub(".*/", "", cmd)

        # Sanitizar usuario
        user = $1
        if (user != "root") user = "analyst"

        printf "%-10s %5s %5s %5s  %s\n", user, $2, $3, $4, cmd
    }' | head -n 10

    echo ""
    echo "--- SERVICIOS EN EJECUCIÓN ---"
    systemctl list-units --type=service --state=running --no-pager --plain 2>/dev/null | head -n 15 || echo "[!] systemctl no disponible"

} | sed \
    -e "s/$HOST_ESCAPED/soc-lab-node1/g" \
    -e 's/\/home\/[a-zA-Z0-9_-]*/\/home\/analyst/g' \
    > "$OUTPUT"

echo "[+] Reporte generado: $OUTPUT"
