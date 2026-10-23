#!/usr/bin/env bash
set -euo pipefail

# ==============================================================================
# Script de Actualización y Mantenimiento de Nyxuri (Noctalia Shell)
# Mantiene aislado el ecosistema Nyxuri sin interferir con Clavis Desktop.
# ==============================================================================

SRC_DIR="${SRC_DIR:-/opt/src}"
NYXURI_DIR="$SRC_DIR/nyxuri"

BUILD_USER="${BUILD_USER:-$(stat -c %U "$SRC_DIR")}"
BUILD_HOME="$(getent passwd "$BUILD_USER" | cut -d: -f6)"

as_builder() {
    runuser -u "$BUILD_USER" -- env -i \
        HOME="$BUILD_HOME" USER="$BUILD_USER" LOGNAME="$BUILD_USER" \
        PATH=/usr/local/bin:/usr/bin:/bin \
        bash -c "$1"
}

echo "================================================================"
echo "  Actualizando Nyxuri Desktop (Noctalia Shell) desde el fork    "
echo "================================================================"

# 1. Actualizar repositorio fuente desde origin (rama personal)
if [ -d "$NYXURI_DIR" ]; then
    echo ">> [1/3] Actualizando repositorio fuente de Nyxuri..."
    as_builder "cd '$NYXURI_DIR' && git fetch origin && { git merge --ff-only '@{u}' || echo 'Advertencia: avance rápido no posible; se conserva versión local'; }"
    
    # Asegurar enlace global del launcher
    install -d /usr/local/bin
    ln -sf "$NYXURI_DIR/nyxuri/launcher.sh" /usr/local/bin/nyxuri
    chmod +x "$NYXURI_DIR/nyxuri/launcher.sh"
else
    echo "Error: $NYXURI_DIR no existe." >&2
    exit 1
fi

# 2. Desplegar sincronización de unidades en usuarios de Nyxuri
echo ">> [2/3] Aplicando sincronización en usuarios de Nyxuri..."
UNITS="niri noctalia kitty fastfetch fish starship theme wallpapers xdg-desktop-portal"
for u in nyxuri nyxuri-test; do
    if id "$u" &>/dev/null; then
        echo "   -> Sincronizando unidades para $u..."
        for unit in $UNITS; do
            sudo -u "$u" -H nyxuri on "$unit" >/dev/null 2>&1 || true
        done
        echo "      [✓] Unidades de $u actualizadas."
    fi
done

# 3. Actualizar paquetes del sistema
echo ">> [3/3] Verificando dependencias del sistema..."
pacman -Syu --needed --noconfirm

echo "================================================================"
echo "  Actualización de Nyxuri completada exitosamente.              "
echo "================================================================"
