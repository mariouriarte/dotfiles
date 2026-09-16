#!/bin/bash

set -euo pipefail

echo "Installing KDE desktop basics..."

PACKAGES=(
    plasma-meta
    kde-system-meta
    kde-utilities-meta
    kde-graphics-meta
)

sudo pacman -S --needed --noconfirm "${PACKAGES[@]}"

echo "KDE desktop basics installed."
