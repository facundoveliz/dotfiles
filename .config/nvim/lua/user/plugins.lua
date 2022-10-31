local fn = vim.fn

-- automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

-- plugins
return packer.startup(function(use)
	-- general
	use("wbthomason/packer.nvim") -- have packer manage itself
	use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" }) -- colorizer
	use("windwp/nvim-autopairs") -- autoclose
	use({
		"kylechui/nvim-surround",
		config = function()
			require("nvim-surround").setup({
				-- Configuration here, or leave empty to use defaults
			})
		end,
	}) -- "surrounds" parentheses, brackets, xml, etc
	use("mattn/emmet-vim") -- html abbreviations
	use("nvim-lualine/lualine.nvim") -- status line in the bottom
	use("akinsho/bufferline.nvim") -- buffer status in the top
	use("kyazdani42/nvim-web-devicons") -- icons for some plugins
	use({
		"chrisbra/Colorizer",
		setup = function()
			vim.g.colorizer_disable_bufleave = 1
		end,
	}) -- color preview
	use("kyazdani42/nvim-tree.lua") -- folder manager
	-- use("andweeb/presence.nvim") -- discord presence
	use("nvim-lua/plenary.nvim") -- useful lua functions dependencies
	use("lewis6991/gitsigns.nvim") -- add git decorations
	use("folke/todo-comments.nvim") -- highlight and search tasks marked in comments
	use({
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end,
	}) -- comment lines easily

	-- telescope
	use("nvim-lua/popup.nvim") -- telescope dependencies
	use("nvim-telescope/telescope.nvim") -- fuzzy finding
	use("jvgrootveld/telescope-zoxide") -- jump between most used directories

	-- completion
	use("hrsh7th/nvim-cmp") -- the completion plugin
	use("hrsh7th/cmp-buffer") -- buffer completions
	use("hrsh7th/cmp-path") -- path completions
	use("hrsh7th/cmp-cmdline") -- cmdline completions
	use("hrsh7th/cmp-nvim-lsp") -- autoimport, expanding snippets, etc
	use("hrsh7th/cmp-nvim-lua") -- lua nvim completions
	use("saadparwaiz1/cmp_luasnip") -- snippet completions

	-- snippets
	use("L3MON4D3/LuaSnip") --snippet engine
	use("rafamadriz/friendly-snippets") -- a bunch of snippets to use

	-- LSP
	use("neovim/nvim-lspconfig") -- enable LSP
	use("williamboman/nvim-lsp-installer") -- simple to use language server installer
	use("jose-elias-alvarez/null-ls.nvim") -- linters and diagnostics

	-- colorschemes
	use("overcache/NeoSolarized")
	use("ellisonleao/gruvbox.nvim")
	use("rebelot/kanagawa.nvim")
	use("nanotech/jellybeans.vim")
	use("tomasiser/vim-code-dark")
	use("folke/tokyonight.nvim")
	use("catppuccin/nvim")

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
