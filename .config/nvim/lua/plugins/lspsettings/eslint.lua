return {
	settings = {
		enable = true,
		format = { enable = true },
		packageManager = "yarn",
		workingDirectories = { mode = "auto" },
		lintTask = {
			enable = true,
		},
	},
	on_attach = function(_, bufnr)
		vim.api.nvim_create_autocmd("BufWritePre", {
			buffer = bufnr,
			command = "EslintFixAll",
		})
	end,
}
