# Módulo 02: Análisis de Redes y Conexiones

## 🎯 Objetivo
Auditar la infraestructura de red local, identificar las interfaces activas, analizar el direccionamiento IP y revisar los puertos/sockets en modo escucha (`LISTEN`) para detectar posibles servicios expuestos.

## 🛠️ Herramientas Utilizadas
- `ip link show` - Identificación de las interfaces de red físicas y virtuales.
- `ip addr show` - Inspección de direcciones IP y máscaras de red.
- `ss -tulpn` - Auditoría de sockets TCP/UDP y procesos asociados en modo escucha.
- `sed` - Sanitización automática de direccionamiento IP, MAC, interfaces y procesos para informes de auditoría.

## 📜 Automatización y Evidencias
- **Script:** `scripts/network_collector.sh` (Recolección automatizada de la configuración de red).
- **Evidencia:** `evidence/network_info.txt` (Reporte sanitizado con direccionamiento de laboratorio `192.168.1.x`).
