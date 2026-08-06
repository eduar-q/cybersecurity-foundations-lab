#!/bin/bash

# Archivo de salida en la carpeta de evidencias
OUTPUT="../evidence/system_info.txt"

echo "=== LÍNEA BASE DEL SISTEMA ===" > "$OUTPUT"
echo "Fecha de recolección: $(date)" >> "$OUTPUT"
echo "" >> "$OUTPUT"

echo "--- INFORMACIÓN DEL SISTEMA OPERATIVO ---" >> "$OUTPUT"
cat /etc/os-release >> "$OUTPUT"
echo "" >> "$OUTPUT"

echo "--- KERNEL Y ARQUITECTURA ---" >> "$OUTPUT"
echo "Kernel: $(uname -r)" >> "$OUTPUT"
echo "Arquitectura: $(uname -m)" >> "$OUTPUT"

echo "Línea base recolectada con éxito en $OUTPUT"
