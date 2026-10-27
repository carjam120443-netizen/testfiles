#!/usr/bin/env bash
set -Eeuo pipefail

# Install Git and configure the Kitty Floraverse theme on Debian/Ubuntu.
# Run with: bash testinstall.sh

if [[ "${EUID}" -eq 0 ]]; then
    SUDO=()
elif command -v sudo >/dev/null 2>&1; then
    SUDO=(sudo)
else
    echo "Error: this script needs root privileges (run as root or install sudo)." >&2
    exit 1
fi

if [[ ! -r /etc/os-release ]]; then
    echo "Error: cannot identify this Linux distribution." >&2
    exit 1
fi

# shellcheck disable=SC1091
source /etc/os-release
if [[ "${ID:-}" != "debian" && "${ID:-}" != "ubuntu" && " ${ID_LIKE:-} " != *" debian "* ]]; then
    echo "Error: this installer currently supports Debian/Ubuntu-based systems only." >&2
    exit 1
fi

if ! command -v apt-get >/dev/null 2>&1; then
    echo "Error: apt-get was not found; this script is for Debian/Ubuntu-based systems." >&2
    exit 1
fi

echo "--- Updating package lists ---"
"${SUDO[@]}" apt-get update

echo "--- Installing Git ---"
"${SUDO[@]}" apt-get install -y git

echo "--- System Info ---"
uname -a
if command -v hostnamectl >/dev/null 2>&1; then
    hostnamectl
else
    echo "hostnamectl is unavailable; skipping."
fi

KITTY_CONFIG="${XDG_CONFIG_HOME:-$HOME/.config}/kitty"
THEMES_DIR="$KITTY_CONFIG/kitty-themes"
THEME_FILE="$KITTY_CONFIG/theme.conf"
THEME_SOURCE="$THEMES_DIR/themes/Floraverse.conf"

mkdir -p "$KITTY_CONFIG"

if [[ -d "$THEMES_DIR/.git" ]]; then
    echo "--- Updating existing Kitty themes checkout ---"
    git -C "$THEMES_DIR" pull --ff-only
elif [[ -e "$THEMES_DIR" ]]; then
    echo "Error: $THEMES_DIR already exists but is not a Git checkout." >&2
    echo "Move or rename that directory, then run this script again." >&2
    exit 1
else
    echo "--- Downloading Kitty themes ---"
    git clone --depth 1 https://github.com/dexpota/kitty-themes.git "$THEMES_DIR"
fi

if [[ ! -f "$THEME_SOURCE" ]]; then
    echo "Error: expected theme file was not found: $THEME_SOURCE" >&2
    exit 1
fi

# Replace an existing symlink safely; preserve a real theme.conf file.
if [[ -L "$THEME_FILE" ]]; then
    rm -- "$THEME_FILE"
elif [[ -e "$THEME_FILE" ]]; then
    echo "Error: $THEME_FILE already exists as a regular file." >&2
    echo "Back it up or move it aside, then rerun to avoid overwriting your config." >&2
    exit 1
fi

ln -s "$THEME_SOURCE" "$THEME_FILE"

echo
echo "Done! Kitty's Floraverse theme is linked at:"
echo "  $THEME_FILE"
echo "If Kitty is already open, reload its config or restart Kitty."
