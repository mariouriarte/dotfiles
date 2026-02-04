#!/bin/bash
echo "Install normal Apps"

#sudo pacman-mirrors --fasttrack
#sudo pacman -Syyu --noconfirm

# install common apps
sudo pacman -Sy --noconfirm \
    vim \
    base-devel \
    samba \
    xclip \
    unzip \
    unrar \
    keepassxc \
    thunderbird \
    vivaldi \
    kate \
    kwrite \
    apache \
    wget \
    git \
    gitg \
    filezilla \
    firefox \
    libreoffice \
    podman \
    podman-desktop \
    obsidian \
    system-config-printer \
    btop \
    lazygit

sudo systemctl enable sshd.service
