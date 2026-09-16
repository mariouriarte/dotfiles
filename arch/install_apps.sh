#!/bin/bash

set -euo pipefail

echo "Installing system applications..."

PACKAGES=(
    vim
    samba
    xclip
    xsel
    keepassxc
    thunderbird
    vivaldi
    apache
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
    git-delta
    ghostty
    ttf-jetbrains-mono-nerd
    ttf-meslo-nerd
    tmux
    atuin
    zoxide
)

sudo pacman -S --needed --noconfirm "${PACKAGES[@]}"

echo "Installation complete."
