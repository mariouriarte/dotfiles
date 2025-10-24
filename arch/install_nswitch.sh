$!/bin/bash

yay -S --noconfirm libusb \
    pyusb

mkdir -p ~/Games/switch
git clone git@github.com:lunixoid/dbibackend.git ~/Games/switch/dbibackend
