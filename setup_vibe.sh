#!/bin/bash

#mkdir -p /var/log/dotfiles

echo "$(date +'%Y-%m-%d %e:%M:%S') [INFO] Setup vibe Mario escrito" >>/tmp/setup_vibe.log
echo "$(date +'%Y-%m-%d %e:%M:%S') [INFO] git stdout:" >>/tmp/setup_vibe.log

cd $HOME/dotfiles
git pull origin main &>>/tmp/setup_vibe.log

echo "Setup Vibe Mario..."
source ./alacritty/setup.sh
source ./bash/setup.sh
source ./nvim/setup.sh
