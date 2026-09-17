#!/bin/bash

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# shellcheck source=arch/lib/install_report.sh
source "$SCRIPT_DIR/lib/install_report.sh"
install_report_init

echo "Installing database tools..."

PACKAGES=(
    dbeaver
    postgresql
)

AUR_PACKAGES=(
    beekeeper-studio-bin
    dbvis
)

install_pacman_packages "${PACKAGES[@]}"
install_yay_packages "${AUR_PACKAGES[@]}"

if [[ "${INSTALL_REPORT_OWNED:-0}" == "1" ]]; then
    install_report_print
fi

echo "Database tools installed."
