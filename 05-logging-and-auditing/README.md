# Módulo 05: Logging y Auditoría de Sistema

## 🎯 Objetivo
Auditar los registros de eventos del sistema y el historial de autenticación para detectar intentos de acceso no autorizados, eventos de fuerza bruta y patrones anómalos en los accesos al servidor.

## 🛠️ Herramientas Utilizadas
- `grep -E` - Filtrado avanzado de eventos clave (`Failed password`, `authentication failure`, `Invalid user`) con soporte multi-distribución (`/var/log/auth.log` y `/var/log/secure`).
- `last` - Auditoría del historial de sesiones de usuario activas y reinicios del sistema.
- `sed` - Sanitización en *pipeline* para enmascarar subredes IPv4, direcciones IPv6, el *hostname* local y la cuenta del usuario analista.

## 📜 Automatización y Evidencias
- **Script:** `scripts/audit_log_collector.sh` (Recolección automatizada de eventos de seguridad y sanitización en *pipeline*).
- **Evidencia:** `evidence/audit_log_info.txt` (Reporte ordenado y anonimizado en formato UTC).
