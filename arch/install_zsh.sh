#!/bin/bash

sudo pacman -S zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# change in ~/.zshrc line ZSH_THEME="powerlevel10k/powerlevel10k"
# source ~/.zshrc
# p10k configure
