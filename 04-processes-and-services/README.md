# Módulo 04: Análisis de Procesos y Servicios

## 🎯 Objetivo
Auditar la actividad de procesos en tiempo real, identificar el consumo de recursos de CPU y memoria, y listar los servicios activos en el sistema para detectar comportamientos anómalos o ejecuciones no autorizadas en segundo plano.

## 🛠️ Herramientas Utilizadas
- `ps aux --sort=-%cpu` - Inspección y ordenamiento de procesos activos por uso de CPU.
- `systemctl list-units --type=service` - Verificación de servicios activos en segundo plano.
- `awk` - Filtrado de los top 10 procesos, anonimización precisa de la cuenta personal (`${SUDO_USER:-$(whoami)}`) y truncamiento de rutas/argumentos de ejecutables.
- `sed` - Sanitización en *pipeline* para enmascarar rutas personales dentro de `/home`.

## 📜 Automatización y Evidencias
- **Script:** `scripts/process_collector.sh` (Recolección automatizada, filtrado limpio y sanitización en *pipeline*).
- **Evidencia:** `evidence/process_info.txt` (Reporte ordenado y anonimizado en formato UTC).
