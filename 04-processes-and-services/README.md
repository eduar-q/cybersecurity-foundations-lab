# Módulo 04: Análisis de Procesos y Servicios

## 🎯 Objetivo
Auditar la actividad de procesos en tiempo real, identificar el consumo de recursos de CPU y memoria, y listar los servicios activos en el sistema para detectar comportamientos anómalos o ejecuciones no autorizadas en segundo plano.

## 🛠️ Herramientas Utilizadas
- `ps aux --sort=-%cpu` - Inspección y ordenamiento de procesos activos por uso de CPU.
- `systemctl list-units --type=service` - Verificación de servicios e hilos del sistema en ejecución.
- `awk` - Formateo de salida en tabla limpia (`printf`), sanitización de usuarios y truncamiento de argumentos/rutas largas para evitar ruido visual.
- `sed` - Sanitización en *pipeline* de hostnames (con escape de caracteres) y rutas del sistema.

## 📜 Automatización y Evidencias
- **Script:** `scripts/process_collector.sh` (Recolección automatizada, formateo tabular y sanitización directa en *pipeline*).
- **Evidencia:** `evidence/process_info.txt` (Reporte ordenado y anonimizado con timestamp UTC).
