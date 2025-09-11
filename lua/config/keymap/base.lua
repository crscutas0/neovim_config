-- keybinds
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.keymap.set("n", "<A-k>", ":m .-2<CR>==")
vim.keymap.set("n", "<A-j>", ":m .+1<CR>==")
vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "U", "<Cmd>redo<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<A-Up>", "10k", { noremap = true, silent = true, desc = "Move 10 lines up" })
vim.keymap.set("n", "<A-Down>", "10j", { noremap = true, silent = true, desc = "Move 10 lines down" })

vim.keymap.set("n", "<leader>ml", "J", {
	noremap = true,
	silent = true,
	desc = "Join selected lines with a space",
})

-- disable keybinds
vim.keymap.set("n", "J", "<Nop>", { noremap = true, silent = true })
vim.keymap.set("n", "<S-Up>", "<Nop>", {})
vim.keymap.set("n", "<S-Down>", "<Nop>", {})
vim.keymap.set("x", "<S-Up>", "<Nop>", {})
vim.keymap.set("x", "<S-Down>", "<Nop>", {})
vim.keymap.set("i", "<S-Up>", "<Nop>", {})
vim.keymap.set("i", "<S-Down>", "<Nop>", {})
vim.keymap.set("i", "<C-w>", "<Nop>", { noremap = true, silent = true })

vim.keymap.set("n", "<C-e>", "<cmd>Neotree focus<cr>", { desc = "Focus Neo-tree" })

----------- start: save mode
vim.g.save_go_normal = true

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
vim.keymap.set("n", "<leader>nw", function()
	vim.g.save_go_normal = not vim.g.save_go_normal
	if vim.g.save_go_normal then
		vim.notify("Save → Normal Mode", vim.log.levels.INFO)
	else
		vim.notify("Save → Stay in Current Mode", vim.log.levels.INFO)
	end
end, { desc = "Toggle save behavior" })
--------- end: save mode
