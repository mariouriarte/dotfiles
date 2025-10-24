#!/bin/bash

echo "> Setup bash"
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
alias clr="clear"

alias gco="git checkout"
alias gs="git status"
alias ga="git add"
alias gaa="git add ."
alias gc="git commit"
alias gcm="git commit -m"
alias gca="git commit -a"
alias gp="git push"
alias gpori="git push origin"
alias gl="git pull"
alias glori="git pull origin"
alias glg="git log --oneline --decorate --all --graph"

alias v="nvim ."

alias dc="docker compose"

alias his="history | grep"

neofetch
typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet

# end-conf -->'

cat <<EOF >>$HOME/.bashrc
$multiline_string
EOF

if [ -e "${HOME}/.zshrc" ]; then
    cat <<EOF >>$HOME/.zshrc
$multiline_string
EOF

fi

# quitar saltos de linea
sed -i -e ':a' -e 'N' -e '$!ba' -e 's/\n\n/\n/g' $HOME/.zshrc
sed -i -e ':a' -e 'N' -e '$!ba' -e 's/\n\n/\n/g' $HOME/.bashrc

#[[ ! -f ~/.zshrc ]] || source ~/.zshrc
