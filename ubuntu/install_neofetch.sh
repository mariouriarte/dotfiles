#!/bin/bash

sudo add-apt-repository -y ppa:zhangsongcui3371/fastfetch
sudo apt update
sudo apt install -y fastfetch

sudo ln -s /usr/bin/fastfetch /usr/bin/neofetch
