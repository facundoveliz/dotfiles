return {
	{
		"nvim-treesitter/nvim-treesitter",
		event = { "BufReadPost", "BufNewFile" },
		build = ":TSUpdate",
		dependencies = {
			{
				"nvim-treesitter/nvim-treesitter-textobjects",
				event = { "BufReadPost", "BufNewFile" },
			},
			{
				"nvim-tree/nvim-web-devicons",
				event = { "BufReadPost", "BufNewFile" },
			},
			{
				"windwp/nvim-autopairs",
				event = "InsertEnter",
				config = true,
			},
		},
		config = function()
			require("nvim-treesitter.configs").setup({
				auto_install = true,
				highlight = {
					enable = true,
					additional_vim_regex_highlighting = false,
				},
				indent = { enable = true },
				autopairs = { enable = true },
			})
		end,
	},
	{
		"JoosepAlviste/nvim-ts-context-commentstring",
		event = { "BufReadPost", "BufNewFile" },
	},
	{
		"windwp/nvim-ts-autotag",
		event = { "BufReadPost", "BufNewFile" },
		config = function()
			require("nvim-ts-autotag").setup()
		end,
	},
	{
		"kylechui/nvim-surround",
		event = { "BufReadPost", "BufNewFile" },
		config = true,
	},
	{ -- lightweight plugin to improve foldings
		"chrisgrieser/nvim-origami",
		event = "BufReadPost",
		opts = {},
	},
}
