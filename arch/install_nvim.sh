#!/bin/bash

sudo pacman -S --noconfirm neovim
sudo pacman -S --noconfirm fd
sudo pacman -S --noconfirm tree-sitter
sudo pacman -S --noconfirm tree-sitter-cli

yay -S --noconfirm tree-sitter-php
yay -S --noconfirm aur/nodejs-intelephense
# Nvim Lazy config --source "$(dirname "${BASH_SOURCE[0]}")/../nvim/install.sh" ${APP_ENV}
