#!/bin/bash

# Archivo de salida en la carpeta de evidencias
OUTPUT="../evidence/network_info.txt"

echo "=== AUDITORÍA DE RED Y CONEXIONES ===" > "$OUTPUT"
echo "Fecha de recolección: $(date)" >> "$OUTPUT"
echo "" >> "$OUTPUT"

echo "--- INTERFACES DE RED ---" >> "$OUTPUT"
ip link show >> "$OUTPUT"
echo "" >> "$OUTPUT"

echo "--- DIRECCIONES IP (Sanitizado) ---" >> "$OUTPUT"
ip addr show >> "$OUTPUT"
echo "" >> "$OUTPUT"

echo "--- PUERTOS Y SOCKETS EN ESCUCHA (TCP/UDP) ---" >> "$OUTPUT"
ss -tulpn >> "$OUTPUT"

# --- REGLAS DE SANITIZACIÓN (OpSec y Coherencia de Red) ---
sed -i \
  -e 's/78:2b:cb:82:73:cc/aa:bb:cc:dd:ee:ff/g' \
  -e 's/192\.168\.0\.179/192.168.1.100/g' \
  -e 's/192\.168\.0\.255/192.168.1.255/g' \
  -e 's/fe80::[0-9a-f:]*/fe80::1234:5678:90ab:cdef/g' \
  -e 's/enp2s0/eth0/g' \
  -e 's/firefox-bin/browser-process/g' \
  "$OUTPUT"

echo "Recolección y sanitización de red completadas con éxito en $OUTPUT"
