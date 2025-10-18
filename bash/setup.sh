#!/bin/bash

cp $HOME/.bashrc $HOME/.bashrc.bak

sed -i '/^#--/d' $HOME/.zshrc

multiline_string='
#--custom-conf
alias pfilteroc="ps auwwx"
alias pfilter="ps auwwx | grep "
alias start="systemctl start "
alias stop="systemctl stop "
alias ena="systemctl enable "
alias gs="git status"
export VISUAL=vim
export EDITOR=vim
#--end-conf'

cat <<EOF >>$HOME/.bashrc
$multiline_string
EOF

if [ -e "${HOME}/.zshrc" ]; then
    cat <<EOF >>$HOME/.zshrc
$multiline_string
EOF

fi
