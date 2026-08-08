# Cybersecurity Foundations Lab 🛡️

Toolkit de auditoría de seguridad para Linux.  
Desarrollado en Bash nativo para demostrar fundamentos de ciberseguridad defensiva (Blue Team / SOC).

> **No es un curso.** Es un conjunto de scripts que auditan, analizan y reportan el estado de seguridad de un servidor Linux.

---

## ⚡ Uso Rápido

```bash
git clone [https://github.com/eduar-q/cybersecurity-foundations-lab.git](https://github.com/eduar-q/cybersecurity-foundations-lab.git)
cd cybersecurity-foundations-lab

# Ejecutar un módulo
./01-*/scripts/*.sh

# Ver evidencias generadas
cat 01-*/evidence/*.txt
```

---

## 📁 Módulos

| # | Módulo | Qué revisa |
|---|--------|-----------|
| 01 | [linux-environment](./01-linux-environment) | Línea base del sistema |
| 02 | [network-analysis](./02-network-analysis) | Puertos abiertos, interfaces, conexiones |
| 03 | [users-and-permissions](./03-users-and-permissions) | Usuarios, sudo, SUID/SGID |
| 04 | [processes-and-services](./04-processes-and-services) | Procesos activos, servicios systemd |
| 05 | [logging-and-auditing](./05-logging-and-auditing) | Logs de autenticación, intentos fallidos |
| 06 | [ssh-security](./06-ssh-security) | Configuración SSH, claves autorizadas |
| 07 | [firewall-and-network-filtering](./07-firewall-and-network-filtering) | Estado de UFW/iptables |
| 08 | [system-hardening](./08-system-hardening) | Checklist de hardening básico |
| 09 | [persistence-review](./09-persistence-review) | Mecanismos de persistencia |
| 10 | [incident-investigation](./10-incident-investigation) | Reconstrucción de eventos |

---

## 🛠️ Requisitos

- Linux (Ubuntu, Debian, Mint, CentOS)
- Bash 4.0+
- `sudo` o root (para leer logs y configuraciones del sistema)

---

## 📜 Filosofía

- **Solo lectura:** Ningún script modifica el sistema.
- **Sin dependencias:** Solo Bash y comandos nativos de Linux.
- **OpSec:** Todos los reportes se sanitizan antes de guardarse.

---

## ⚠️ Disclaimer

Este proyecto es una herramienta de revisión informativa. No reemplaza un pentest ni garantiza seguridad total. Úsalo solo en sistemas que te pertenezcan.

---

## 📄 Licencia

MIT
