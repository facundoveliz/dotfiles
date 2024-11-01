return {
	"nvim-tree/nvim-tree.lua",
	version = "*",
	lazy = false,
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		require("nvim-tree").setup({
      reload_on_bufenter = false,
			view = {
				number = true,
				relativenumber = true,
        -- side = "right",
				signcolumn = "yes",
				width = 45,
				preserve_window_proportions = true,
			},
		})
	end,
}
