#!/bin/bash

echo "> Setup tmux"

if [ ! -d "$HOME/.tmux/plugins/tpm" ]; then
    echo "Instalando TPM..."
    git clone https://github.com/tmux-plugins/tpm "$HOME/.tmux/plugins/tpm"
else
    echo "TPM ya esta instalado"
fi

cp tmux/tmux.conf "$HOME/.tmux.conf"

if command -v tmux >/dev/null 2>&1; then
    if [ -x "$HOME/.tmux/plugins/tpm/bin/install_plugins" ]; then
        tmux start-server \; source-file "$HOME/.tmux.conf" \; set-environment -g TMUX_PLUGIN_MANAGER_PATH "$HOME/.tmux/plugins/"
        echo "Instalando plugins de tmux (TPM)..."
        if ! "$HOME/.tmux/plugins/tpm/bin/install_plugins"; then
            echo "No se pudieron instalar los plugins de TPM"
        fi
    else
        echo "No se encontro install_plugins de TPM"
    fi
else
    echo "tmux no esta instalado; se omite instalacion de plugins"
fi

echo "Tmux configurado"
