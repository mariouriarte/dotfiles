#!/bin/bash

set -euo pipefail

echo "Installing development tools..."

PACKAGES=(
    nodejs
    npm
    go
)

NPM_GLOBAL_PACKAGES=(
    "@colbymchenry/codegraph"
    "uipro-cli"
)

sudo pacman -S --needed --noconfirm "${PACKAGES[@]}"

for package in "${NPM_GLOBAL_PACKAGES[@]}"; do
    if npm list -g --depth=0 "$package" >/dev/null 2>&1; then
        echo "Skipping already installed npm package: $package"
    else
        echo "Installing npm package: $package"
        sudo npm install -g "$package@latest"
    fi
done

echo "Development tools installed."
