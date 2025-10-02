local function get_word_length()
	local col = vim.api.nvim_win_get_cursor(0)[2] + 1 -- Current column (1-based)
	local line = vim.api.nvim_get_current_line()
	local prefix = line:sub(1, col - 1)
	local word_len = 0
	for char in prefix:gmatch("%w") do -- Count alphanumeric chars
		word_len = word_len + 1
	end
	return word_len
end

-- Function to trigger completion with a delay
local function delayed_completion()
	if get_word_length() >= 2 then
		vim.defer_fn(function()
			if vim.api.nvim_get_mode().mode == "i" then
				vim.fn["coc#start"]() -- Trigger nvim-coq completion
			end
		end, 300) -- 300ms delay
	end
end

-- Map <C-Space> to the delayed completion function
vim.keymap.set("i", "<C-Space>", delayed_completion, { silent = true })

vim.g.coq_settings = {
	keymap = {
		recommended = false,
	},
}

-- Keybindings
vim.api.nvim_set_keymap("i", "<Esc>", [[pumvisible() ? "\<C-e><Esc>" : "\<Esc>"]], { expr = true, silent = true })
vim.api.nvim_set_keymap("i", "<C-c>", [[pumvisible() ? "\<C-e><C-c>" : "\<C-c>"]], { expr = true, silent = true })
vim.api.nvim_set_keymap("i", "<BS>", [[pumvisible() ? "\<C-e><BS>" : "\<BS>"]], { expr = true, silent = true })
vim.api.nvim_set_keymap(
	"i",
	"<CR>",
	[[pumvisible() ? (complete_info().selected == -1 ? "\<C-e><CR>" : "\<C-y>") : "\<CR>"]],
	{ expr = true, silent = true }
)
vim.api.nvim_set_keymap("i", "<Tab>", [[pumvisible() ? "\<C-n>" : "\<Tab>"]], { expr = true, silent = true })
vim.api.nvim_set_keymap("i", "<S-Tab>", [[pumvisible() ? "\<C-p>" : "\<BS>"]], { expr = true, silent = true })
