return {
	{
		"stevearc/conform.nvim",
		opts = {
			formatters_by_ft = {
				javascript = { "prettierd" },
				javascriptreact = { "prettierd" }, -- add rustywind in the future
				typescript = { "prettierd" },
				typescriptreact = { "prettierd" }, -- add rustywind in the future
				json = { "prettierd" },
				css = { "prettierd" },
				html = { "biome" },
				htmldjango = { "biome" },
				lua = { "stylua" },
				python = { "black", "reorder-python-imports" },
			},
			format_on_save = {
				timeout_ms = 3000,
				lsp_format = "fallback",
			},
		},
	},
	{
		"mfussenegger/nvim-lint",
		config = function()
			local lint = require("lint")

			lint.linters.biome = {
				cmd = "biome",
				stdin = false,
				args = { "lint", "--formatter", "compact", "--no-errors-on-unmatched" },
				ignore_exitcode = true,
				parser = require("lint.parser").from_errorformat("%f:%l:%c %m", {
					source = "biome",
				}),
			}

			lint.linters_by_ft = {
				javascript = { "biome" },
				javascriptreact = { "biome" },
				typescript = { "biome" },
				json = { "jsonlint" },
				typescriptreact = { "biome" },
				python = { "flake8" },
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
