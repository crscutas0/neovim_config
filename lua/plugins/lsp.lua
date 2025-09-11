return {
	{
		"williamboman/mason.nvim",
		build = ":MasonUpdate",
		opts = {},
	},
	{
		"neovim/nvim-lspconfig",
		opts = {
			inlay_hints = { enabled = true },
		},
		config = function()
			local lspconfig = require("lspconfig")

			vim.diagnostic.config({
				virtual_text = false,
				signs = true,
				underline = true,
				update_in_insert = false,
				severity_sort = true,
			})

			local function load_config(server)
				local ok, config = pcall(require, "lsp." .. server)
				if not ok then
					vim.notify("No config found for LSP: " .. server, vim.log.levels.WARN)
					return {}
				end
				return config
			end

			local on_attach = require("config.keymap.lsp")
			local capabilities = vim.lsp.protocol.make_client_capabilities()

			local servers = {
				"lua_ls",
				"ts_ls",
				"pyright",
				"ruff",
				"tailwindcss",
				"djlsp",
				-- "html",
				"jsonls",
				"gopls",
				"svelte",
			}

			for _, server in ipairs(servers) do
				local config = load_config(server)
				config.on_attach = on_attach
				config.capabilities = capabilities
				lspconfig[server].setup(config)
			end
		end,
	},
}
