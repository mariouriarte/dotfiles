#!/bin/bash

install_report_init() {
    if [[ -z "${INSTALL_REPORT_FILE:-}" ]]; then
        INSTALL_REPORT_FILE="$(mktemp)"
        export INSTALL_REPORT_FILE
        INSTALL_REPORT_OWNED=1
        trap 'rm -f "${INSTALL_REPORT_FILE:-}"' EXIT
    fi

    touch "$INSTALL_REPORT_FILE"
}

install_report_add() {
    local status="$1"
    local manager="$2"
    local package="$3"

    printf '%s|%s|%s\n' "$status" "$manager" "$package" >>"$INSTALL_REPORT_FILE"
}

install_report_print_status() {
    local status="$1"
    local title="$2"
    local count=0
    local record_status manager package

    echo "$title"

    while IFS='|' read -r record_status manager package; do
        if [[ "$record_status" == "$status" ]]; then
            echo "  - [$manager] $package"
            count=$((count + 1))
        fi
    done <"$INSTALL_REPORT_FILE"

    if [[ "$count" -eq 0 ]]; then
        echo "  - none"
    fi
}

install_report_print() {
    if [[ ! -s "$INSTALL_REPORT_FILE" ]]; then
        echo "No package installation attempts were recorded."
        return
    fi

    echo
    echo "Installation report"
    echo "==================="
    install_report_print_status installed "Installed:"
    install_report_print_status skipped "Already installed:"
    install_report_print_status failed "Failed or unavailable:"
}

install_pacman_package() {
    local package="$1"

    if pacman -Qi "$package" >/dev/null 2>&1; then
        echo "Skipping already installed pacman package: $package"
        install_report_add skipped pacman "$package"
    else
        echo "Installing pacman package: $package"
        if sudo pacman -S --needed --noconfirm "$package"; then
            install_report_add installed pacman "$package"
        else
            echo "Failed to install pacman package: $package"
            install_report_add failed pacman "$package"
        fi
    fi
}

install_pacman_packages() {
    local package

    for package in "$@"; do
        install_pacman_package "$package"
    done
}

install_yay_package() {
    local package="$1"

    if pacman -Qi "$package" >/dev/null 2>&1; then
        echo "Skipping already installed AUR package: $package"
        install_report_add skipped yay "$package"
    elif ! command -v yay >/dev/null 2>&1; then
        echo "Failed to install AUR package because yay is not available: $package"
        install_report_add failed yay "$package"
    else
        echo "Installing AUR package: $package"
        if yay -S --needed --noconfirm "$package"; then
            install_report_add installed yay "$package"
        else
            echo "Failed to install AUR package: $package"
            install_report_add failed yay "$package"
        fi
    fi
}

install_yay_packages() {
    local package

    for package in "$@"; do
        install_yay_package "$package"
    done
}
