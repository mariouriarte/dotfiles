# AGENTS

## Scope and Layout
- This repo is a personal dotfiles collection, not an app/library project; most changes are shell scripts plus Neovim config under `nvim/`.
- Main areas: `nvim/` (LazyVim-based config), `bash/`, `alacritty/`, `ghostty/`, `git/`, and OS-specific installers in `arch/`, `manjaro/`, `ubuntu/`.

## Source of Truth Commands
- Run scripts from repo root (`/home/mario/dotfiles`); many scripts use relative paths and will fail from other directories.
- `bash setup_vibe.sh` is the top-level bootstrap used here: it does `git pull origin main`, then sources `alacritty/setup.sh`, `bash/setup.sh`, and `nvim/setup.sh`.
- `bash install_local_bin.sh` symlinks every file from `local_bin/` into `~/.local/bin` and sets executable bits.

## Neovim Wiring (Important)
- Neovim entrypoint is `nvim/init.lua`, which loads `config.lazy` and autocommands from `nvim/lua/autocommands/`.
- Plugin manager bootstrap is in `nvim/lua/config/lazy.lua` (`folke/lazy.nvim` + `LazyVim/LazyVim` + local `plugins` import).
- Sync direction matters: `nvim/cp_to_dotfiles.sh` copies from live `~/.config/nvim` back into this repo; `nvim/setup.sh` copies from repo into `~/.config/nvim`.

## High-Risk Script Behavior
- `nvim/install.sh` deletes `~/.config/nvim`, `~/.local/share/nvim`, `~/.local/state/nvim`, and `~/.cache/nvim` before cloning LazyVim starter.
- `nvim/setup.sh` runs `rm ~/.config/nvim/lua/plugins/*` and `rm ~/.config/nvim/lua/autocommands/*`; ensure those dirs exist before running.
- `bash/setup.sh` edits both `~/.bashrc` and optionally `~/.zshrc` in-place (removes/rewrites the block between `#<!-- custom-conf` and `# end-conf -->`).

## Verified Repo Quirks
- `Makefile` targets are stale right now: they call `scripts/install_manjaro_apps.sh` and `scripts/install_p10k.sh`, but only `scripts/install_config_files.sh` exists.
- `README.md` is minimal and not an operational guide; trust scripts as the executable source of truth.
- No CI, test, lint, formatter, or typecheck config is present at repo root; validate changes by running the specific shell script you touched.
