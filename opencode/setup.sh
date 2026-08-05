#!/bin/bash

if [[ "${BASH_SOURCE[0]}" == "$0" ]]; then
    set -euo pipefail
fi

echo "> Setup opencode"

TARGET_DIR="$HOME/.config/opencode"

if ! mkdir -p "$TARGET_DIR"; then
    echo "Could not create OpenCode config directory: $TARGET_DIR" >&2
    return 1 2>/dev/null || exit 1
fi

echo "OpenCode config directory is ready: $TARGET_DIR"
echo "Gentle AI should manage OpenCode agent configuration."
echo "Run 'gentle-ai install --agent opencode' after installing Gentle AI and OpenCode."
echo "OpenCode config changes require restarting opencode."
