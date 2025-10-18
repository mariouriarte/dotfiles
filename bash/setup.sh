#!/bin/bash

cp $HOME/.bashrc $HOME/.bashrc.bak

sed -i -z 's/#<!--.*-->//g' $HOME/.zshrc
sed -i -z 's/#<!--.*-->//g' $HOME/.bashrc

multiline_string='#<!-- custom-conf
export VISUAL=vim
export EDITOR=vim

alias pfilteroc="ps auwwx"
alias pfilter="ps auwwx | grep "
alias start="systemctl start "
alias stop="systemctl stop "
alias ena="systemctl enable "

alias ls="eza --icons=always"

alias gco="git checkout"
alias gs="git status"
alias ga="git add"
alias ga.="git add ."
alias gc="git commit"
alias gcm="git commit -m"
alias gca="git commit -a"
alias gp="git push"
alias gl="git pull"
alias glg="git log --oneline --decorate --all --graph"

alias v="nvim ."

alias dc="docker compose"

alias his="history | grep"

# end-conf -->'

cat <<EOF >>$HOME/.bashrc
$multiline_string
EOF

if [ -e "${HOME}/.zshrc" ]; then
    cat <<EOF >>$HOME/.zshrc
$multiline_string
EOF

fi

sed -i -e ':a' -e 'N' -e '$!ba' -e 's/\n\n/\n/g' $HOME/.zshrc
sed -i -e ':a' -e 'N' -e '$!ba' -e 's/\n\n/\n/g' $HOME/.bashrc

#[[ ! -f ~/.zshrc ]] || source ~/.zshrc
