#!/bin/bash
echo "Install mario's config files"

cp /home/$USER/dotfiles/conf/.alias ~
cp /home/$USER/dotfiles/conf/.gitconfig ~

#ln -sfv /home/$USER/dotfiles/conf/.banner-user ~
