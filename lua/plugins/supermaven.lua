return {
	"supermaven-inc/supermaven-nvim",
	config = function()
		require("supermaven-nvim").setup({
			keymaps = {
				accept_suggestion = "<C-a>",
				clear_suggestion = "<C-x>",
				accept_word = "<C-Down>",
			},
			color = {
				-- suggestion_color = "#ffffff",
				-- cterm = 244,
			},
			log_level = "off",
			disable_inline_completion = false,
			disable_keymaps = false,
			condition = function()
				return false
			end,
		})
	end,
}
