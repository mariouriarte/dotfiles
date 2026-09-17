#!/bin/bash

set -euo pipefail

echo "Installing multimedia applications..."

PACKAGES=(
    vlc
    spotify-launcher
    gimp
    metronome
    audacious
    audacity
    hydrogen
    audiotube
    blanket
    haruna
    plasmatube
)

AUR_PACKAGES=(
    deezer
    deemix
    deemix-gui-git
)

sudo pacman -S --needed --noconfirm "${PACKAGES[@]}"

if command -v yay >/dev/null 2>&1; then
    yay -S --needed --noconfirm "${AUR_PACKAGES[@]}"
else
    echo "Skipping AUR multimedia packages because yay is not installed: ${AUR_PACKAGES[*]}"
fi

echo "Multimedia applications installed."
