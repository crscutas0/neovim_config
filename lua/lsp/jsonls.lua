return {
	cmd = { "vscode-json-languageserver", "--stdio" },
	filetypes = { "json", "jsonc" },
	settings = {
		json = {
			schemas = {
				{
					fileMatch = { "/package.json" },
					url = "https://json.schemastore.org/package",
				},
			},
			validate = { enable = true },
		},
	},
}
