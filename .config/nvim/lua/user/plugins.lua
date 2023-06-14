local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	-- LSP
	"williamboman/mason.nvim", --simple to use language server installer
	"williamboman/mason-lspconfig.nvim",
	"neovim/nvim-lspconfig", --enable LSP
	"jose-elias-alvarez/null-ls.nvim", --linters and diagnostics
	"jay-babu/mason-null-ls.nvim", -- null-ls installer

	-- completion
	"hrsh7th/nvim-cmp", --the completion plugin
	"hrsh7th/cmp-buffer", --buffer completions
	"hrsh7th/cmp-path", --path completions
	"hrsh7th/cmp-cmdline", --cmdline completions
	"hrsh7th/cmp-nvim-lsp", --autoimport, expanding snippets, etc
	"hrsh7th/cmp-nvim-lua", --lua nvim completions
	"saadparwaiz1/cmp_luasnip", --snippet completions

	-- snippets
	"L3MON4D3/LuaSnip", --snippet engine
	"rafamadriz/friendly-snippets", --a bunch of snippets to use

	-- telescope
	{
		"nvim-telescope/telescope.nvim",
		cmd = "Telescope",
		dependencies = "nvim-lua/popup.nvim",
		keys = {
			-- { "<leader>ff", "<cmd>execute 'NeoTreeClose' | Telescope find_files hidden=true<CR>" },
			{ "<leader>ff", "<cmd>Telescope find_files hidden=true<CR>" },
			{ "<TAB>", "<cmd>Telescope buffers<CR>" },
			{ "<leader>fg", "<cmd>Telescope live_grep hidden=true<CR>" },
			{ "<leader>fh", "<cmd>Telescope help_tags<CR>" },
			{ "<leader>fo", "<cmd>Telescope oldfiles hidden=true<CR>" },
			{ "<leader>fz", "<cmd>Telescope zoxide list<CR>" },
			{ "<leader>fr", "<cmd>Telescope resume<CR>" },
		},
		opts = {
			function()
				require("telescope").load_extension("fzf")
				require("telescope").load_extension("zoxide")
			end,
			defaults = {
				mappings = {
					i = {
						["<C-n>"] = function(...)
							return require("telescope.actions").cycle_history_next(...)
						end,
						["<C-p>"] = function(...)
							return require("telescope.actions").cycle_history_prev(...)
						end,
						["<C-j>"] = function(...)
							return require("telescope.actions").move_selection_next(...)
						end,
						["<C-k>"] = function(...)
							return require("telescope.actions").move_selection_previous(...)
						end,
						["<C-s>"] = function(...)
							return require("telescope.actions").select_horizontal(...)
						end,
						["<C-v>"] = function(...)
							return require("telescope.actions").select_vertical(...)
						end,
						["<A-k>"] = function(...)
							return require("telescope.actions").preview_scrolling_up(...)
						end,
						["<A-j>"] = function(...)
							return require("telescope.actions").preview_scrolling_down(...)
						end,
					},
				},
			},
		},
	},
	{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" }, -- fzf plugin
	"jvgrootveld/telescope-zoxide", --jump between most used directories

	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		event = { "BufReadPost", "BufNewFile" },
		opts = {
			highlight = { enable = true },
			ensure_installed = {
				"bash",
				"help",
				"html",
				"javascript",
				"tsx",
				"typescript",
				"json",
				"lua",
				"markdown",
				"markdown_inline",
				"python",
				"query",
				"regex",
				"vim",
				"yaml",
			},
		},
		config = function(_, opts)
			require("nvim-treesitter.configs").setup(opts)
		end,
	},

	{
		"nvim-lualine/lualine.nvim",
		event = "VeryLazy",
		opts = {
			options = {
				disabled_filetypes = { "neo-tree", "Outline" },
				theme = "auto",
				icons_enabled = false,
				component_separators = { left = "", right = "" },
				section_separators = { left = "", right = "" },
			},
			sections = {
				lualine_a = { "mode" },
				lualine_b = { "branch" },
				lualine_c = { "filename" },

				lualine_x = { "filetype" },
				lualine_y = { "progress" },
				lualine_z = { "location" },
			},
		},

		-- indent guides for Neovim
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		event = { "BufReadPost", "BufNewFile" },
		opts = {
			char = "│",
			filetype_exclude = { "help", "alpha", "dashboard", "neo-tree", "Trouble", "lazy" },
			show_trailing_blankline_indent = false,
			show_current_context = false,
		},
	},

	{ "windwp/nvim-autopairs", config = true },

	--html abbreviations
	{ "mattn/emmet-vim", event = "VeryLazy" },

	--"surrounds" parentheses, brackets, xml, etc
	{ "kylechui/nvim-surround", event = "VeryLazy", config = true },

	--color preview
	{
		"chrisbra/Colorizer",
		setup = function() end,
		keys = {
			{ "<leader>cc", ":ColorToggle<CR>" },
		},
	},

	--comment lines easily
	{ "numToStr/Comment.nvim", config = true },

	--highlight and search tasks marked in comments
	{
		"folke/todo-comments.nvim",
		cmd = { "TodoTrouble", "TodoTelescope" },
		event = { "BufReadPost", "BufNewFile" },
		config = true,
		keys = {
			{ "<leader>ft", "<cmd>TodoTelescope<CR>" },
		},
	},

	-- file explorer
	{
		"nvim-neo-tree/neo-tree.nvim",
		keys = {
			{ "<C-b>", ":NeoTreeFocusToggle<CR>" },
		},
		init = function()
			if vim.fn.argc() == 1 then
				local stat = vim.loop.fs_stat(vim.fn.argv(0))
				if stat and stat.type == "directory" then
					require("neo-tree")
				end
			end
		end,
		deactivate = function()
			vim.cmd([[Neotree close]])
		end,
		opts = {
			hide_by_name = {
				"node_modules",
			},
			window = {
				mappings = {
					["o"] = "open",
					["s"] = "open_split",
					["v"] = "open_vsplit",
				},
			},
		},
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
			"MunifTanjim/nui.nvim",
		},
	},

	{
		"romgrk/barbar.nvim",
		dependencies = {
			"lewis6991/gitsigns.nvim", -- OPTIONAL: for git status
			"nvim-tree/nvim-web-devicons", -- OPTIONAL: for file icons
		},
		init = function()
			vim.g.barbar_auto_setup = false
		end,
		opts = {
			animation = false,
			custom_colors = false,
			icons = {
				button = "",
				inactive = {
					separator = {
						left = "",
						right = "",
					},
				},
				separator = {
					left = "",
					right = "",
				},
				separator_at_end = false,
			},
			sidebar_filetypes = {
				undotree = { text = "undotree" },
				["neo-tree"] = { event = "BufWipeout" },
			},
			filetype = {
				enabled = true,
			},
		},
	},

	{ "ziontee113/color-picker.nvim", keys = {
		{ "<leader>pc", "<cmd>PickColor<cr>" },
	}, config = true },

	-- better diagnostics list and others
	{
		"folke/trouble.nvim",
		dependencies = "nvim-tree/nvim-web-devicons",
		event = VeryLazy,
		config = true,
		cmd = { "TroubleToggle", "Trouble" },
		opts = { use_diagnostic_signs = true },
		keys = {
			{ "<leader>xx", "<cmd>TroubleToggle document_diagnostics<cr>", desc = "Document Diagnostics (Trouble)" },
			{ "<leader>xX", "<cmd>TroubleToggle workspace_diagnostics<cr>", desc = "Workspace Diagnostics (Trouble)" },
			{ "<leader>xL", "<cmd>TroubleToggle loclist<cr>", desc = "Location List (Trouble)" },
			{ "<leader>xQ", "<cmd>TroubleToggle quickfix<cr>", desc = "Quickfix List (Trouble)" },
		},
	},

	-- search/replace in multiple files
	{
		"windwp/nvim-spectre",
		keys = { {
			"<leader>sr",
			function()
				require("spectre").open()
			end,
		} },
	},

	{ "mbbill/undotree", keys = {
		{
			"<leader>ut",
			function()
				vim.cmd([[UndotreeToggle]])
			end,
		},
	} },

	-- colorschemes
	{ "nanotech/jellybeans.vim", lazy = true },
	{ "rose-pine/neovim", lazy = true },
	{ "rebelot/kanagawa.nvim", lazy = true },
	{ "nyoom-engineering/oxocarbon.nvim", lazy = true },
	{ "Everblush/nvim", lazy = true },
	{ "Mofiqul/vscode.nvim", lazy = false },
	{
		"ellisonleao/gruvbox.nvim",
		config = true,
		lazy = true,
		opts = {
			contrast = "hard", -- can be "hard", "soft" or empty string
		},
	},
})
