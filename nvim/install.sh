#!/bin/bash

# requirte
rm -rf ~/.config/nvim
rm -rf ~/.local/share/nvim
rm -rf ~/.local/state/nvim
rm -rf ~/.cache/nvim

# Check if git is installed
if ! command -v git &>/dev/null; then
    echo "Error: git is not installed. Please install git to proceed."
    exit 1
fi

git clone https://github.com/LazyVim/starter ~/.config/nvim
rm -rf ~/.config/nvim/.git
