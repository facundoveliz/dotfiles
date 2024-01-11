local M = {
	"rebelot/kanagawa.nvim",
	lazy = false, -- make sure we load this during startup if it is your main colorscheme
	priority = 1000, -- make sure to load this before all the other start plugins
	build = "KanagawaCompile",
}

function M.config()
	vim.cmd.colorscheme("kanagawa")
	require("kanagawa").setup({
		commentStyle = { italic = true },
		statementStyle = { bold = true },
		colors = {
			palette = {
				sumiInk0 = "#000000",
				sumiInk1 = "#000000",
				sumiInk2 = "#000000",
				sumiInk3 = "#000000",
				sumiInk4 = "#000000",
				sumiInk5 = "#000000",
			},
		},
		-- 	overrides = function(colors)
		-- 		local theme = colors.theme
		-- 		return {
		-- 			Pmenu = { fg = theme.ui.shade0, bg = theme.ui.bg_p1 }, -- add `blend = vim.o.pumblend` to enable transparency
		-- 			PmenuSel = { fg = "NONE", bg = theme.ui.bg_p2 },
		-- 			PmenuSbar = { bg = theme.ui.bg_m1 },
		-- 			-- PmenuThumb = { bg = theme.ui.bg_p2 },
		-- 			NormalFloat = { bg = "none" },
		-- 			FloatBorder = { bg = "none" },
		-- 			FloatTitle = { bg = "none" },
		--
		-- 			-- Save an hlgroup with dark background and dimmed foreground
		-- 			-- so that you can use it where your still want darker windows.
		-- 			-- E.g.: autocmd TermOpen * setlocal winhighlight=Normal:NormalDark
		-- 			NormalDark = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m3 },
		--
		-- 			-- Popular plugins that open floats will link to NormalFloat by default;
		-- 			-- set their background accordingly if you wish to keep them dark and borderless
		-- 			LazyNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
		-- 			MasonNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
		-- 		}
		-- 	end,
	})
	vim.schedule(vim.cmd.KanagawaCompile)
end

return M
