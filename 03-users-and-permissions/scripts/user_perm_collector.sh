#!/bin/bash

OUTPUT="../evidence/users_and_permissions.txt"
mkdir -p "../evidence"

{
    echo "=== AUDITORÍA DE USUARIOS, GRUPOS Y PERMISOS ==="
    echo "Fecha: $(date -u '+%Y-%m-%d %H:%M:%S UTC')"
    echo ""

    echo "--- USUARIOS INTERACTIVOS ---"
    grep -E '(/bin/bash|/bin/zsh)$' /etc/passwd | \
    awk -F: 'BEGIN{OFS=":"} {if($1!="root"){$1="analyst"; $5="analyst"; $6="/home/analyst"} print}'

    echo ""
    echo "--- GRUPO SUDO (ADMINISTRADORES) ---"
    getent group sudo | awk -F: '{print $1":"$2":"$3":analyst"}'

    echo ""
    echo "--- BINARIOS SUID / SGID ---"
    find / -perm -4000 -type f 2>/dev/null
    find / -perm -2000 -type f 2>/dev/null

    echo ""
    [[ $EUID -ne 0 ]] && echo "[!] ADVERTENCIA: Sin root pueden faltar SUID/SGID."

} | sed -e 's|/home/[^/]*|/home/analyst|g' > "$OUTPUT"

echo "[+] Reporte generado: $OUTPUT"
