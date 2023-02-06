-- gruvbox
vim.g.gruvbox_contrast_dark = "hard"
vim.g.gruvbox_contrast_light = "hard"
vim.g.gruvbox_sign_column = "bg"
vim.g.gruvbox_number_column = "bg"
vim.g.gruvbox_transparent_bg = 1

-- jellybeans
vim.g.jellybeans_overrides = {
	SignColumn = { ctermbg = "none", guibg = "none" },
}

-- ayu
vim.g.ayucolor = "mirage"

vim.o.background = "dark"

local colorscheme = "jellybeans"
-- vim.cmd("colorscheme gruvbox")
-- vim.api.nvim_set_hl(0, "Normal", { guibg = NONE, ctermbg = NONE }) -- NOTE: Enable only if gruvbox transparency is enabled

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
	vim.notify("colorscheme " .. colorscheme .. " not found!")
	return
end

-- remove background of floating windows
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "None", fg = "None" })
vim.api.nvim_set_hl(0, "FloatBorder", { bg = "None" })

-- remove background color for fold column
vim.api.nvim_set_hl(0, "Folded", { bg = "None" })

-- thinner/invisible split divider (depends on theme)
vim.api.nvim_set_hl(0, "VertSplit", { bg = "None", ctermbg = 0 })

-- remove color bg from signs column
vim.api.nvim_set_hl(0, "SignColumn", { bg = "None", ctermbg = 0 })
vim.api.nvim_set_hl(0, "CursorLineSign", { bg = "None", ctermbg = 0 })

-- remove background of pmenu
vim.api.nvim_set_hl(0, "Pmenu", { bg = "None", ctermbg = 0 })
vim.api.nvim_set_hl(0, "PmenuSbar", { bg = "None", ctermbg = 0 })
vim.api.nvim_set_hl(0, "PmenuThumb", { bg = "None", ctermbg = 0 })

-- set the color of the vertical split bar to transparent
vim.api.nvim_set_hl(0, "VertSplit", { ctermbg = 0 })
