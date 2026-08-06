# Cybersecurity Foundations Lab 🛡️

Laboratorio práctico de fundamentos de Linux, administración de sistemas y ciberseguridad defensiva (Blue Team / SOC), desarrollado en un entorno real de Linux Mint.

## 🎯 Objetivo del Portafolio
Demostrar competencias técnicas sólidas y metódicas en la gestión segura de sistemas operativos, análisis de redes, auditoría de permisos, gestión de procesos, análisis de logs y endurecimiento (*hardening*) de infraestructura para roles junior como **SOC Analyst**, **Blue Team** o **Administrador de Sistemas Linux**.

## 🗺️ Estructura del Laboratorio y Módulos

El proyecto sigue una progresión lógica de administración y defensa:

1. **[01-linux-environment/](./01-linux-environment)** - Entorno Linux y Línea Base del sistema.
2. **[02-network-analysis/](./02-network-analysis)** - Análisis de redes, interfaces, rutas y sockets.
3. **[03-users-and-permissions/](./03-users-and-permissions)** - Gestión de usuarios, grupos y permisos avanzados (`sudo`, `SUID/SGID`).
4. **[04-processes-and-services/](./04-processes-and-services)** - Monitoreo de procesos y control de servicios con `systemd`.
5. **[05-logging-and-auditing/](./05-logging-and-auditing)** - Auditoría y análisis de registros del sistema (`syslog`, `auth.log`).
6. **[06-ssh-security/](./06-ssh-security)** - Configuración segura y endurecimiento del servicio SSH.
7. **[07-firewall-and-network-filtering/](./07-firewall-and-network-filtering)** - Filtrado de tráfico con `UFW` y reglas de red.
8. **[08-system-hardening/](./08-system-hardening)** - Buenas prácticas de endurecimiento de sistemas operativos.
9. **[09-persistence-review/](./09-persistence-review)** - Auditoría de mecanismos de persistencia en Linux.
10. **[10-incident-investigation/](./10-incident-investigation)** - Análisis básico de incidentes y reconstrucción de eventos.

## 💻 Entornos y Herramientas
- **Sistema Operativo:** Linux Mint
- **Herramientas Nativas:** `systemctl`, `ss`, `ip`, `ufw`, `journalctl`, `tcpdump`, `auditd`
- **Control de Versiones:** Git / GitHub
