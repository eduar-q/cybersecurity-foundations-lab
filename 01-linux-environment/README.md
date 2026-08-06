# Módulo 01: Entorno Linux y Línea Base (Baseline)

## 🎯 Objetivo
Identificar y documentar la línea base del sistema operativo, el kernel y la arquitectura del hardware para establecer un punto de referencia técnico antes de realizar auditorías o configuraciones de seguridad.

## 🛠️ Herramientas Utilizadas
- `cat /etc/os-release` - Identificación de la distribución y versión del sistema operativo.
- `uname -r` - Consulta de la versión exacta del kernel en ejecución.
- `uname -m` - Identificación de la arquitectura del procesador.

## 📜 Automatización y Evidencias
- **Script:** `scripts/baseline_collector.sh` (Automatiza la lectura de la línea base y exporta el reporte).
- **Evidencia:** `evidence/system_info.txt` (Reporte generado de la línea base).
