#!/bin/bash
echo "Install manjaro Apps"

#sudo pacman-mirrors --fasttrack
#sudo pacman -Syyu --noconfirm

# install common apps
sudo pacman -Sy --noconfirm vim \
    base-devel \
    samba \
    xclip unzip unrar\
    keepassxc \
    thunderbird \
    vivaldi \
    brave-browser \
    kate \
    kwrite \
    vlc \
    spotify-launcher \
    gimp \
    docker \
    docker-compose \
    apache \
    wget \
    neovim \
    git \
    gitg \
    filezilla \
    firefox

# yay -S --noconfirm ttf-ms-win10-auto
yay -S --noconfirm \
    jaspersoftstudio \
    mailspring \
    slack-desktop \
    discord \
    jdk11-openjdk \
    jdk17-openjdk \
    latte-dock-git \
    google-chrome \
    phpstorm \
    bedstead-fonts-powerline \
    extra/intellij-idea-community-edition

# confi
# echo "> Set configurations..."
# echo ""
# sudo systemctl start docker.service
# sudo systemctl enable docker.service
