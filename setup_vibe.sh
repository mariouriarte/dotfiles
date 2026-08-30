#!/bin/bash

LOG_FILE="/tmp/setup_vibe.log"
DOTFILES_DIR="$HOME/dotfiles"

log() {
    echo "$(date +'%Y-%m-%d %H:%M:%S') [$1] $2" >>"$LOG_FILE"
}

# Ensure dotfiles directory exists
if [ ! -d "$DOTFILES_DIR" ]; then
    log "ERROR" "Directory $DOTFILES_DIR not found."
    exit 1
fi

log "INFO" "Setup vibe Mario escrito"
cd "$DOTFILES_DIR" || exit 1

log "INFO" "Pulling latest changes..."
if git pull origin main &>>"$LOG_FILE"; then
    log "INFO" "Git pull successful."
else
    log "ERROR" "Git pull failed."
fi

echo "Setup Vibe Mario..."

# ─── Local bin scripts ───────────────────────────────────────
if [ -f "./install_local_bin.sh" ]; then
    log "INFO" "Running install_local_bin.sh"

    if bash ./install_local_bin.sh >>"$LOG_FILE" 2>&1; then
        log "INFO" "Local bin installation completed successfully."
    else
        log "ERROR" "Local bin installation failed."
    fi
else
    log "WARN" "install_local_bin.sh not found, skipping."
fi

# List of scripts to source
SCRIPTS=(
    "./alacritty/setup.sh"
    "./bash/setup.sh"
    "./nvim/setup.sh"
    "./tmux/setup.sh"
)

for script in "${SCRIPTS[@]}"; do
    if [ -f "$script" ]; then
        log "INFO" "Sourcing $script"
        source "$script"
    else
        log "WARN" "Script $script not found, skipping."
    fi
done
