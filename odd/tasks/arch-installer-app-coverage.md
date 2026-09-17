# Arch Installer App Coverage

## Objective

Ensure `arch/install.sh` installs the user's expected desktop and development tools in one run while keeping responsibility-specific installer modules.

## Problem

Recent shell history shows tools still being installed manually after the Arch bootstrap, especially CodeGraph via npm. Some existing scripts also are not part of the main orchestration flow or still use unsafe pacman update flags.

## Why

The Arch bootstrap should be repeatable and complete enough to avoid manual post-install cleanup for known personal tooling.

## Scope

- Add a focused Arch development-tools installer for global npm tools that belong to the machine baseline.
- Include CodeGraph in the main Arch install flow.
- Keep project-local Python packages such as FastAPI out of the dotfiles bootstrap.
- Fix multimedia pacman usage before considering it for orchestration.
- Include tmux configuration in the main flow so installed tmux is configured in the same run.
- Add mobile development tooling for Android Studio, Flutter, and official Microsoft VS Code.

## Constraints

- `arch/install.sh` remains a composer/orchestrator.
- Use Arch-compatible commands only.
- Prefer `pacman -S --needed --noconfirm`; avoid `pacman -Sy` in touched default scripts.
- Do not run installers locally; validate shell syntax only.

## Authorized Scope

- `arch/install.sh`
- `arch/install_dev_tools.sh`
- `arch/install_multimedia.sh`
- `arch/install_tmux.sh` only if syntax compatibility requires it
- `arch/install_mobile_dev.sh`
- `arch/install_aur_apps.sh`

## Tasks

- [x] AIAC-1 Add an Arch dev-tools module that installs prerequisites and global CodeGraph via npm.
- [x] AIAC-2 Keep FastAPI and other project Python packages out of the machine bootstrap.
- [x] AIAC-3 Wire dev tools and tmux configuration into `arch/install.sh`.
- [x] AIAC-4 Fix `arch/install_multimedia.sh` to use `pacman -S --needed --noconfirm` with an array.
- [x] AIAC-5 Validate changed shell scripts with `bash -n` and record results.
- [x] AIAC-6 Add mobile development installer for Android Studio, Flutter under `/opt`, Android tooling, and VS Code Flutter extensions.
- [x] AIAC-7 Prefer official Microsoft VS Code binary package over ambiguous `code` package.
- [x] AIAC-8 Wire the mobile development installer into `arch/install.sh` and validate syntax.

## Acceptance Criteria

- `arch/install.sh` runs CodeGraph installation through a dedicated module.
- `arch/install.sh` configures tmux after installing the core app list.
- `arch/install_multimedia.sh` no longer uses `pacman -Sy`.
- No FastAPI/project Python dependencies are added to the bootstrap.
- Syntax validation passes for touched shell scripts.
- Android Studio is installed through an upstream-backed Arch package suitable for `/opt` installation.
- Flutter is installed from the official stable Git repository under `/opt/flutter`.
- Shell environment exposes Flutter and Android SDK paths for future sessions.
- VS Code gets Dart and Flutter extensions when the `code` command is available.

## Applicable Checks

- `bash -n arch/install.sh arch/install_dev_tools.sh arch/install_multimedia.sh arch/install_tmux.sh`
- `bash -n arch/install.sh arch/install_mobile_dev.sh arch/install_aur_apps.sh`

## Progress

- Created task document before source edits.
- Added `arch/install_dev_tools.sh` for `nodejs`, `npm`, `go`, `@colbymchenry/codegraph@latest`, and `uipro-cli`.
- Added `install_multimedia.sh`, `install_dev_tools.sh`, and `install_tmux.sh` to the main `arch/install.sh` flow.
- Converted `arch/install_multimedia.sh` from `pacman -Sy` to package arrays using `pacman -S --needed --noconfirm`, with known AUR multimedia packages installed through `yay` when available.
- Confirmed VS Code was present only as `code`; Android Studio and Flutter were not installed or configured.
- Added `arch/install_mobile_dev.sh` to install Android/Flutter baseline packages, AUR `android-studio`, AUR `visual-studio-code-bin`, Flutter stable under `/opt/flutter`, profile scripts, Flutter group permissions, and VS Code Dart/Flutter extensions when `code` is available.
- Wired `install_mobile_dev.sh` into `arch/install.sh` after development tools and removed ambiguous `code` from `arch/install_aur_apps.sh` to avoid duplicate VS Code installation paths.
- Added setgid directory permissions and Git `safe.directory` configuration for `/opt/flutter` so the invoking user can run Flutter without root-owned Git safety failures.
- Made npm global packages, Flutter SDK installation, and VS Code extension installation skip when they are already present.
- Guarded `/opt/flutter` permission/profile setup so it only runs when Flutter is actually managed under `/opt/flutter`.
- Added explicit migration from conflicting community `code` package to official `visual-studio-code-bin` before running non-interactive `yay` installation.

## Verification Evidence

- `bash -n arch/install.sh arch/install_dev_tools.sh arch/install_multimedia.sh arch/install_tmux.sh` passed with no output.
- `bash -n arch/install.sh arch/install_mobile_dev.sh arch/install_aur_apps.sh` passed with no output.
- `bash -n arch/install.sh arch/install_dev_tools.sh arch/install_mobile_dev.sh arch/install_multimedia.sh arch/install_tmux.sh arch/install_aur_apps.sh` passed with no output after the `/opt/flutter` permission hardening.
- `bash -n arch/install_dev_tools.sh arch/install_mobile_dev.sh` passed with no output after idempotency guard changes.
- `bash -n arch/install_dev_tools.sh arch/install_mobile_dev.sh` passed again after guarding `/opt/flutter` permission/profile setup.
- `bash -n arch/install_mobile_dev.sh` passed with no output after adding explicit VS Code package migration.
- Markdown was not passed to `bash -n` because it is not a shell script.

## Next Step

- Review the installer package choices on a real Arch machine before running the full bootstrap.
