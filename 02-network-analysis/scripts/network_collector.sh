#!/bin/bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
OUTPUT_DIR="$SCRIPT_DIR/../evidence"
OUTPUT="$OUTPUT_DIR/network_info.txt"

mkdir -p "$OUTPUT_DIR"

# --- ENCABEZADO Y RECOLECCIÓN EN PIPELINE ---
{
    echo "=== AUDITORÍA DE RED Y CONEXIONES ==="
    echo "Fecha de recolección: $(date -u '+%Y-%m-%d %H:%M:%S UTC')"
    echo ""
    
    echo "--- INTERFACES DE RED ---"
    ip link show | sed \
        -e 's/[0-9a-fA-F]\{2\}:[0-9a-fA-F]\{2\}:[0-9a-fA-F]\{2\}:[0-9a-fA-F]\{2\}:[0-9a-fA-F]\{2\}:[0-9a-fA-F]\{2\}/aa:bb:cc:dd:ee:ff/g' \
        -e 's/enp[0-9]\+s[0-9]\+/eth0/g'
    
    echo ""
    echo "--- DIRECCIONES IP (Sanitizado) ---"
    ip addr show | sed \
        -e 's/[0-9a-fA-F]\{2\}:[0-9a-fA-F]\{2\}:[0-9a-fA-F]\{2\}:[0-9a-fA-F]\{2\}:[0-9a-fA-F]\{2\}:[0-9a-fA-F]\{2\}/aa:bb:cc:dd:ee:ff/g' \
        -e 's/192\.168\.[0-9]\{1,3\}\.[0-9]\{1,3\}/192.168.1.100/g' \
        -e 's/10\.[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}/10.0.0.100/g' \
        -e 's/172\.1[6-9]\.[0-9]\{1,3\}\.[0-9]\{1,3\}/172.16.0.100/g' \
        -e 's/172\.2[0-9]\.[0-9]\{1,3\}\.[0-9]\{1,3\}/172.16.0.100/g' \
        -e 's/172\.3[0-1]\.[0-9]\{1,3\}\.[0-9]\{1,3\}/172.16.0.100/g' \
        -e 's/fe80::[0-9a-fA-F:]*/fe80::1234:5678:90ab:cdef/g' \
        -e 's/enp[0-9]\+s[0-9]\+/eth0/g'
    
    echo ""
    echo "--- PUERTOS Y SOCKETS EN ESCUCHA ---"
    ss -tulpn | sed \
        -e 's/192\.168\.[0-9]\{1,3\}\.[0-9]\{1,3\}/192.168.1.100/g' \
        -e 's/10\.[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}/10.0.0.100/g' \
        -e 's/127\.[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}/127.0.0.1/g' \
        -e 's/fe80::[0-9a-fA-F:]*/fe80::1234:5678:90ab:cdef/g' \
        -e 's/users:(("[^"]*",pid=[0-9]*,fd=[0-9]*))/users:(("process",pid=XXXX,fd=XX))/g'
    
} > "$OUTPUT"

echo "[+] Recolección y sanitización completadas en $OUTPUT"
