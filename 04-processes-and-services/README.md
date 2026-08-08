# Módulo 04: Análisis de Procesos y Servicios

## 🎯 Objetivo
Auditar la actividad de procesos en tiempo real, identificar el consumo de recursos de CPU y memoria, y listar los servicios activos en el sistema para detectar comportamientos anómalos o procesos no autorizados en segundo plano.

## 🛠️ Herramientas Utilizadas
- `ps aux --sort=-%cpu` - Inspección y ordenamiento de procesos activos por uso de CPU.
- `systemctl list-units --type=service` - Verificación de servicios e hilos del sistema en ejecución.
- `awk` / `sed` - Sanitización al vuelo de usuarios, hostnames y carpetas personales (`/home/analyst`).

## 📜 Automatización y Evidencias
- **Script:** `scripts/process_collector.sh` (Recolección automatizada con filtrado directo en *pipeline*).
- **Evidencia:** `evidence/process_info.txt` (Reporte sanitizado con timestamp UTC).
