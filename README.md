# Neovim Configuration

Neovim v0.11

## Installation

```sh
git clone https://github.com/crscutas0/neovim_config.git ~/.config/nvim
rm -rf ~/.config/nvim/.git
rm  ~/config/nvim/README.md
```

## Plugins
Packages are usually automatically installed. To ensure plugins are up to date use `:Lazy update`. 

| Plugin | Purpose |
| -------------- | --------------- |
| [Mason](https://github.com/mason-org/mason.nvim) | Installs language related packages |
| [Treesitter](https://github.com/nvim-treesitter/nvim-treesitter) | Syntax highlighter |
| [Whichkey](https://github.com/folke/which-key.nvim) | Keybind helper |
| [NeoTree](https://github.com/nvim-neo-tree/neo-tree.nvim) | File explorer |
| [LuaLine](https://github.com/nvim-lualine/lualine.nvim) | Bottom editor statusline |
| [BufferLine](https://github.com/akinsho/bufferline.nvim) | Tabbing |
| [Snacks](https://github.com/folke/snacks.nvim) | Editor collection of features |
| [Undotree](https://github.com/mbbill/undotree) | Save undo history to file |
| [MiniIndent](https://github.com/nvim-mini/mini.indentscope) | Scope indicator |
| [Surround](https://github.com/kylechui/nvim-surround) | Surround text with `"[{(` |
| [Autopair](https://github.com/windwp/nvim-autopairs) | Auto pair when keys `"[{(` |
| [Conform](https://github.com/stevearc/conform.nvim) | Formatting |
| [nvim-lint](https://github.com/mfussenegger/nvim-lint) | Linting |
| [BlinkCmp](https://github.com/Saghen/blink.cmp) | Auto Completion |
| [LuaSnip](https://github.com/L3MON4D3/LuaSnip) | Code Snippets |
| [FriendlySnippets](https://github.com/rafamadriz/friendly-snippets) | Code Snippets |
| [dadbod](https://github.com/kristijanhusak/vim-dadbod-ui) | SQL stuff |

#### Themes
- catpuccin
- onedark
- tokyonight
- everforest
- rose-pine 

See `lua/config/colors.lua` for theme 

## LSP
Use `:Mason` to install the following packages. Packages that are not needed does not need to be installed. Check the following files to remove unused packages `lsp/`, `lua/packages/conform_lint.lua`, `lua/config/options.lua`

- django-template-lsp
- eslint_d
- gopls
- html-lsp
- json-lsp
- jsonlint
- lua-language-server
- prettierd
- pyright
- python-lsp-server
- reorder-python-imports
- ruff
- shfmt
- stylua
- svelte-language-server
- tailwindcss-language-server
- typescript-language-server

## Keybinds

There are a couple of keybinds to mention, this section will only mention most used and not defined in `lua/config/keymaps`.

**Note:**
- Think of _buffers_ as an open window. Explorer is a buffer, tabs are different buffers. _Active Buffers_ currently shown in the screen, usually the file explorer and the editor.

| Mode | Keybind | Description |
| -------------- | ---------------- |-------------- |
| Normal | Ctrl + ww | Switch to different active buffers |
| Normal | Shift + [h,l] | Switch tabs |
| Normal | Ctrl + z | Minimizes nvim, you can type `fg` to maximize it. |

## Versions

**master** branch will only be updated when a fix is necessary.
