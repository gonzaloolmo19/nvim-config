# Neovim Configuration

This is a modularized Neovim configuration based on [kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim). It has been reorganized to have a cleaner structure with separate files for plugins and core settings.

## Prerequisites

Before installing, ensure you have the following installed on your system:

- **Neovim** (v0.10.0 or later)
- **Git**
- **Make** and a C compiler (GCC or Clang) - required for `telescope-fzf-native`
- **Ripgrep** - required for `telescope` live grep searching
- **Unzip** - required for some Mason tools
- **Nerd Font** (Optional but recommended) - for file icons

## Installation

### 1. Backup your existing configuration

If you already have a Neovim configuration, make sure to back it up:

```bash
mv ~/.config/nvim ~/.config/nvim.bak
mv ~/.local/share/nvim ~/.local/share/nvim.bak
mv ~/.local/state/nvim ~/.local/state/nvim.bak
mv ~/.cache/nvim ~/.cache/nvim.bak
```

### 2. Clone the repository

Clone this repository into your Neovim configuration directory:

```bash
git clone https://github.com/gonzaloolmo19/nvim-config.git ~/.config/nvim
```

### 3. Start Neovim

Start Neovim:

```bash
nvim
```

On the first launch, `lazy.nvim` will automatically bootstrap and install all plugins. This might take a minute. If you see any errors, try running `:Lazy update` or restarting Neovim.

## Project Structure

```
~/.config/nvim
├── init.lua              # Entry point
├── lua
│   ├── core              # Core configuration
│   │   ├── init.lua      # Loads core modules
│   │   ├── options.lua   # Vim options (tabstop, line numbers, etc.)
│   │   ├── keymaps.lua   # Global keymaps
│   │   ├── lazy.lua      # Lazy.nvim bootstrapping and setup
│   │   └── colorscheme.lua # Colorscheme loading
│   └── plugins           # Plugin specifications (managed by Lazy)
│       ├── blink.lua
│       ├── telescope.lua
│       ├── treesitter.lua
│       └── ...
└── lazy-lock.json        # Plugin lockfile
```

## Keymaps

The leader key is set to `<Space>`.

- **Find Files**: `<leader>sf`
- **Live Grep**: `<leader>sg`
- **Help**: `<leader>sh`
- **File Explorer**: `-` (via mini.files if installed) or use Telescope
- **Diagnostics**: `<leader>q` to open diagnostic list
