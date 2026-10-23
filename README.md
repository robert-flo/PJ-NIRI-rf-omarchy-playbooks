# 🌌 Niri + Clavis Desktop Playbook (Obsidian Vault & Public Guide)

[![Obsidian](https://img.shields.io/badge/Obsidian-Ready-483699?logo=obsidian&logoColor=white)](https://obsidian.md)
[![Linux](https://img.shields.io/badge/Linux-Arch%20%7C%20Omarchy-1793D1?logo=arch-linux&logoColor=white)](https://archlinux.org)
[![Wayland](https://img.shields.io/badge/Display-Wayland%20(Niri)-FFA500)](https://github.com/YaLTeR/niri)
[![Shell](https://img.shields.io/badge/Shell-Quickshell%20(Clavis)-68217A)](https://github.com/outfoxxed/quickshell)

Guía completa, modular y ejecutable para construir, personalizar y mantener un entorno de escritorio moderno en **Arch Linux / Omarchy** combinando:
- **`niri-edge`**: Compositor Wayland de mosaico continuo desplazable (*scrollable tiling*) con minimización nativa.
- **`Clavis Shell`**: Suite de escritorio basada en Quickshell y C++ con estética translúcida *Liquid Glass* / macOS.
- **`MacTahoe`**: Conjunto de iconos, cursor y temas GTK 3/4.
- **`dotbare`**: Gestión de dotfiles profesional directamente sobre `$HOME`.

---

## 📖 Cómo Consumir este Playbook

Este repositorio está formateado como una bóveda (*vault*) nativa de **Obsidian**:
1. Abre **Obsidian**.
2. Selecciona **Open folder as vault** (Abrir carpeta como bóveda).
3. Selecciona la carpeta `niri-omarchy-playbooks`.
4. Abre la nota principal: **`00 - Indice General (MOC).md`**.

Disfrutarás de navegación por enlaces bidireccionales (`[[wikilinks]]`), diagramas interactivos de Mermaid, etiquetas (*tags*), bloques de alerta (*callouts*) y reproductor embebido de video para las demostraciones.

---

## 🗺️ Estructura del Repositorio

```text
niri-omarchy-playbooks/
├── 00 - Indice General (MOC).md                       # 🗺️ Mapa de Contenidos interactivo con Mermaid
├── README.md                                          # 📖 Guía de bienvenida para Obsidian y GitHub
├── AGENTS.md                                          # 🤖 Reglas para agentes (git, forks, StatIndet)
├── 01 - Instalacion Base y Sistema/                   # ⚙️ Módulo 1: Base, compilación y usuarios
│   ├── 01.0 - Sudo sin Contrasena (Passwordless Sudo).md
│   ├── 01.1 - Paso 1 - Instalacion de niri-edge y key-cli.md
│   ├── 01.2 - Paso 2 - Creacion de Usuario y Login SDDM.md
│   ├── 01.3 - Paso 3 - Clavis Shell y Actualizaciones.md
│   └── 01.4 - Sesion Herald OS en SDDM.md
├── 02 - Personalizacion y Apariencia/                 # 🎨 Módulo 2: Temas, estilos y aplicaciones
│   ├── 02.1 - MacTahoe Iconos, Cursor y Wallpapers.md
│   ├── 02.2 - Replicacion de Aplicaciones y Entorno Clavis.md
│   ├── 02.3 - Tipografias y Fuentes del Sistema.md
│   ├── 02.4 - Referencias de Temas, Wallpapers y Recursos.md
│   └── 02.5 - Entorno Modular Nyxuri (Noctalia Shell).md
├── 03 - Gestion de Dotfiles y Mantenimiento/          # 📦 Módulo 3: Versionado, pruebas y snapshots
│   ├── 03.1 - Dotfiles con dotbare.md
│   ├── 03.2 - Validacion en Usuario Limpio (Testbench).md
│   ├── 03.3 - Snapshots de Home con Btrfs.md
│   └── 03.4 - Dotfiles de Omarchy para gracie (Planificado).md
├── 04 - Troubleshooting y Hardware/                   # 🔧 Módulo 4: Solución de problemas
│   └── 04.1 - Fix Parpadeo Intel i915 (FIFO Underrun & SAGV).md
├── 05 - Referencias y Atajos/                         # ⌨️ Módulo 5: Atajos, fuentes y multimedia
│   ├── 05.1 - Mapa Completo de Atajos de Teclado (Niri y Clavis).md
│   ├── 05.2 - Repositorios Upstream y Fuentes Externas.md
│   ├── 05.3 - Guia de Descarga e Integracion de Video (Showcase).md
│   └── 05.4 - Archivos de Sistema de Referencia.md
└── assets/                                            # 🎬 Videos integrados y archivos de sistema
    ├── system/                                        # Copias exactas de /etc y /usr/local (ver 05.4)
    ├── m2-res_1080p.mp4
    └── niri_showcase_unixporn_720p.mp4
```

---

## ⚡ Parámetros Configurables

Todos los scripts incluidos son **completamente funcionales, reproducibles e idempotentes**. Puedes adaptarlos a tu máquina mediante variables de entorno:

| Variable | Valor por Defecto | Descripción |
|---|---|---|
| `TARGET_USER` | `niri` | Nombre de la cuenta de usuario dedicada para el entorno. |
| `BUILD_DIR` | `/opt/src` | Directorio donde se compilan las fuentes upstream (propiedad del usuario administrador). |
| `SRC_DIR` | `/opt/src` | Ubicación permanente de fuentes para scripts de actualización diaria (el mismo directorio que `BUILD_DIR`). |

---

## 🎬 Demostración Visual

Las demostraciones completas en video se encuentran integradas en la carpeta `assets/` y pueden visualizarse directamente en Obsidian o en GitHub:
- `assets/niri_showcase_unixporn_720p.mp4` (Showcase original del autor)
- `assets/m2-res_1080p.mp4` (Showcase detallado a 1080p)

---

## 📜 Créditos y Licencias

- **Inspiración original:** [StatIndet](https://github.com/StatIndet) por la creación de Clavis, key-cli y sus modificaciones de Niri y temas.
- **Temas e Iconografía:** [Vince Liuice](https://github.com/vinceliuice) por la suite MacTahoe.
- **Proyectos Base:** [YaLTeR/niri](https://github.com/YaLTeR/niri), [outfoxxed/quickshell](https://github.com/outfoxxed/quickshell), [InioX/matugen](https://github.com/InioX/matugen), [kazhala/dotbare](https://github.com/kazhala/dotbare).
