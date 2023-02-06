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
	-- general
	{ "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" }, --colorizer
	"nvim-lualine/lualine.nvim", --status line in the bottom
	"akinsho/bufferline.nvim", --buffer status in the top
	"windwp/nvim-autopairs", --autoclose
	"mattn/emmet-vim", --html abbreviations
	{
		"kylechui/nvim-surround",
		config = function()
			require("nvim-surround").setup()
		end,
	}, --"surrounds" parentheses, brackets, xml, etc
	{
		"chrisbra/Colorizer",
		setup = function()
			vim.g.colorizer_disable_bufleave = 1
		end,
	}, --color preview
	{
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end,
	}, --comment lines easily
	{
		"folke/todo-comments.nvim",
		config = function()
			require("todo-comments").setup()
		end,
	}, --highlight and search tasks marked in comments
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v2.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
			"MunifTanjim/nui.nvim",
      {
        -- only needed if you want to use the commands with "_with_window_picker" suffix
        's1n7ax/nvim-window-picker',
        tag = "v1.*",
        config = function()
          require'window-picker'.setup({
            autoselect_one = false,
            include_current = false,
            filter_rules = {
              -- filter using buffer options
              bo = {
                -- if the file type is one of following, the window will be ignored
                filetype = { 'neo-tree', "neo-tree-popup", "notify" },

                -- if the buffer type is one of following, the window will be ignored
                buftype = { 'terminal', "quickfix" },
              },
            },
            other_win_hl_color = '#e35e4f',
          })
        end,
      }
		},
	},
	"ziontee113/color-picker.nvim", --color picker
	"iamcco/markdown-preview.nvim", --md preview

	-- LSP
	"neovim/nvim-lspconfig", --enable LSP
	"williamboman/nvim-lsp-installer", --simple to use language server installer
	"jose-elias-alvarez/null-ls.nvim", --linters and diagnostics

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
	"nvim-lua/popup.nvim", --telescope dependencies
	"nvim-telescope/telescope.nvim", --fuzzy finding
	{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" }, -- fzf plugin
	"jvgrootveld/telescope-zoxide", --jump between most used directories

	-- colorschemes
	"nanotech/jellybeans.vim",
})
