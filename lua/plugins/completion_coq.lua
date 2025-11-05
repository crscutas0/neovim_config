if true then
	return {}
end

return {
	{
		"ms-jpq/coq_nvim",
		branch = "coq",
		dependencies = {
			{ "ms-jpq/coq.artifacts", branch = "artifacts" },
			{ "ms-jpq/coq.thirdparty", branch = "3p" },
			{ "neovim/nvim-lspconfig", lazy = false },
		},
		init = function()
			vim.g.coq_settings = {
				auto_start = "shut-up",
				completion = {
					always = false,
				},
				keymap = {
					recommended = false,
					manual_complete = "<C-Space>",
				},
				limits = {
					completion_manual_timeout = 1,
				},
				display = {
					pum = {
						y_max_len = 3,
					},
					statusline = { helo = false },
				},
			}
		end,
		config = function()
			require("config.keymap.completion_coq")
		end,
	},
}
