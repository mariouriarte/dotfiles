# Dotfiles

Dotfiles personales para Linux, enfocados en configuración de shell, terminal y Neovim basado en LazyVim.

## Qué contiene este repositorio

- `nvim/`: configuración de Neovim (bootstrap de LazyVim + plugins, keymaps y autocommands)
- `bash/`: aliases y bloque de entorno para `~/.bashrc` (y `~/.zshrc` si existe)
- `alacritty/`, `ghostty/`: configuraciones de terminal y scripts de setup
- `git/`: setup de gitconfig
- `arch/`, `manjaro/`, `ubuntu/`: instaladores por sistema operativo
- `local_bin/`: scripts personales para enlazar en `~/.local/bin`

## Inicio rápido

Clona en `~/dotfiles` (varios scripts asumen esa ruta):

```bash
git clone <tu-url-del-repo> ~/dotfiles
cd ~/dotfiles
```

Ejecuta el bootstrap principal:

```bash
bash setup_vibe.sh
```

`setup_vibe.sh` hace `git pull origin main` y luego ejecuta:

- `alacritty/setup.sh`
- `bash/setup.sh`
- `nvim/setup.sh`

## Scripts locales en PATH

Para instalar scripts de `local_bin/` en `~/.local/bin`:

```bash
bash install_local_bin.sh
```

Este script asigna permisos de ejecución y crea symlinks por cada archivo.

## Flujo de Neovim

- Aplicar la config del repo a tu máquina:

```bash
bash nvim/setup.sh
```

- Copiar cambios de `~/.config/nvim` de vuelta al repo:

```bash
bash nvim/cp_to_dotfiles.sh
```

El entrypoint de Neovim es `nvim/init.lua`, que carga `nvim/lua/config/lazy.lua`.

## Notas de seguridad

- `nvim/install.sh` es destructivo: elimina directorios de config/estado/cache de Neovim antes de clonar LazyVim starter.
- `nvim/setup.sh` elimina archivos dentro de `~/.config/nvim/lua/plugins/` y `~/.config/nvim/lua/autocommands/` antes de copiar los del repo.
- `bash/setup.sh` reescribe el bloque custom de tu `~/.bashrc` (y `~/.zshrc` si existe).

## Instaladores por sistema operativo

- Arch: `arch/*.sh`
- Manjaro: `manjaro/*.sh`
- Ubuntu: `ubuntu/*.sh`

Úsalos de forma selectiva; instalan paquetes del sistema y pueden habilitar servicios.

## Notas

- El `Makefile` raíz actualmente referencia scripts que no existen; es mejor ejecutar scripts directamente.
- Este README es compacto. Para guía operativa específica para agentes, revisa `AGENTS.md`.
