return {
	cmd = { "gopls" },
	filetypes = { "go", "gomod", "gowork", "gotmpl" },
	settings = {
		gopls = {
			analyses = {
				unusedparams = true,
				nilness = true,
				shadow = true,
			},
			staticcheck = true,
		},
	},
}
