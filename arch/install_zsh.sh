#!/bin/bash

set -euo pipefail

sudo pacman -S --needed --noconfirm zsh

if [[ ! -d "$HOME/.oh-my-zsh" ]]; then
    RUNZSH=no CHSH=no KEEP_ZSHRC=yes sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
else
    echo "Oh My Zsh already installed, skipping."
fi

ZSH_CUSTOM_DIR="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}"
P10K_DIR="$ZSH_CUSTOM_DIR/themes/powerlevel10k"

mkdir -p "$(dirname "$P10K_DIR")"

if [[ -d "$P10K_DIR/.git" ]]; then
    git -C "$P10K_DIR" pull --ff-only
elif [[ -d "$P10K_DIR" ]]; then
    echo "Powerlevel10k directory already exists without git metadata, skipping update: $P10K_DIR"
else
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "$P10K_DIR"
fi

if [[ ! -f "$HOME/.zshrc" && -f "$HOME/.oh-my-zsh/templates/zshrc.zsh-template" ]]; then
    cp "$HOME/.oh-my-zsh/templates/zshrc.zsh-template" "$HOME/.zshrc"
fi

if [[ -f "$HOME/.zshrc" ]] && grep -q '^ZSH_THEME=' "$HOME/.zshrc"; then
    perl -0pi -e 's/^ZSH_THEME=.*/ZSH_THEME="powerlevel10k\/powerlevel10k"/m' "$HOME/.zshrc"
else
    printf '\nZSH_THEME="powerlevel10k/powerlevel10k"\n' >>"$HOME/.zshrc"
fi

ZSH_PATH="$(command -v zsh)"
TARGET_USER="${SUDO_USER:-$USER}"
CURRENT_SHELL="$(getent passwd "$TARGET_USER" | cut -d: -f7)"

if [[ "$CURRENT_SHELL" == "$ZSH_PATH" ]]; then
    echo "Default shell is already zsh for $TARGET_USER."
elif [[ -t 0 ]]; then
    sudo chsh -s "$ZSH_PATH" "$TARGET_USER" || echo "Warning: could not change default shell to zsh. Run: chsh -s $ZSH_PATH"
else
    echo "Skipping default shell change in non-interactive mode. Run: chsh -s $ZSH_PATH"
fi
