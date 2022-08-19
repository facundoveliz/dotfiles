-- gruvbox
vim.g.gruvbox_contrast_dark = "hard"
vim.g.gruvbox_contrast_light = "hard"
vim.g.gruvbox_sign_column = "bg0"
vim.g.gruvbox_number_column = "bg0"
vim.g.gruvbox_transparent_bg = 1

-- jellybeans
vim.g.jellybeans_overrides = {
	SignColumn = { ctermbg = "none", guibg = "none" },
}

-- tokyonight
vim.g.tokyonight_style = "night"
vim.g.tokyonight_italic_functions = true

-- ayu
vim.g.ayucolor = "mirage"

-- rose-pine
-- require("rose-pine").setup({
-- 	dark_variant = "dark",
-- })

vim.o.background = "dark"

local colorscheme = "jellybeans"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
	vim.notify("colorscheme " .. colorscheme .. " not found!")
	return
end

-- color customization

-- line numbers stand out more
vim.highlight.link("LineNr", "Comment", true)

-- remove background of floating windows
vim.highlight.create("NormalFloat", { guibg = "None", guifg = "None" }, false)
vim.highlight.create("FloatBorder", { guibg = "None" }, false)

-- remove background color for fold column
vim.highlight.create("Folded", { guibg = "None" })
-- remove background color for fold column
vim.highlight.link("FoldColumn", "Normal")

-- thinner/invisible split divider (depends on theme)
vim.highlight.create("VertSplit", { guibg = "None", ctermbg = 00 })

-- remove background of pmenu
vim.highlight.create("Pmenu", { guibg = "None", ctermbg = 00 })
vim.highlight.create("PmenuSbar", { guibg = "None", ctermbg = 00 })
vim.highlight.create("PmenuThumb", { guibg = "None", ctermbg = 00 })

-- make git blame signs behave like comments
vim.highlight.link("GitSignsCurrentLineBlame", "Comment", true)

-- make comments italic
vim.highlight.create("Comment", { gui = "italic", cterm = "italic" }, false)

-- set the color of the vertical split bar to transparent
vim.highlight.create("VertSplit", { ctermbg = 00 })
