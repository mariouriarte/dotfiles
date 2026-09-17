#!/bin/bash

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# shellcheck source=arch/lib/install_report.sh
source "$SCRIPT_DIR/lib/install_report.sh"
install_report_init

echo "Installing development tools..."

PACKAGES=(
    nodejs
    npm
    go
    maven
    php
    composer
    phpactor
    php-cs-fixer
    python
    python-pip
    python-pipx
    python-virtualenv
    rustup
    jdk-openjdk
    jdk17-openjdk
    jdk11-openjdk
    jdk21-openjdk
)

NPM_GLOBAL_PACKAGES=(
    "@colbymchenry/codegraph"
    "uipro-cli"
)

install_pacman_packages "${PACKAGES[@]}"

for package in "${NPM_GLOBAL_PACKAGES[@]}"; do
    if npm list -g --depth=0 "$package" >/dev/null 2>&1; then
        echo "Skipping already installed npm package: $package"
        install_report_add skipped npm "$package"
    else
        echo "Installing npm package: $package"
        if sudo npm install -g "$package@latest"; then
            install_report_add installed npm "$package"
        else
            echo "Failed to install npm package: $package"
            install_report_add failed npm "$package"
        fi
    fi
done

if [[ "${INSTALL_REPORT_OWNED:-0}" == "1" ]]; then
    install_report_print
fi

echo "Development tools installed."
