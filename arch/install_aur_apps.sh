#!/bin/bash

set -euo pipefail

echo "Starting AUR package installation..."

# Check if yay is installed
if ! command -v yay &>/dev/null; then
    echo "Error: 'yay' is not installed. Please install it first."
    exit 1
fi

# Define packages in an array for easier management
PACKAGES=(
    "brave-bin"
    "slack-desktop"
    "discord"
    "jdk11-openjdk"
    "jdk17-openjdk"
    "jdk21-openjdk"
    "jdk-openjdk"
    "google-chrome"
    "jdownloader2"
    "onedrive-abraunegg"
    "samsung-unified-driver-printer"
    "cups-pdf"
    "code"
    "dry-bin"
    "fastfetch" # neofetch is deprecated; fastfetch is the modern alternative
)

echo "Updating system and installing packages..."
yay -S --noconfirm --needed "${PACKAGES[@]}"

echo "Installation completed successfully!"
