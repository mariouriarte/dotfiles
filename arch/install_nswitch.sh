#!/bin/bash
set -euo pipefail

DEPENDENCIES=(
    "libusb"
    "python-pyusb"
)
REPO_URL="git@github.com:lunixoid/dbibackend.git"
INSTALL_DIR="$HOME/Games/switch/dbibackend"

echo "Installing dependencies..."
yay -S --noconfirm "${DEPENDENCIES[@]}"

mkdir -p "$(dirname "$INSTALL_DIR")"

if [[ -d "$INSTALL_DIR" ]]; then
    echo "Updating existing repository in $INSTALL_DIR..."
    git -C "$INSTALL_DIR" pull
else
    echo "Cloning repository to $INSTALL_DIR..."
    git clone "$REPO_URL" "$INSTALL_DIR"
fi
