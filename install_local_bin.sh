#!/bin/bash

set -e

echo '> Starting local bin installation...'

DIR_DOTFILES_BIN="$HOME/dotfiles/local_bin"
DIR_LOCAL_BIN="$HOME/.local/bin"

# Create destination directory if it doesn't exist
if [ ! -d "$DIR_LOCAL_BIN" ]; then
    echo "Creating directory: $DIR_LOCAL_BIN"
    mkdir -p "$DIR_LOCAL_BIN"
fi

# Set permissions and create symbolic links dynamically
if [ -d "$DIR_DOTFILES_BIN" ]; then
    echo "Processing binaries from $DIR_DOTFILES_BIN..."

    for file in "$DIR_DOTFILES_BIN"/*; do
        if [ -f "$file" ]; then
            filename=$(basename "$file")

            # Ensure file is executable
            chmod 775 "$file"

            # Create symbolic link
            ln -sf "$file" "$DIR_LOCAL_BIN/$filename"
            echo "Linked: $filename"
        fi
    done
else
    echo "Error: Source directory $DIR_DOTFILES_BIN does not exist."
    exit 1
fi

# Check if DIR_LOCAL_BIN is in PATH
if [[ ":$PATH:" != *":$DIR_LOCAL_BIN:"* ]]; then
    echo "Warning: $DIR_LOCAL_BIN is not in your PATH."
    echo "Add 'export PATH=\"\$HOME/.local/bin:\$PATH\"' to your .bashrc or .zshrc"
else
    echo "Success: $DIR_LOCAL_BIN is already in your PATH."
fi

echo '> Installation completed successfully.'
