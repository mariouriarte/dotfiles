#!/bin/bash

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
DOTFILES_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"

# shellcheck source=arch/lib/install_report.sh
source "$SCRIPT_DIR/lib/install_report.sh"

require_arch() {
    if ! command -v pacman >/dev/null 2>&1; then
        echo "Error: pacman is required. This installer only supports Arch Linux."
        exit 1
    fi

    if [[ -r /etc/os-release ]]; then
        # shellcheck disable=SC1091
        source /etc/os-release
        if [[ "${ID:-}" != "arch" ]]; then
            echo "Error: this installer only supports Arch Linux."
            exit 1
        fi
    fi
}

install_yay_if_missing() {
    if command -v yay >/dev/null 2>&1; then
        install_report_add skipped yay yay
        return
    fi

    echo "Installing yay AUR helper..."

    local build_dir
    build_dir="$(mktemp -d)"
    trap 'rm -rf "$build_dir"; trap - RETURN' RETURN

    if git clone https://aur.archlinux.org/yay.git "$build_dir/yay" && (cd "$build_dir/yay" && makepkg -si --noconfirm); then
        install_report_add installed yay yay
    else
        install_report_add failed yay yay
        echo "Error: failed to install yay AUR helper."
        exit 1
    fi
}

run_script() {
    local script="$1"
    local path="$SCRIPT_DIR/$script"

    if [[ ! -f "$path" ]]; then
        echo "Skipping missing script: arch/$script"
        return
    fi

    echo "Running arch/$script..."
    bash "$path"
}

require_arch
install_report_init
trap 'rm -f "${INSTALL_REPORT_FILE:-}"' EXIT

run_script install_base.sh
install_yay_if_missing

run_script install_apps.sh
run_script install_databases.sh
run_script install_kde.sh
run_script install_multimedia.sh
run_script install_docker.sh
run_script install_dev_tools.sh
run_script install_mobile_dev.sh
run_script install_nvim.sh
run_script install_tmux.sh
run_script install_alacritty.sh
run_script install_zsh.sh
run_script install_aur_apps.sh
run_script install_gentle_ai.sh

echo "Applying dotfiles configuration..."
bash "$DOTFILES_DIR/setup_vibe.sh"

install_report_print

echo "Arch environment installation complete."
