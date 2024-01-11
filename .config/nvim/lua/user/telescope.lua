local M = {
	"nvim-telescope/telescope.nvim",
	dependencies = { { "nvim-telescope/telescope-fzf-native.nvim", build = "make", lazy = true } },
	cmd = "Telescope",
	keys = {
		{ "<leader>ff", "<cmd>Telescope find_files hidden=true follow=true<cr>", desc = "Neotree toggle filesystem" },
		{ "<leader>fg", "<cmd>Telescope live_grep hidden=true<cr>", desc = "Neotree toggle filesystem" },
		{ "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Neotree toggle filesystem" },
		{ "<leader>fr", "<cmd>Telescope resume<cr>", desc = "Neotree toggle filesystem" },
		{ "<leader>fo", "<cmd>Telescope oldfiles hidden=true<cr>", desc = "Neotree toggle filesystem" },
		{ "<leader>fk", "<cmd>Telescope keymaps<cr>", desc = "Neotree toggle filesystem" },
	},
}

function M.config()
	local icons = require("user.icons")
	local actions = require("telescope.actions")

	require("telescope").setup({
		defaults = {
			prompt_prefix = icons.ui.Telescope .. " ",
			selection_caret = icons.ui.Forward .. " ",
			entry_prefix = "   ",
			initial_mode = "insert",
			selection_strategy = "reset",
			path_display = { "smart" },
			color_devicons = true,
			set_env = { ["COLORTERM"] = "truecolor" },
			sorting_strategy = nil,
			layout_strategy = nil,
			layout_config = {},
			vimgrep_arguments = {
				"rg",
				"--color=never",
				"--no-heading",
				"--with-filename",
				"--line-number",
				"--column",
				"--smart-case",
				"--hidden",
				"--glob=!.git/",
			},

			mappings = {
				i = {
					["<C-n>"] = actions.cycle_history_next,
					["<C-p>"] = actions.cycle_history_prev,

					["<C-j>"] = actions.move_selection_next,
					["<C-k>"] = actions.move_selection_previous,
				},
				n = {
					["<esc>"] = actions.close,
					["j"] = actions.move_selection_next,
					["k"] = actions.move_selection_previous,
					["q"] = actions.close,
				},
			},
		},
		pickers = {
			find_files = {
				theme = "dropdown",
			},
			live_grep = {
				theme = "dropdown",
			},
		},
		extensions = {
			fzf = {
				fuzzy = true, -- false will only do exact matching
				override_generic_sorter = true, -- override the generic sorter
				override_file_sorter = true, -- override the file sorter
				case_mode = "smart_case", -- or "ignore_case" or "respect_case"
			},
		},
	})
end

return M
