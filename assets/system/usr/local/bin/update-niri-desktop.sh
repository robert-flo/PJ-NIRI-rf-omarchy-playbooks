#!/usr/bin/env bash
set -euo pipefail

# Directorio donde se encuentran los repositorios clonados.
# Cada repo sigue la rama `personal` de su fork (origin); StatIndet es `upstream`, solo lectura.
SRC_DIR="${SRC_DIR:-/opt/src}"

# Compilar como el dueño de las fuentes; root solo instala.
BUILD_USER="${BUILD_USER:-$(stat -c %U "$SRC_DIR")}"
BUILD_HOME="$(getent passwd "$BUILD_USER" | cut -d: -f6)"

as_builder() {
    runuser -u "$BUILD_USER" -- env -i \
        HOME="$BUILD_HOME" USER="$BUILD_USER" LOGNAME="$BUILD_USER" \
        PATH=/usr/local/bin:/usr/bin:/bin \
        CARGO_NET_GIT_FETCH_WITH_CLI=true \
        bash -c "$1"
}

echo "================================================================"
echo "  Actualizando Niri Desktop desde los forks (rama personal)       "
echo "================================================================"

# 1. Actualizar niri-edge
if [ -d "$SRC_DIR/niri-edge" ]; then
    echo ">> [1/4] Actualizando niri-edge..."
    as_builder "cd '$SRC_DIR/niri-edge' && git fetch origin && { git merge --ff-only '@{u}' || echo 'Advertencia: avance rápido no posible; se compila la versión local'; } && cargo build --release"
    install -Dm755 "$SRC_DIR/niri-edge/target/release/niri" /usr/local/bin/niri
fi

# 2. Actualizar key-cli
if [ -d "$SRC_DIR/key-cli" ]; then
    echo ">> [2/4] Actualizando key-cli..."
    as_builder "cd '$SRC_DIR/key-cli' && git fetch origin && { git merge --ff-only '@{u}' || echo 'Advertencia: avance rápido no posible; se compila la versión local'; } && /usr/bin/python3 scripts/installer.py"
    setcap 'cap_dac_read_search=ep' /usr/local/libexec/key-cli/key-cpu-power
fi

# 3. Actualizar quickshell (Clavis Shell)
if [ -d "$SRC_DIR/quickshell" ]; then
    echo ">> [3/4] Actualizando Clavis Shell..."
    as_builder "cd '$SRC_DIR/quickshell' && git fetch origin && { git merge --ff-only '@{u}' || echo 'Advertencia: avance rápido no posible; se compila la versión local'; } \
        && { /usr/bin/python3 scripts/release.py bundle-resources --cache /tmp/clavis-cache || true; } \
        && cmake -S . -B build -G Ninja \
            -DCMAKE_BUILD_TYPE=Release \
            -DBUILD_TESTING=OFF \
            -DCMAKE_INSTALL_PREFIX=/usr \
            -DCMAKE_INSTALL_LIBDIR=lib \
            -DCLAVIS_CONFIG_INSTALL_DIR=/etc/xdg/quickshell/clavis \
            -DPython3_EXECUTABLE=/usr/bin/python3 \
        && cmake --build build"
    cmake --install "$SRC_DIR/quickshell/build"
fi

# 4. Actualizar paquetes del sistema
echo ">> [4/4] Verificando paquetes del sistema..."
pacman -Syu --needed --noconfirm

echo "================================================================"
echo "  Actualización completada exitosamente.                        "
echo "================================================================"
