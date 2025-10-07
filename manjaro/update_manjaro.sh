#!/bin/bash
echo "Update manjaro"

sudo pacman-mirrors --fasttrack
sudo pacman -Syyu --noconfirm

# yay -S aur/dropbox --noconfirm
# yay -S aur/dry-bin --noconfirm
yay -S aur/google-chrome --noconfirm
# yay -S aur/opera --noconfirm
# yay -S aur/zoom --noconfirm
# yay -S aur/winbox --noconfirm
# yay -S aur/slack-desktop --noconfirm
yay -S aur/postman-bin --noconfirm
yay -S aur/spotify --noconfirm
