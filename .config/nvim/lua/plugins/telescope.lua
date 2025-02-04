return {
	"nvim-telescope/telescope.nvim",
	dependencies = { { "nvim-telescope/telescope-fzf-native.nvim", build = "make", lazy = true } },
	cmd = "Telescope",
	config = function()
		require("telescope").setup({
			defaults = {
				file_ignore_patterns = { "*.stfolder/", "*.stversions/" },
				layout_strategy = "vertical",
				mappings = {
					i = {
						["<C-j>"] = require("telescope.actions").move_selection_next,
						["<C-k>"] = require("telescope.actions").move_selection_previous,
					},
				},
			},
			extensions = {
				fzf = {},
			},
		})
		pcall(require("telescope").load_extension, "fzf")
	end,
	keys = {
		{ "<leader>ff", "<cmd>Telescope find_files hidden=true follow=true<cr>" },
		{ "<leader>fg", "<cmd>Telescope live_grep hidden=true<cr>" },
		{ "<leader>fh", "<cmd>Telescope help_tags<cr>" },
		{ "<leader>fr", "<cmd>Telescope resume<cr>" },
		{ "<leader>fo", "<cmd>Telescope oldfiles hidden=true<cr>" },
		{ "<leader>fk", "<cmd>Telescope keymaps<cr>" },
	},
}
