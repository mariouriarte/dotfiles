# Dotfiles

Personal Linux dotfiles focused on shell setup, terminal configuration, and a LazyVim-based Neovim config.

## What this repository contains

- `nvim/`: Neovim configuration (LazyVim bootstrap plus custom plugins, keymaps, and autocommands)
- `bash/`: shell aliases and environment block injection for `~/.bashrc` (and `~/.zshrc` if present)
- `alacritty/`, `ghostty/`: terminal emulator configs and setup scripts
- `git/`: gitconfig setup
- `arch/`, `manjaro/`, `ubuntu/`: OS-specific install helpers
- `local_bin/`: personal scripts to symlink into `~/.local/bin`

## Quick start

Clone into `~/dotfiles` (the scripts assume this location in several places):

```bash
git clone <your-repo-url> ~/dotfiles
cd ~/dotfiles
```

Run the main bootstrap:

```bash
bash setup_vibe.sh
```

`setup_vibe.sh` pulls latest changes from `main` and then runs:

- `alacritty/setup.sh`
- `bash/setup.sh`
- `nvim/setup.sh`

## Local scripts in PATH

To install scripts from `local_bin/` into `~/.local/bin`:

```bash
bash install_local_bin.sh
```

This script sets executable permissions and creates symlinks for each file.

## Neovim workflow

- Apply repo Neovim config to your machine:

```bash
bash nvim/setup.sh
```

- Copy your live `~/.config/nvim` changes back into this repo:

```bash
bash nvim/cp_to_dotfiles.sh
```

Neovim entrypoint is `nvim/init.lua`, which loads `nvim/lua/config/lazy.lua`.

## Safety notes

- `nvim/install.sh` is destructive: it removes existing Neovim config/state/cache directories before cloning LazyVim starter.
- `nvim/setup.sh` removes files under `~/.config/nvim/lua/plugins/` and `~/.config/nvim/lua/autocommands/` before copying repo files.
- `bash/setup.sh` rewrites the custom block in your `~/.bashrc` (and `~/.zshrc` if present).

## OS-specific installers

- Arch: `arch/*.sh`
- Manjaro: `manjaro/*.sh`
- Ubuntu: `ubuntu/*.sh`

Use these scripts selectively; they install system packages and may enable services.

## Notes

- The root `Makefile` currently references scripts that are not present; prefer running scripts directly.
- `README.md` is intentionally compact. For agent-specific operational guidance, see `AGENTS.md`.
