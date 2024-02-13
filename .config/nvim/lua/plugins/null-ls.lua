local M = {
	"nvimtools/none-ls.nvim",
}

function M.config()
	local null_ls = require("null-ls")

	local formatting = null_ls.builtins.formatting

	null_ls.setup({
		sources = {
			formatting.stylua,
			formatting.prettierd.with({
				condition = function(utils)
					return utils.has_file({ ".prettierrc.js" })
				end,
			}),
			-- formatting.eslint_d,
			formatting.black,
			formatting.xmlformat,
		},
	})
end

return M
