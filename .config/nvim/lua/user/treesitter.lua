local M = {
	"nvim-treesitter/nvim-treesitter",
	event = "BufReadPost, BufNewFile",
	dependencies = {
		{
			"JoosepAlviste/nvim-ts-context-commentstring",
			event = "VeryLazy",
		},
		{
			"nvim-tree/nvim-web-devicons",
			event = "VeryLazy",
		},
	},
}
function M.config()
	local treesitter = require("nvim-treesitter")
	local configs = require("nvim-treesitter.configs")

	configs.setup({
		ensure_installed = {
			"html",
			"javascript",
			"tsx",
			"typescript",
			"json",
			"lua",
			"markdown",
			"python",
			"query",
			"regex",
			"vim",
			"yaml",
		},
		highlight = {
			enable = true, -- false will disable the whole extension
			disable = { "css" }, -- list of language that will be disabled
		},
		autopairs = {
			enable = true,
		},
		indent = { enable = true, disable = { "python", "css" } },
		context_commentstring = {
			enable = true,
			enable_autocmd = false,
		},
	})
end

return M
