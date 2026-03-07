#!/bin/bash

sudo pacman -Rs --noconfirm steam nvidia-580xx-dkms nvidia-580xx-utils lib32-nvidia-580xx-utils nvidia-dkms nvidia-utils lib32-nvidia-utils nvidia-open-dkms 2>/dev/null

yay -S --noconfirm nvidia-580xx-dkms nvidia-580xx-utils lib32-nvidia-580xx-utils
sudo echo "options nvidia-drm modeset=1" >/etc/modprobe.d/nvidia.conf
sed -i 's/^MODULES=(.*)/MODULES=(nvidia nvidia_modeset nvidia_uvm nvidia_drm)/' /etc/mkinitcpio.conf

sudo mkinitcpio -P
sudo grub-mkconfig -o /boot/grub/grub.cfg

echo "--------------------------------------------------------"
echo "¡Listo! Reinicia ahora "
