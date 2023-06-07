vim.g.jellybeans_overrides = {
	SignColumn = { ctermbg = "none", guibg = "none" },
}

local colorscheme = "oxocarbon"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
	vim.notify("colorscheme " .. colorscheme .. " not found!")
	return
end

-- remove background of floating windows
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "None", fg = "None" })
vim.api.nvim_set_hl(0, "FloatBorder", { bg = "None" })

vim.g.colorizer_disable_bufleave = 1

-- remove background color for fold column
vim.api.nvim_set_hl(0, "Folded", { bg = "None" })

-- remove color bg from signs column
vim.api.nvim_set_hl(0, "SignColumn", { bg = "None", ctermbg = 0 })
vim.api.nvim_set_hl(0, "CursorLineSign", { bg = "None", ctermbg = 0 })

-- thinner/invisible split divider (depends on theme)
-- vim.api.nvim_set_hl(0, "VertSplit", { guibg = "None", ctermbg = 00 })
vim.api.nvim_set_hl(0, "VertSplit", { bg = "None", ctermbg = 0 })
