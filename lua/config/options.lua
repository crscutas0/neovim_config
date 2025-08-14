-- Basic UI & editing options
local opt = vim.opt

opt.number = true
opt.relativenumber = true
opt.cursorline = true
-- opt.wrap = false
opt.signcolumn = "yes"
opt.termguicolors = true

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

-- keybinds
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.keymap.set({ "n", "i", "v" }, "<C-s>", function()
  vim.cmd("w")
end, { desc = "Save file" })

vim.o.swapfile = false
