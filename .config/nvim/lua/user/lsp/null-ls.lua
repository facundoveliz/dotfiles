local null = require("null-ls")
local mason = require("mason-null-ls")

local fmt = null.builtins.formatting
local dgn = null.builtins.diagnostics

mason.setup({
	ensure_installed = {
		"prettierd",
		"eslint_d",
    "stylua",
	},
})

null.setup({
	sources = {
		fmt.trim_whitespace.with({
			filetypes = { "text", "sh", "zsh", "toml", "make", "conf", "tmux" },
		}),
		fmt.prettierd,
		fmt.eslint_d,
		fmt.stylua,
	},
})
