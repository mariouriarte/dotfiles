#!/bin/bash

# --- Colores para la terminal ---
GREEN='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

echo -e "${BLUE}Configurando Tmux moderno...${NC}"

# 1. Instalar TPM (Tmux Plugin Manager) si no existe
if [ ! -d "$HOME/.tmux/plugins/tpm" ]; then
    echo -e "${GREEN}Instalando TPM...${NC}"
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
else
    echo -e "${BLUE}TPM ya está instalado.${NC}"
fi

# 2. Respaldo de configuración previa
if [ -f "$HOME/.tmux.conf" ]; then
    echo -e "${BLUE}Respaldando .tmux.conf antiguo a .tmux.conf.bak${NC}"
    mv "$HOME/.tmux.conf" "$HOME/.tmux.conf.bak"
fi

# 3. Crear el nuevo archivo de configuración
echo -e "${GREEN}Generando nueva configuración...${NC}"
cat <<EOF >~/.tmux.conf
# --- CONFIGURACIÓN GENERAL ---
set -g status-position top
set -g default-terminal "tmux-256color"
set -ag terminal-overrides ",xterm-256color:Tc"
set -g mouse on
set -g base-index 1              # Ventanas empiezan en 1
setw -g pane-base-index 1        # Paneles empiezan en 1
set-window-option -g pane-base-index 1
set-option -g renumber-windows on # Renombrar ventanas al cerrar una
set -g automatic-rename on
set -g automatic-rename-format '#{?#{m:opencode,#{pane_current_command}},opencode,#{?#{m:claudecode|claude,#{pane_current_command}},claudecode,#{pane_current_command}}}'

# Configuración para eliminar "espacios" en Catppuccin
set -g @catppuccin_window_left_separator "█"
set -g @catppuccin_window_right_separator "█"
set -g @catppuccin_window_middle_separator " | "
set -g @catppuccin_window_number_position "right"

set -g @catppuccin_window_default_fill "none"
set -g @catppuccin_window_current_fill "all"

# Si quieres que el fondo sea transparente (se integra con tu terminal)
set -g status-bg default
set -g status-style bg=default

# --- TECLAS DE ACCESO (ERGO) ---
unbind C-b
set -g prefix C-a                # Prefijo Ctrl + a
bind C-a send-prefix

# Dividir paneles con | y - en el path actual
bind | split-window -h -c "#{pane_current_path}"
bind - split-window -v -c "#{pane_current_path}"
unbind '"'
unbind %

# Navegación tipo Vim para paneles
bind h select-pane -L
bind j select-pane -D
bind k select-pane -U
bind l select-pane -R

# Navegación directa entre ventanas con Alt+1..9 (sin prefijo)
bind -n M-1 select-window -t 1
bind -n M-2 select-window -t 2
bind -n M-3 select-window -t 3
bind -n M-4 select-window -t 4
bind -n M-5 select-window -t 5
bind -n M-6 select-window -t 6
bind -n M-7 select-window -t 7
bind -n M-8 select-window -t 8
bind -n M-9 select-window -t 9

# --- PLUGINS (TPM) ---
set -g @plugin 'tmux-plugins/tpm'
set -g @plugin 'tmux-plugins/tmux-sensible'
set -g @plugin 'christoomey/vim-tmux-navigator' # Navegación fluida con Vim
set -g @plugin 'catppuccin/tmux'                # Tema Moderno
set -g @plugin 'tmux-plugins/tmux-resurrect'    # Guardar sesiones
set -g @plugin 'tmux-plugins/tmux-continuum'    # Auto-guardado

# Configuración del tema Catppuccin
set -g @catppuccin_flavor 'mocha' # latte, frappe, macchiato o mocha
set -g @catppuccin_window_status_style "round"

# Inicializar TPM (DEBE ir al final)
run '~/.tmux/plugins/tpm/tpm'
EOF

echo -e "${GREEN}¡Listo! Configuración instalada.${NC}"
echo -e "Para aplicar los cambios:"
echo -e "1. Entra a tmux escribiendo: ${BLUE}tmux${NC}"
echo -e "2. Presiona ${BLUE}Ctrl+a${NC} seguido de ${BLUE}I${NC} (I mayúscula) para instalar los plugins."
