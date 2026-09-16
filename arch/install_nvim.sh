#!/bin/bash

set -euo pipefail

sudo pacman -S --needed --noconfirm neovim fd tree-sitter tree-sitter-cli
