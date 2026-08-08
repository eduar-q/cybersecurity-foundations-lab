#!/bin/bash

# --- RUTA ROBUSTA ---
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
OUTPUT_DIR="$SCRIPT_DIR/../evidence"
OUTPUT="$OUTPUT_DIR/process_info.txt"

mkdir -p "$OUTPUT_DIR"

CURRENT_USER=$(whoami)
CURRENT_HOST=$(hostname)

# --- ENCABEZADO Y RECOLECCIÓN EN PIPELINE ---
{
    echo "=== AUDITORÍA DE PROCESOS Y SERVICIOS ==="
    echo "Fecha de recolección: $(date -u '+%Y-%m-%d %H:%M:%S UTC')"
    echo ""

    echo "--- TOP 10 PROCESOS POR CONSUMO DE RECURSOS ---"
    ps aux --sort=-%cpu | head -n 11 | awk -v user="$CURRENT_USER" '{
        if (NR>1 && $1 != "root") $1="analyst";
        print
    }'

    echo ""
    echo "--- SERVICIOS EN EJECUCIÓN (systemctl) ---"
    systemctl list-units --type=service --state=running --no-pager 2>/dev/null | head -n 15 || echo "[!] systemctl no disponible"

} | sed \
    -e "s/$CURRENT_HOST/soc-lab-node1/g" \
    -e 's/\/home\/[a-zA-Z0-9_-]*/\/home\/analyst/g' \
    > "$OUTPUT"

echo "[+] Auditoría de procesos completada en $OUTPUT"
