#!/bin/bash
# Install fonts meslo

sudo apt install fontconfig
folder="${HOME}/.local/share/fonts"
mkdir -p $folder

sudo apt install fonts-noto-color-emoji

wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/Meslo.zip -P /tmp
unzip /tmp/Meslo.zip -d ${folder}
rm /tmp/Meslo.zip

wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/0xProto.zip -P /tmp
unzip /tmp/0xProto.zip -d ${folder}
rm /tmp/0xProto.zip

wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/3270.zip -P /tmp
unzip /tmp/3270.zip -d ${folder}
rm /tmp/3270.zip

font_name=Hack.zip
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/Hack.zip -P /tmp
unzip /tmp/$font_name -d ${folder}
rm /tmp/$font_name

fc-cache -fv
