# Módulo 03: Usuarios, Grupos y Permisos Avanzados

## 🎯 Objetivo
Auditar las cuentas de usuario interactivas, verificar la membresía en el grupo con privilegios administrativos (`sudo`) e identificar archivos ejecutables con los bits **SUID** y **SGID** activados para detectar posibles vectores de escalación de privilegios.

## 🛠️ Herramientas Utilizadas
- `grep -E '(/bin/bash|/bin/zsh)' /etc/passwd` - Identificación de cuentas con acceso a terminal interactiva.
- `getent group sudo` - Auditoría robusta de usuarios con capacidad de elevación de privilegios.
- `find / -perm -4000 -type f` - Búsqueda de binarios con el bit SUID activado (ejecución como root).
- `find / -perm -2000 -type f` - Búsqueda de binarios con el bit SGID activado (ejecución con privilegios del grupo).
- `awk` / `sed` - Sanitización al vuelo de nombres de usuario, nombres de host, direcciones de red y rutas personales (`/home/analyst`) para preservación de OpSec.

## 📜 Automatización y Evidencias
- **Script:** `scripts/user_perm_collector.sh` (Recolección automatizada, manejo de rutas absolutas y sanitización dinámica).
- **Evidencia:** `evidence/users_and_permissions.txt` (Reporte anonimizado en UTC con el usuario ficticio `analyst`).
