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
opt.guicursor = "n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50"

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

vim.lsp.enable({
	"lua_ls",
	"vtsls",
	"bashls",
	"biome",
	"tailwindcss",
	"svelte",
	"gopls",
	"html",
	"djls",
	"basedpyright",
})

vim.diagnostic.config({
	severity_sort = true,
	-- virtual_text = {
	-- 	severity = { min = vim.diagnostic.severity.ERROR },
	-- },
	underline = {
		severity = { min = vim.diagnostic.severity.ERROR },
	},
	signs = {
		severity = { min = vim.diagnostic.severity.ERROR },
	},
})
