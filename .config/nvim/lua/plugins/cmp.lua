return {
	{
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		dependencies = {
			{
				"hrsh7th/cmp-nvim-lsp",
				event = "InsertEnter",
			},
			{
				"hrsh7th/cmp-buffer",
				event = "InsertEnter",
			},
			{
				"hrsh7th/cmp-path",
				event = "InsertEnter",
			},
			{
				"hrsh7th/cmp-cmdline",
				event = "InsertEnter",
			},
			{
				"saadparwaiz1/cmp_luasnip",
				event = "InsertEnter",
			},
			{
				"L3MON4D3/LuaSnip",
				event = "InsertEnter",
				dependencies = {
					"rafamadriz/friendly-snippets",
				},
			},
			{
				"hrsh7th/cmp-nvim-lua",
			},
		},
		config = function()
			local cmp = require("cmp")
			local luasnip = require("luasnip")
			require("luasnip/loaders/from_vscode").lazy_load()
			require("luasnip").filetype_extend("typescript", { "typescript" })
			require("luasnip").filetype_extend("svelte", { "svelte" })

			cmp.setup({
				snippet = {
					expand = function(args)
						luasnip.lsp_expand(args.body)
					end,
				},
				mapping = cmp.mapping.preset.insert({
					["<C-k>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "c" }),
					["<C-j>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "c" }),
					["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
					["<C-e>"] = cmp.mapping({ i = cmp.mapping.abort(), c = cmp.mapping.close() }),
					["<CR>"] = cmp.mapping.confirm({ select = false }),
					["<Tab>"] = cmp.mapping(function(fallback)
						if luasnip.expandable() then
							luasnip.expand()
						elseif luasnip.expand_or_jumpable() then
							luasnip.expand_or_jump()
						else
							fallback()
						end
					end, { "i", "s" }),
					["<S-Tab>"] = cmp.mapping(function(fallback)
						if luasnip.jumpable(-1) then
							luasnip.jump(-1)
						else
							fallback()
						end
					end, { "i", "s" }),
				}),
				formatting = {
					format = function(entry, vim_item)
						vim_item.menu = ({
							nvim_lsp = "[LSP]",
							luasnip = "[LuaSnip]",
							buffer = "[Buffer]",
							path = "[Path]",
						})[entry.source.name]
						return vim_item
					end,
				},
				sources = {
					{ name = "nvim_lsp" },
					{ name = "luasnip" },
					{ name = "nvim_lua" },
					{ name = "buffer" },
					{ name = "path" },
				},
			})
		end,
	},
	{
		"stevearc/conform.nvim",
		lazy = true,
		event = { "BufReadPost", "BufNewFile" },
		config = function()
			local conform = require("conform")

			require("conform").setup({
				formatters_by_ft = {
					javascript = { "biome" },
					javascriptreact = { "biome" },
					typescript = { "biome" },
					typescriptreact = { "biome" },
					svelte = { "biome" },
					json = { "biome", "yq" },
					lua = { "stylua" },
					markdown = { "markdownlint" },
					vimwiki = { "markdownlint" },
					typst = { "typstfmt" },
					yaml = { "yq" },
          python = { "ruff_format" },
				},
				-- format_on_save = {
				-- 	lsp_format = "fallback",
				-- 	timeout_ms = 500,
				-- },
			})

			vim.keymap.set({ "n", "v" }, "<leader>lf", function()
				conform.format({
					lsp_fallback = true,
					async = false,
					timeout_ms = 1000,
				})
			end)
		end,
	},
	{
		"mfussenegger/nvim-lint",
		lazy = true,
		event = { "BufReadPost", "BufNewFile" },
		config = function()
			local lint = require("lint")

			lint.linters_by_ft = {
				javascript = { "biomejs" },
				typescript = { "biomejs" },
				javascriptreact = { "biomejs" },
				typescriptreact = { "biomejs" },
				markdown = { "markdownlint" },
				vimwiki = { "markdownlint" },
				python = { "ruff" },
			}

			local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })
			vim.api.nvim_create_autocmd({ "BufWritePost" }, {
				group = lint_augroup,
				callback = function()
					lint.try_lint(nil, { ignore_errors = true })
				end,
			})
		end,
	},
}
