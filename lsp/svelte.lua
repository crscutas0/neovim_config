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
					compilerWarnings = {},
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
