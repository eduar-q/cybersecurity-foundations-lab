# Módulo 04: Web Security - Auditoría de Cabeceras HTTP

## 🎯 Objetivo
Auditar las cabeceras HTTP de respuesta de un servidor web para identificar la presencia de controles de seguridad críticos (`HSTS`, `X-Frame-Options`, `X-Content-Type-Options`, `Content-Security-Policy`) y detectar la exposición innecesaria de información del servidor (*Banner Grabbing*).

## 🛠️ Herramientas Utilizadas
- `curl -I -s` - Inspección silenciosa de cabeceras HTTP/HTTPS.
- `grep -qi` - Verificación condicional de presencia de cabeceras defensivas.
- `sed` - Sanitización en *pipeline* de dominios, cookies y direcciones de red.

## 📜 Automatización y Evidencias
- **Script:** `scripts/headers_checker.sh` (Recolección automatizada y análisis condicional de cabeceras).
- **Evidencia:** `evidence/http_headers_audit.txt` (Reporte sanitizado con objetivo ficticio `target-app.local`).
