# Cleanvim

A modular, minimal, and transparent Neovim distribution built for speed and clarity.

---

## Directory Structure

```
~/.config/cleanvim/
├── init.lua              # Entry point
├── lazy-lock.json       
├── LICENSE
└── lua/
    └── cleanvim/         # Main namespace
        ├── core/         # Options, keymaps, autocmds, commands
        ├── config/       # Defaults and saved state
        ├── plugins/      # Default plugin specifications
        ├── ui/           # Themes, transparency, diagnostics
        ├── custom/       # User overrides and extensions
        └── lazy.lua      # Plugin manager bootstrap
```

### Core Concepts

* **`core/`** – fundamental editor behavior 
* **`plugins/`** – default plugins 
* **`ui/`** – appearance-related configuration
* **`custom/`** – user playground
* **`config/save_state/`** – persisted state 

---

## Installation

1. **Backup your existing Neovim config**

```bash
mv ~/.config/nvim ~/.config/nvim.bak
mv ~/.local/share/nvim ~/.local/share/nvim.bak
```

2. **Clone Cleanvim**

```bash
git clone https://github.com/Cyrus-Gahatraj/cleanvim ~/.config/nvim
```

3. **Start Neovim**

Lazy.nvim will bootstrap automatically on first launch.

---

### Included Plugins

Cleanvim ships with some of the plugins 

#### Core & UX

- lazy.nvim – Plugin manager

- which-key.nvim – Keybinding discovery

- undotree – Visual undo history

- oil.nvim – File explorer as a buffer

- blink.nvim – Autocomplete engine

#### Editing (mini.nvim suite)

- mini.ai – Text objects

- mini.comment – Commenting

- mini.pairs – Auto pairs

- mini.surround – Surround actions

- mini.bracketed – Bracket-based navigation

- mini.cmdline – Command-line enhancements

- mini.statusline – Minimal statusline

#### Navigation & Search

- telescope.nvim – Fuzzy finder

#### Git

- gitsigns.nvim – Git hunks and signs

- vim-fugitive – Git integration

- lazygit.nvim – LazyGit integration

#### LSP & Tooling

- nvim-lspconfig – LSP configuration

- mason.nvim – LSP/DAP/tool installer

- none-ls.nvim – Formatters and linters

- Treesitter


#### Themes

Built-in theme support with persistent selection:

- Catppuccin

- Gruvbox

- Kanagawa

- Tokyonight

- Nord

- Rose Pine

- Everforest

- Monokai Pro

- Flexoki

- Bamboo

- Ethereal

- Matteblack

- Hackerman

## Customization

Cleanvim is designed to be extended without modifying core files.

### Add or Override Plugins

Place your plugins in:

```
lua/cleanvim/custom/plugins/
```

Or just use the keymap **\<leader\>ap**

### Keymaps & Options

* Core keymaps: `lua/cleanvim/core/keymaps.lua`
* Core options: `lua/cleanvim/core/options.lua`

### Themes

* Theme picker is built-in
* Selected theme is persisted automatically
* Themes live in `plugins/themes/`
* User theme can be added with **\<leader\>at**

---

## Contributing

Cleanvim is currently in active development and **contributions are highly encouraged!** Whether it's a bug fix, a new feature, or improving documentation, feel free to get involved.

---

## License

MIT License © Cyrus Gahatraj

