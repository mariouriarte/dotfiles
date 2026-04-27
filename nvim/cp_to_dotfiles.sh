#!/bin/bash

DOTFILES_NVIM="$HOME/dotfiles/nvim"

# Crear directorios de destino
mkdir -p "$DOTFILES_NVIM/lua/autocommands"
mkdir -p "$DOTFILES_NVIM/lua/config"
mkdir -p "$DOTFILES_NVIM/lua/plugins"

# copiar todo el contenido de las carpetas de aqui
cp -r lua/autocommands/* "$DOTFILES_NVIM/lua/autocommands/"
cp -r lua/config/* "$DOTFILES_NVIM/lua/config/"
cp -r lua/plugins/* "$DOTFILES_NVIM/lua/plugins/"

# y copiar init.lua
cp init.lua "$DOTFILES_NVIM/"

# por que hacer esto? no encontre la forma de enlazar las carpetas con ln -s, asi que tengo que copiar de un lado al otro y viserversa
# y copiar este archivo de aqui a alla
cp cp_to_dotfiles.sh "$DOTFILES_NVIM/"
