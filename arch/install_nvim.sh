#!/bin/bash

sudo pacman -S --noconfirm nvim
sudo pacman -S --noconfirm fd

# required
rm ~/.config/nvim
rm ~/.local/share/nvim
rm ~/.local/state/nvim
rm ~/.cache/nvim

git clone https://github.com/LazyVim/starter ~/.config/nvim
rm -rf ~/.config/nvim/.git

# Nvim Lazy config
source "$(dirname "${BASH_SOURCE[0]}")/../nvim/install.sh" ${APP_ENV}
