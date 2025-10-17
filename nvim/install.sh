#!/bin/bash

#cp nvim/init.lua ~/.config/nvim
#cp -r nvim/lua/ ~/.config/nvim

#sudo npm install -g tree-sitter-cli

# requirte
rm -rf ~/.config/nvim
rm -rf ~/.local/share/nvim
rm -rf ~/.local/state/nvim
rm -rf ~/.cache/nvim

git clone https://github.com/LazyVim/starter ~/.config/nvim
rm -rf ~/.config/nvim/.git
