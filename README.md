# Cleanvim

A modular, minimal, and transparent Neovim distribution built for speed and clarity.

## Project Structure

```
~/.config/cleanvim/
├── init.lua              # Entry point
└── lua/
    ├── defaults.lua      # Factory settings
    └── cleanvim/         # Main Namespace
        ├── core/         # Options & Keymaps
        ├── custom/       # Custom settings can come here
        ├── plugins/      # Default Plugins
        ├── ui/           # Themes & Transparency (for now)
        └── lazy.lua      # Plugin manager 
```

## Installation

- Backup your current config

    ```bash
    mv ~/.config/nvim ~/.config/nvim.bak
    ```

- Clone Cleanvim

    ```bash
    git clone https://github.com/Cyrus-Gahatraj/cleanvim ~/.config/nvim
    ```
