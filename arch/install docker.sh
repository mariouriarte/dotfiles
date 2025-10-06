#!/bin/bash

sudo pacman -Sy --noconfirm docker \
    docker-compose

sudo systemctl enable docker.service
sudo systemctl start docker.service
sudo usermod -aG docker $USER
