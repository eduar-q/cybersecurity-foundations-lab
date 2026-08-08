#!/bin/bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
OUTPUT="$SCRIPT_DIR/../evidence/audit_log_info.txt"
mkdir -p "$SCRIPT_DIR/../evidence"

HOST=$(hostname)

{
    echo "=== AUDITORÍA DE LOGS Y AUTENTICACIÓN ==="
    echo "Fecha: $(date -u '+%Y-%m-%d %H:%M:%S UTC')"
    echo ""

    echo "--- INTENTOS FALLIDOS DE LOGIN ---"
    grep -E "Failed password|authentication failure|Invalid user" \
        /var/log/auth.log /var/log/secure 2>/dev/null | tail -n 10

    echo ""
    echo "--- ÚLTIMAS SESIONES ---"
    last -n 10

} | sed \
    -e 's/192\.168\.[0-9.]\+/192.168.1.100/g' \
    -e 's/10\.[0-9.]\+/10.0.0.100/g' \
    -e 's/172\.1[6-9]\.[0-9.]\+/172.16.0.100/g' \
    -e 's/172\.2[0-9]\.[0-9.]\+/172.16.0.100/g' \
    -e 's/172\.3[0-1]\.[0-9.]\+/172.16.0.100/g' \
    -e 's/fe80::[0-9a-fA-F:]*/fe80::1234:5678:90ab:cdef/g' \
    -e "s/${SUDO_USER:-$(whoami)}/analyst/g" \
    -e "s/$HOST/soc-lab-node1/g" \
    > "$OUTPUT"

echo "[+] Reporte generado en $OUTPUT"
