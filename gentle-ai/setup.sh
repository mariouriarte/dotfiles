#!/bin/bash

if [[ "${BASH_SOURCE[0]}" == "$0" ]]; then
    set -euo pipefail
fi

echo "> Setup Gentle AI"
echo "Gentle AI setup is guidance-only in dotfiles."
echo "From the dotfiles repo root, install with './gentle-ai/install.sh'."
echo "Recommended commands after installation:"
echo "  gentle-ai install --agent opencode"
echo "  gentle-ai doctor"
echo "  gentle-ai skill-registry refresh"
echo "Run project '/sdd-init' from OpenCode when needed."
