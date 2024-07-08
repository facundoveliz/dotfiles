return {
	"stevearc/oil.nvim",
	opts = {
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
	},
	dependencies = { "nvim-tree/nvim-web-devicons" },
	keys = { { "<leader>e", "<cmd>Oil<cr>" } },
}
