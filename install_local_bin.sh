#!/bin/bash
echo '> Install user local bin...'

chmod 775 $HOME/dotfiles/local_bin/*

DIR_LOCAL_BIN=$HOME/.local/bin
DIR_DOTFILES_BIN=$HOME/dotfiles/local_bin


ln -sf $DIR_DOTFILES_BIN/hola_mundo $DIR_LOCAL_BIN
ln -sf $DIR_DOTFILES_BIN/update_manjaro $DIR_LOCAL_BIN
ln -sf $DIR_DOTFILES_BIN/update_arch $DIR_LOCAL_BIN
#sigpp
ln -sf $DIR_DOTFILES_BIN/syncdb_sigpp_precision $DIR_LOCAL_BIN
ln -sf $DIR_DOTFILES_BIN/syncdb_sigpp_blackcat $DIR_LOCAL_BIN
# nintendo switch install roms
ln -sf $DIR_DOTFILES_BIN/dbibackend_install $DIR_LOCAL_BIN
