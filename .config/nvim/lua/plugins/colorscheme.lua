return {
	"Mofiqul/vscode.nvim",
	lazy = false, -- make sure we load this during startup if it is your main colorscheme
	priority = 1000, -- make sure to load this before all the other start plugins
	config = function()
		local c = require("vscode.colors").get_colors()
		require("vscode").setup({
			transparent = false,
			italic_comments = true,
			color_overrides = {
				vscLineNumber = "#FFFFFF",
				vscBack = "#0f0f0f",
        vscDimHighlight = "NONE"
			},
			group_overrides = {
				Whitespace = {
					fg = c.vscDimHighlight,
				},
				NonText = {
					fg = c.vscDimHighlight,
				},
			},
		})
		require("vscode").load()
	end,
}
