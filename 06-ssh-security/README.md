# Módulo 06: Seguridad SSH

## 🎯 Objetivo
Auditar los parámetros críticos de hardening en la configuración del servicio SSH (`sshd_config`) y verificar la presencia de claves públicas autorizadas (`authorized_keys`) para prevenir accesos no autorizados y detectar posibles vectores de persistencia.

## 🛠️ Herramientas Utilizadas
- `grep -iE` - Inspección de directivas clave de seguridad (`Port`, `PermitRootLogin`, `PasswordAuthentication`, `PubkeyAuthentication`, `X11Forwarding`) en la configuración principal y archivos modulares `.d/`.
- Bucle `for` en Bash - Auditoría multiusuario de archivos `authorized_keys` en `/home/*` y `/root`.
- `sed` - Sanitización en *pipeline* para enmascarar el *hostname* local y anonimizar rutas de usuarios personales.

## 📜 Automatización y Evidencias
- **Script:** `scripts/ssh_security_collector.sh` (Recolección automatizada y auditoría de directivas SSH).
- **Evidencia:** `evidence/ssh_security_info.txt` (Reporte anonimizado en formato UTC).
