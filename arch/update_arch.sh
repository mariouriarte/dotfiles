#!/bin/bash
echo "> Update Arch Linux..."

sudo pacman -Syyu --noconfirm

yay -S aur/google-chrome --noconfirm
yay -S aur/postman-bin --noconfirm
yay -S aur/spotify --noconfirm
yay -S aur/brave-bin --noconfirm
