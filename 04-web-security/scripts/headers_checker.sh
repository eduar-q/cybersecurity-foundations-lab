#!/bin/bash

# --- RUTA ROBUSTA ---
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
OUTPUT_DIR="$SCRIPT_DIR/../evidence"
OUTPUT="$OUTPUT_DIR/http_headers_audit.txt"

mkdir -p "$OUTPUT_DIR"

# Objetivo de auditoría (Dominio de prueba/Laboratorio)
TARGET="example.com"

# --- ENCABEZADO Y EJECUCIÓN EN PIPELINE ---
{
    echo "=== AUDITORÍA DE CABECERAS HTTP DE SEGURIDAD ==="
    echo "Fecha de recolección: $(date -u '+%Y-%m-%d %H:%M:%S UTC')"
    echo "Objetivo auditado: target-app.local"
    echo ""

    echo "--- CABECERAS OBTENIDAS ---"
    curl -I -s "https://$TARGET" | sed \
        -e 's/Set-Cookie:.*/Set-Cookie: [REDACTED_COOKIE]/gI' \
        -e 's/192\.168\.[0-9]\{1,3\}\.[0-9]\{1,3\}/192.168.1.100/g' \
        -e 's/10\.[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}/10.0.0.100/g' \
        -e 's/[a-zA-Z0-9.-]*\.com/target-app.local/gI'

    echo ""
    echo "--- EVALUACIÓN DE CABECERAS DEFENSIVAS ---"
    HEADERS_RAW=$(curl -I -s "https://$TARGET")

    for HEADER in "Strict-Transport-Security" "X-Frame-Options" "X-Content-Type-Options" "Content-Security-Policy"; do
        if echo "$HEADERS_RAW" | grep -qi "$HEADER"; then
            echo "[+] $HEADER: CONFIGURADA"
        else
            echo "[-] $HEADER: FALTA (Riesgo Potencial)"
        fi
    done

} > "$OUTPUT"

echo "[+] Auditoría de cabeceras completada en $OUTPUT"
