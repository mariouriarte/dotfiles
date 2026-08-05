#!/bin/bash

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
DOTFILES_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"

install_prerequisites() {
    if command -v pacman >/dev/null 2>&1; then
        echo "Installing Gentle AI prerequisites for Arch/Manjaro..."
        sudo pacman -S --needed --noconfirm git curl nodejs npm go
    else
        echo "pacman not found; skipping OS prerequisite installation."
        echo "Ensure these dependencies are installed: git, curl, nodejs, npm, go."
    fi
}

install_gentle_ai() {
    echo "Installing Gentle AI from the official installer..."
    curl -fsSL https://raw.githubusercontent.com/Gentleman-Programming/gentle-ai/main/scripts/install.sh | bash
}

verify_gentle_ai() {
    if command -v gentle-ai >/dev/null 2>&1; then
        echo "Gentle AI is available."
        return 0
    fi

    echo "Gentle AI was not found after installation. Check the installer output and PATH." >&2
    echo "Common locations include '$HOME/.local/bin' and Go's GOPATH/bin." >&2
    return 1
}

install_or_upgrade_gentle_ai() {
    if command -v gentle-ai >/dev/null 2>&1; then
        if gentle-ai upgrade --help >/dev/null 2>&1; then
            echo "Gentle AI is already installed. Running 'gentle-ai upgrade'..."
            gentle-ai upgrade
        else
            echo "Gentle AI is already installed. No upgrade command detected; skipping reinstall."
        fi
    else
        install_gentle_ai
    fi
}

install_opencode_if_needed() {
    if command -v opencode >/dev/null 2>&1; then
        echo "OpenCode CLI is already installed."
        return 0
    fi

    if [ "${SKIP_OPENCODE_INSTALL:-0}" = "1" ]; then
        echo "OpenCode CLI is not installed. Skipping because SKIP_OPENCODE_INSTALL=1."
        echo "Gentle AI will refuse the opencode agent until 'opencode' is installed manually."
        return 0
    fi

    "$DOTFILES_DIR/opencode/install.sh"
}

install_claude_if_requested() {
    if [ "${INSTALL_CLAUDE_CLI:-0}" = "1" ]; then
        "$DOTFILES_DIR/claude/install.sh"
    else
        echo "Skipping Claude CLI. Set INSTALL_CLAUDE_CLI=1 only if you explicitly want it."
    fi
}

install_prerequisites
install_or_upgrade_gentle_ai
verify_gentle_ai
install_opencode_if_needed
install_claude_if_requested

echo "Gentle AI installation step complete."
echo "Next steps:"
echo "  1. Run 'gentle-ai install --agent opencode'."
echo "  2. Run 'gentle-ai doctor'."
echo "  3. In each project, run '/sdd-init' from OpenCode when needed."
echo "  4. Run 'gentle-ai skill-registry refresh' if skills changed or need reindexing."
echo "No uipro-cli installation was performed."
