return {
	cmd = { "svelteserver", "--stdio" },
	filetypes = { "svelte" },
	root_dir = function(fname)
		local util = require("lspconfig.util")
		return util.root_pattern("package.json", "svelte.config.js", "tsconfig.json", ".git")(fname)
			or util.path.dirname(fname)
	end,
	settings = {
		svelte = {
			plugin = {
				svelte = {
					compilerWarnings = {
						-- Example: turn a warning into an error or ignore it
						-- "unused-export-let" = "ignore",
					},
				},
				css = {
					validate = true,
				},
				typescript = {
					validate = true,
				},
			},
		},
	},
}
