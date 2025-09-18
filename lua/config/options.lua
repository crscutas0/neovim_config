require("config.keymap.base")

---- vim options
local opt = vim.opt

-- others
opt.number = true
opt.relativenumber = true
opt.cursorline = true
opt.wrap = true
opt.linebreak = true
opt.breakindent = true
opt.signcolumn = "yes"
opt.termguicolors = true
opt.clipboard = "unnamedplus"

-- Indentation
opt.expandtab = true
opt.shiftwidth = 2
opt.tabstop = 2
opt.smartindent = true

-- Search
opt.ignorecase = true
opt.smartcase = true
opt.incsearch = true
opt.hlsearch = false

-- Scrolling
opt.scrolloff = 8
opt.sidescrolloff = 8

vim.o.swapfile = false

-- LSP
vim.lsp.enable({
	"lua_ls",
	"ts_ls",
	"pyright",
	"ruff",
	-- "html",
	-- "htmx",
	"tailwindcss",
	"djlsp",
	"json",
	"gopls",
	"svelte",
})

vim.opt.completeopt = "menuone,noselect,fuzzy,nosort"
