return {
	"stevearc/oil.nvim",
	opts = {},
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("oil").setup({
			columns = { "icon" },
			view_options = {
				show_hidden = false,
				is_hidden_file = function(name, bufnr)
					return vim.endswith(".", name)
				end,
				is_always_hidden = function(name)
					return name == ".."
				end,
			},
			delete_to_trash = true,
			keymaps = {
				["<C-l>"] = "actions.select",
				["<C-v>"] = { "actions.select", opts = { vertical = true } },
				["<C-h>"] = { "actions.select", opts = { horizontal = true } },
				["<space>e"] = "actions.close",
			},
		})

		-- open parent directory in current window
		vim.keymap.set("n", "<space>e", "<CMD>Oil<CR>")
	end,
}
