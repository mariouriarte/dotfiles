#!/bin/bash

sudo apt update -y

# ----------------------------------------------------
# Sección Utilidades del sistema y desarrollo
# ----------------------------------------------------
echo "Instalando utilidades del sistema y de desarrollo..."
sudo apt install -y \
    build-essential \
    npm \
    vim \
    curl \
    git \
    gnome-tweaks \
    htop \
    neofetch \
    net-tools \
    unrar \
    wget \
    nodejs \
    gcc \
    npm \
    eza

# ----------------------------------------------------
# Sección Instalación de Alacritty
# ----------------------------------------------------
echo "Instalando el emulador de terminal Alacritty..."
echo "Añadiendo el repositorio PPA para Alacritty..."
sudo add-apt-repository ppa:aslatter/ppa -y

echo "Actualizando la lista de paquetes con el nuevo PPA..."
sudo apt update -y

echo "Instalando Alacritty desde el PPA..."
sudo apt install -y alacritty

# ----------------------------------------------------
# Sección Navegadores web
# ----------------------------------------------------
echo "Instalando navegadores web adicionales (Chrome y Firefox están en el sistema por defecto)."
sudo apt install -y chromium-browser

# -- Instalación de Brave --
echo "Preparando e instalando el navegador Brave..."
echo "Instalando dependencias para Brave..."
sudo apt install -y apt-transport-https curl gnupg

echo "Importando la clave GPG de Brave..."
sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg

echo "Añadiendo el repositorio de Brave..."
echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main" | sudo tee /etc/apt/sources.list.d/brave-browser-release.list

echo "Actualizando la lista de paquetes para incluir Brave..."
sudo apt update -y

echo "Instalando Brave Browser..."
sudo apt install -y brave-browser

# ----------------------------------------------------
# Sección Multimedia
# ----------------------------------------------------
echo "Instalando software multimedia..."
sudo apt install -y \
    vlc \
    gimp \
    audacious

# Añadir repositorio de VS Code
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor >packages.microsoft.gpg
sudo install -D -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg
sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
sudo apt update -y
sudo apt install -y code

echo "Instalando extras y compatibilidad..."
sudo apt install -y \
    ubuntu-restricted-extras \
    p7zip-full

echo "Limpiando paquetes innecesarios..."
sudo apt autoremove -y
sudo apt clean
