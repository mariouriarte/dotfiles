#!/bin/bash

set -euo pipefail

echo "Installing Claude CLI..."

if command -v claude >/dev/null 2>&1; then
    echo "Claude CLI is already installed."
else
    echo "Installing Claude CLI from the official installer..."
    curl -fsSL https://claude.ai/install.sh | bash
fi

if command -v claude >/dev/null 2>&1; then
    echo "Claude CLI is available."
else
    echo "Claude CLI was not found after installation. Check the installer output and PATH." >&2
    exit 1
fi

echo "No auth automation was run. Authenticate manually if needed."
