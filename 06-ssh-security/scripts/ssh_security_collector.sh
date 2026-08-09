#!/bin/bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
OUTPUT="$SCRIPT_DIR/../evidence/ssh_security_info.txt"
mkdir -p "$SCRIPT_DIR/../evidence"

HOST=$(hostname)

{
    echo "=== AUDITORÍA DE SEGURIDAD SSH ==="
    echo "Fecha: $(date -u '+%Y-%m-%d %H:%M:%S UTC')"
    echo ""

    echo "--- CONFIGURACIÓN SSHD ---"
    grep -iE "^[[:space:]]*(Port|PermitRootLogin|PasswordAuthentication|PubkeyAuthentication|X11Forwarding)" \
        /etc/ssh/sshd_config /etc/ssh/sshd_config.d/*.conf 2>/dev/null || echo "[!] sshd_config no accesible"

    echo ""
    echo "--- CLAVES AUTORIZADAS POR USUARIO ---"
    for keyfile in /home/*/.ssh/authorized_keys; do
        [ -f "$keyfile" ] || continue
        user=$(basename "$(dirname "$(dirname "$keyfile")")")
        count=$(wc -l < "$keyfile")
        echo "Usuario: $user | Claves: $count"
    done

    [ -f /root/.ssh/authorized_keys ] && echo "Usuario: root | Claves: $(wc -l < /root/.ssh/authorized_keys)"

} | sed \
    -e 's|/home/[^/]*|/home/analyst|g' \
    -e "s/$HOST/soc-lab-node1/g" \
    > "$OUTPUT"

echo "[+] Reporte generado en $OUTPUT"
