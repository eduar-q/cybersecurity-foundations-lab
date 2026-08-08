#!/bin/bash

OUTPUT="../evidence/network_info.txt"
mkdir -p "../evidence"

# Todo lo que está entre { } se agrupa y se envía al filtro sed final
{
    echo "=== AUDITORÍA DE RED Y CONEXIONES ==="
    echo "Fecha de recolección: $(date -u '+%Y-%m-%d %H:%M:%S UTC')"
    echo ""
    
    echo "--- DIRECCIONES E INTERFACES DE RED ---"
    ip addr show
    echo ""
    
    echo "--- PUERTOS Y SOCKETS EN ESCUCHA ---"
    ss -tulpn

} | sed \
    -e 's/\([0-9a-fA-F]\{2\}:\)\{5\}[0-9a-fA-F]\{2\}/aa:bb:cc:dd:ee:ff/g' \
    -e 's/192\.168\.[0-9.]\+/192.168.1.100/g' \
    -e 's/10\.[0-9.]\+/10.0.0.100/g' \
    -e 's/fe80:[a-fA-F0-9:]\+/fe80::1234:5678:90ab:cdef/g' \
    -e 's/enp[0-9]\+s[0-9]\+/eth0/g' \
    -e 's/users:((".*"))/users:(("process",pid=XXXX,fd=XX))/g' \
    > "$OUTPUT"

echo "[+] Auditoría de red recolectada y sanitizada en $OUTPUT"
