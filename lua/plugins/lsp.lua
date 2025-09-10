return {
	{
		"williamboman/mason.nvim",
		build = ":MasonUpdate",
		opts = {},
	},
	{
		"neovim/nvim-lspconfig",
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

			local on_attach = function(client, bufnr)
				-- client.server_capabilities.documentHighlightProvider = false
				-- client.server_capabilities.semanticTokensProvider = nil

				local map = function(mode, lhs, rhs, desc)
					vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc })
				end

				map("n", "K", vim.lsp.buf.hover, "Hover")
				map("n", "<C-r>", vim.lsp.buf.rename, "Rename")
				map("n", "<C-Space>", vim.lsp.buf.code_action, "Code Action")
				map("n", "<leader>ef", function()
					vim.lsp.buf.format({ async = true })
				end, "Format")
			end

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
