#!/bin/bash

# Directorios de configuración
GHOSTTY_CONFIG_DIR="$HOME/.config/ghostty"
DOTFILES_DIR="$(pwd)"

echo "Configurando Ghostty..."
ln -sf "$DOTFILES_DIR/ghostty/config" "$GHOSTTY_CONFIG_DIR/config"
