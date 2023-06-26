local M = {
	"ellisonleao/gruvbox.nvim",
	lazy = false,
	priority = 1000,
}

M.name = "gruvbox"

function M.config()
	vim.o.background = "dark" -- or "light" for light mode
	require("gruvbox").setup({
		contrast = "hard", -- can be "hard", "soft" or empty string
		palette_overrides = {},
		overrides = { SignColumn = { bg = "" } },
	})
	local status_ok, _ = pcall(vim.cmd.colorscheme, M.name)
	if not status_ok then
		return
	end
end

return M
