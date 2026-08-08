#!/bin/bash

# Archivo de salida sanitizado en la carpeta de evidencias
OUTPUT="../evidence/network_info.txt"

echo "=== AUDITORÍA DE RED Y CONEXIONES ===" > "$OUTPUT"
echo "Fecha de recolección: $(date)" >> "$OUTPUT"
echo "" >> "$OUTPUT"

echo "--- INTERFACES DE RED ---" >> "$OUTPUT"
ip link show >> "$OUTPUT"
echo "" >> "$OUTPUT"

echo "--- DIRECCIONES IP (Sanitizado: Se muestra configuración local) ---" >> "$OUTPUT"
ip addr show >> "$OUTPUT"
echo "" >> "$OUTPUT"

echo "--- PUERTOS Y SOCKETS EN ESCUCHA (TCP/UDP) ---" >> "$OUTPUT"
ss -tulpn >> "$OUTPUT"

echo "Recolección de red completada con éxito en $OUTPUT"
