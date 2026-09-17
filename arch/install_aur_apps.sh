#!/bin/bash

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# shellcheck source=arch/lib/install_report.sh
source "$SCRIPT_DIR/lib/install_report.sh"
install_report_init

echo "Starting AUR package installation..."

# Define packages in an array for easier management
PACKAGES=(
    "brave-bin"
    "slack-desktop"
    "discord"
    "google-chrome"
    "jdownloader2"
    "onedrive-abraunegg"
    "samsung-unified-driver-printer"
    "cups-pdf"
    "dry-bin"
    "fastfetch" # neofetch is deprecated; fastfetch is the modern alternative
    "nodejs-intelephense"
    "tree-sitter-php"
    "jaspersoftstudio"
    "jasperstarter"
)

install_yay_packages "${PACKAGES[@]}"

if [[ "${INSTALL_REPORT_OWNED:-0}" == "1" ]]; then
    install_report_print
fi

echo "Installation completed successfully!"
