return {
	cmd = { "svelteserver", "--stdio" },
	filetypes = { "svelte" },
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
