#!/bin/bash

set -euo pipefail

echo "Installing base bootstrap packages..."

PACKAGES=(
    base-devel
    git
    curl
    wget
    unzip
    unrar
    openssh
    sudo
)

sudo pacman -S --needed --noconfirm "${PACKAGES[@]}"

echo "Enabling base services..."
sudo systemctl enable --now sshd.service

echo "Base bootstrap packages installed."
