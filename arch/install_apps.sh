#!/bin/bash

# Salir si ocurre un error
set -e

echo "Installing system applications..."

# Array de paquetes para facilitar el mantenimiento
PACKAGES=(
    base-devel
    vim
    samba
    xclip
    xsel
    unzip
    unrar
    keepassxc
    thunderbird
    vivaldi
    kate
    kwrite
    apache
    wget
    git
    gitg
    filezilla
    firefox
    libreoffice
    podman
    podman-desktop
    obsidian
    system-config-printer
    btop
    lazygit
    openssh
    git-delta
)

# Actualizar base de datos e instalar paquetes
sudo pacman -S --needed --noconfirm "${PACKAGES[@]}"

# Configuración de servicios
echo "Enabling services..."
sudo systemctl enable --now sshd.service

echo "Installation complete."
