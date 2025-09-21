return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		opts = {
			flavour = "frappe",
			color_overrides = {
				frappe = {
					base = "#2c2d30",
					mantle = "#35373b",
					crust = "#3e4045",
				},
			},
			custom_highlights = function()
				return {
					Search = { fg = "#c25622" },
					LineNr = { fg = "#454545" },
					CursorLineNr = { fg = "#8FA3A0", bold = true },
				}
			end,
		},
		config = function(_, opts)
			require("catppuccin").setup(opts)
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
					highlights.LineNr = { fg = "#454545", bold = true }
					highlights.CursorLineNr = { fg = "#8FA3A0", bold = true }
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
				colors = {
					purple = "#9f79ab",
					green = "#7b8c6f",
				},
				highlights = {
					Search = { fg = "#c25622" },
					LineNr = { fg = "#454545" },
					CursorLineNr = { fg = "#8FA3A0", fmt = "bold" },
					["@tag"] = { fg = "#de5d68" },
				},
			})
			require("onedark")
		end,
	},
}
