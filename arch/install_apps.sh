#!/bin/bash
echo "Install normal Apps"

#sudo pacman-mirrors --fasttrack
#sudo pacman -Syyu --noconfirm

# install common apps
sudo pacman -Sy --noconfirm vim \
    base-devel \
    samba \
    xclip unzip unrar keepassxc \
    thunderbird \
    vivaldi \
    kate \
    kwrite \
    vlc \
    spotify-launcher \
    gimp \
    apache \
    wget \
    git \
    gitg \
    filezilla \
    firefox \
    zsh \
    metronome \
    libreoffice \
    podman \
    podman-desktop \
    audacious \
    obsidian \
    system-config-printer \
    btop

sudo systemctl enable sshd.service
