-- Basic UI & editing options
local opt = vim.opt

opt.number = true
opt.relativenumber = true
opt.cursorline = true
opt.wrap = true
opt.linebreak = true
opt.breakindent = true
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
vim.o.swapfile = false

-- Normal mode: move line up/down
vim.keymap.set("n", "<A-k>", ":m .-2<CR>==")
vim.keymap.set("n", "<A-j>", ":m .+1<CR>==")

-- Visual mode: move selection up/down
vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv")

----- Save configuration
-- default toggle state
vim.g.save_go_normal = true

-- main <C-s> mapping
vim.keymap.set({ "n", "i", "v" }, "<C-s>", function()
	if vim.g.save_go_normal then
		-- Save and go to Normal mode
		vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc>", true, false, true), "n", false)
		vim.cmd("w")
	else
		-- Save but keep current mode
		vim.cmd("w")
	end
end, { desc = "Save file (with optional normal mode)" })

-- toggle mapping
vim.keymap.set("n", "<leader>nm", function()
	vim.g.save_go_normal = not vim.g.save_go_normal
	if vim.g.save_go_normal then
		vim.notify("Save → Normal Mode", vim.log.levels.INFO)
	else
		vim.notify("Save → Stay in Current Mode", vim.log.levels.INFO)
	end
end, { desc = "Save behavior" })
