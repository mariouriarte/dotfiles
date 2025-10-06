#!/bin/bash
echo "Install normal Apps"

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
    firefox \
    zsh \
    metronome \
    libreoffice \
    podman \
    audacious \
    obsidian \
    system-config-printer

sudo systemctl enable docker.service
sudo systemctl start docker.service
sudo usermod -aG docker $USER

sudo systemctl enable sshd.service



# confi
# echo "> Set configurations..."
# echo ""
# sudo systemctl start docker.service
# sudo systemctl enable docker.service
