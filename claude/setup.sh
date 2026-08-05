#!/bin/bash

if [[ "${BASH_SOURCE[0]}" == "$0" ]]; then
    set -euo pipefail
fi

echo "> Setup Claude CLI"
echo "No dotfiles-managed Claude configuration is required right now."
echo "From the dotfiles repo root, install explicitly with './claude/install.sh'."
echo "Or run INSTALL_CLAUDE_CLI=1 './gentle-ai/install.sh' from the dotfiles repo root."
echo "No auth automation is performed. Authenticate manually if needed."
