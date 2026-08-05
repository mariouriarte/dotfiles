#!/bin/bash

set -euo pipefail

echo "Installing OpenCode CLI..."

if command -v opencode >/dev/null 2>&1; then
    echo "OpenCode CLI is already installed."
else
    echo "Installing OpenCode CLI from the official installer..."
    curl -fsSL https://opencode.ai/install | bash
fi

if command -v opencode >/dev/null 2>&1; then
    echo "OpenCode CLI is available."
else
    echo "OpenCode CLI was not found after installation. Check the installer output and PATH." >&2
    exit 1
fi

echo "No auth automation was run. If authentication is needed, run: opencode auth login"
