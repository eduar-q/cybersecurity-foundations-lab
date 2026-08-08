# Módulo 02: Análisis de Redes y Conexiones

## 🎯 Objetivo
Auditar la infraestructura de red local, identificar las interfaces activas, analizar el direccionamiento IP y revisar los puertos/sockets en modo escucha (`LISTEN`) para detectar posibles servicios expuestos.

## 🛠️ Herramientas Utilizadas
- `ip addr show` - Inspección de interfaces de red, direcciones IP y máscaras de red.
- `ss -tulpn` - Auditoría de sockets TCP/UDP y procesos asociados en modo escucha.
- `sed` - Sanitización en pipeline de direcciones IP, MACs, nombres de interfaz y procesos.

## 📜 Automatización y Evidencias
- **Script:** `scripts/network_collector.sh` (Recolección y sanitización automatizada en pipeline).
- **Evidencia:** `evidence/network_info.txt` (Reporte sanitizado con direccionamiento de laboratorio `192.168.1.100`).
