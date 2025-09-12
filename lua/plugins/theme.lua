return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		opts = {
			flavour = "frappe",
			custom_highlights = function()
				return {
					CursorLineNr = { fg = "#ffbf00", bold = true },
				}
			end,
		},
		config = function(_, opts)
			require("catppuccin").setup(opts)
		end,
	},
	{
		"AlexvZyl/nordic.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("nordic").setup({
				cursorline = {
					bold = true,
					bold_number = true,
					theme = "dark",
					blend = 0.85,
				},
			})
			vim.defer_fn(function()
				vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#ffbf00", bold = true })
			end, 50)
		end,
	},
	{
		"neanias/everforest-nvim",
		version = false,
		lazy = false,
		priority = 1000,

		config = function()
			require("everforest").setup({
				background = "soft",
				on_highlights = function(highlights, _)
					highlights.LineNr = { fg = "#ffbf00", bold = true }
					highlights.CursorLineNr = { fg = "#ffbf00", bold = true }
				end,
			})
		end,
	},
	{
		"navarasu/onedark.nvim",
		priority = 1000,
		config = function()
			require("onedark").setup({
				style = "warm",
				colors = {},
				highlights = {
					CursorLineNr = { fg = "#ffbf00", fmt = "bold" },
				},
			})
			require("onedark")
		end,
	},
}
