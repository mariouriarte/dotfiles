#!/bin/bash
# Install fonts meslo

#sudo apt install fontconfig
#mkdir -p $HOME/.local/share/fonts
#
#sudo apt install fonts-noto-color-emoji
#
#wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/Meslo.zip -P /tmp
#unzip /tmp/Meslo.zip -d $HOME/.local/share/fonts
#rm /tmp/Meslo.zip
#
#wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/0xProto.zip -P /tmp
#unzip /tmp/0xProto.zip -d $HOME/.local/share/fonts
#rm /tmp/0xProto.zip

wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/3270.zip -P /tmp
unzip /tmp/3270.zip -d $HOME/.local/share/fonts
rm /tmp/3270.zip

#wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf -P $HOME/.local/share/fonts
#wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold.ttf -P $HOME/.local/share/fonts
#wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Italic.ttf -P $HOME/.local/share/fonts
#wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold%20Italic.ttf -P $HOME/.local/share/fonts

fc-cache -fv
