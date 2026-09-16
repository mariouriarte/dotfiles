#!/bin/bash

set -euo pipefail

sudo pacman -S --needed --noconfirm docker docker-compose

sudo systemctl enable --now docker.service
sudo usermod -aG docker "$USER"
