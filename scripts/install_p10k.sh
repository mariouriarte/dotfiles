#!/bin/bash
yay -S --noconfirm zsh-theme-powerlevel10k-git
sh -c “$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
cp /home/$USER/dotfiles/conf/.zshrc ~
cp /home/$USER/dotfiles/conf/.p10k.zsh ~
