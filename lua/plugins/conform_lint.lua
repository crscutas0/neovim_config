return {
	{
		"stevearc/conform.nvim",
		opts = {
			formatters_by_ft = {
				javascript = { "prettierd" },
				javascriptreact = { "prettierd" },
				typescript = { "prettierd" },
				typescriptreact = { "prettierd" },
				json = { "prettierd" },
				css = { "prettierd" },
				html = { "prettierd" },
				lua = { "stylua" },
				python = { "ruff_format", "reorder-python-imports" },
			},
			format_on_save = {
				timeout_ms = 100,
				lsp_format = "fallback",
			},
		},
	},
	{
		"mfussenegger/nvim-lint",
		config = function()
			require("lint").linters_by_ft = {
				javascript = { "eslint_d" },
				javascriptreact = { "eslint_d" },
				typescript = { "eslint_d" },
				json = { "jsonlint" },
				typescriptreact = { "eslint_d" },
				python = { "ruff" },
			}

			-- Run linting automatically on save
			vim.api.nvim_create_autocmd({ "BufWritePost" }, {
				callback = function()
					require("lint").try_lint()
				end,
			})
		end,
	},
}
