#!/bin/bash

# TODO completar proceso de instalacion y configuracion
sudo pacman -S --noconfirm \
    zsh

yay -S --noconfirm zsh-theme-powerlevel10k-git

sh -c “$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

