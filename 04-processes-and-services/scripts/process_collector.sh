#!/bin/bash

OUTPUT="../evidence/process_info.txt"
mkdir -p "../evidence"

{
    echo "=== AUDITORÍA DE PROCESOS Y SERVICIOS ==="
    echo "Fecha: $(date -u '+%Y-%m-%d %H:%M:%S UTC')"
    echo ""

    echo "--- TOP 10 PROCESOS POR CONSUMO DE CPU ---"
    ps aux --sort=-%cpu | awk -v me="${SUDO_USER:-$(whoami)}" 'NR==1 || NR<=11 {
        if (NR>1 && $1==me) $1="analyst"
        sub(".*/", "", $11)
        print $1, $2, $3, $4, $11
    }'

    echo ""
    echo "--- SERVICIOS EN EJECUCIÓN ---"
    systemctl list-units --type=service --state=running --no-pager --plain 2>/dev/null | head -n 15

} | sed -e 's|/home/[^/]*|/home/analyst|g' > "$OUTPUT"

echo "[+] Reporte generado: $OUTPUT"
