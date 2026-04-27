#!/bin/bash
echo "> Setup bash"
cp "$HOME/.bashrc" "$HOME/.bashrc.bak"

# Limpiar config anterior (con patrón más seguro)
sed -i '/#<!-- custom-conf/,/# end-conf -->/d' "$HOME/.bashrc"
[ -f "$HOME/.zshrc" ] && sed -i '/#<!-- custom-conf/,/# end-conf -->/d' "$HOME/.zshrc"

# Definir config con heredoc (evita problemas de comillas)
read -r -d '' multiline_string <<'BLOCK'
#<!-- custom-conf
z() {
  cd "$HOME/$1"
}
typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet
export VISUAL=vim
export EDITOR=vim
alias pfilteroc="ps auwwx"
alias pfilter="ps auwwx | grep "
alias start="systemctl start "
alias stop="systemctl stop "
alias ena="systemctl enable "
alias ls="eza --icons=always"
alias clr="clear"
alias hola_mario="echo Hola Mario"
alias gco="git checkout"
alias gs="git status"
alias ga="git add"
alias gaa="git add ."
alias gc="git commit"
alias gcm="git commit -m"
alias gca="git commit -a"
alias gps="git push origin"
alias gpl="git pull origin"
alias glg="git log --oneline --decorate --all --graph"
alias v="nvim"
alias dc="docker compose"
alias his="history | grep"
# end-conf -->
BLOCK

echo "$multiline_string" >>"$HOME/.bashrc"

if [ -f "$HOME/.zshrc" ]; then
    echo "$multiline_string" >>"$HOME/.zshrc"
fi

# Quitar líneas vacías duplicadas (más simple)
sed -i '/^$/N;/^\n$/d' "$HOME/.bashrc"
[ -f "$HOME/.zshrc" ] && sed -i '/^$/N;/^\n$/d' "$HOME/.zshrc"
