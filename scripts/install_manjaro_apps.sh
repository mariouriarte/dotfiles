#!/bin/bash
echo "Install manjaro Apps"

sudo pacman-mirrors --fasttrack
sudo pacman -Syyu --noconfirm

# install common apps
sudo pacman -S --noconfirm \
    yay \
    samba \
    xclip unzip unrar\
    keepassxc \
    thunderbird \
    libreoffice \
    vivaldi \
    opera \
    brave-browser \
    kate \
    krite \
    vlc \
    zsh \
    spotify-launcher \

# install dev apps
sudo pacman -S --noconfirm \
    gimp \
    visual-studio-code-bin \
    docker docker-compose \
    apache \
    wget \
    vim neovim \
    git gitg\
    base-devel \
    community/intellij-idea-community-edition \
    filezilla \
    aur/dry-bin \


yay -S --noconfirm ttf-ms-win10-auto
yay -S --noconfirm \
    aur/jaspersoftstudio \
    aur/mailspring \
    aur/slack-desktop \
    community/discord \
    jdk11-openjdk \
    jdk17-openjdk \
    latte-dock-git \
    google-chrome \
    aur/phpstorm \
    multilib/steam-native-runtime \
    aur/bedstead-fonts-powerline

# confi
# echo "> Set configurations..."
# echo ""
# sudo systemctl start docker.service
# sudo systemctl enable docker.service
