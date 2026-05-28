return {
	{
		"stevearc/conform.nvim",
		opts = {
			formatters_by_ft = {
				javascript = { "prettierd" },
				javascriptreact = { "prettierd" }, -- add rustywind in the future
				typescript = { "prettierd" },
				typescriptreact = { "prettierd" }, -- add rustywind in the future
				svelte = { "prettierd" },
				json = { "prettierd" },
				css = { "prettierd" },
				html = { "prettierd" },
				toml = { "tombi" },
				lua = { "stylua" },
				python = { "black", "reorder-python-imports" },
			},

			default_format_opts = {
				lsp_format = "fallback",
			},
			format_on_save = {
				timeout_ms = 3000,
			},
			formatters = {
				djlint = {
					prepend_args = { "--indent", "2" },
				},
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
				svelte = { "biome" },
				typescript = { "biome" },
				json = { "jsonlint" },
				typescriptreact = { "biome" },
				python = { "flake8" },
				html = { "htmlhint" },
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
