#!/bin/bash
export STEAM_COMPAT_CLIENT_INSTALL_PATH="$HOME/.steam/steam"
export STEAM_COMPAT_DATA_PATH="$HOME/.local/share/proton-prefixes/$(basename "$1" .exe)"
mkdir -p "$STEAM_COMPAT_DATA_PATH"
"$HOME/.steam/root/compatibilitytools.d/Proton-CachyOS Latest/proton" run "$1"
