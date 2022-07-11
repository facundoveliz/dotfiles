local nls = require("null-ls")
local U = require("user.lsp.utils")

local fmt = nls.builtins.formatting
local dgn = nls.builtins.diagnostics

nls.setup({
	sources = {
		fmt.trim_whitespace.with({
			filetypes = { "text", "sh", "zsh", "toml", "make", "conf", "tmux" },
		}),
		fmt.prettierd,
		fmt.eslint_d,
		-- fmt.prettier.with({
		-- 	extra_args = {
		-- 		"--tab-width=4",
		-- 		"--trailing-comma=es5",
		-- 		"--end-of-line=lf",
		-- 		"--arrow-parens=always",
		-- 	},
		-- }),
		fmt.rustfmt,
		fmt.stylua,
		fmt.gofmt,
		dgn.eslint_d,
		-- dgn.shellcheck,
		dgn.luacheck.with({
			extra_args = { "--globals", "vim", "--std", "luajit" },
		}),
	},
	on_attach = function(client)
		U.fmt_on_save(client)
	end,
})
