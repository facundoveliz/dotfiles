local M = {
  "Mofiqul/vscode.nvim",
  lazy = false,   -- make sure we load this during startup if it is your main colorscheme
  priority = 1000, -- make sure to load this before all the other start plugins
}

function M.config()
  local c = require("vscode.colors").get_colors()
  require("vscode").setup({
    -- Alternatively set style in setup
    -- style = 'light'

    -- Enable transparent background
    transparent = false,

    -- Enable italic comment
    italic_comments = true,

    -- Disable nvim-tree background color
    disable_nvimtree_bg = true,

    -- Override colors (see ./lua/vscode/colors.lua)
    color_overrides = {
      vscLineNumber = "#FFFFFF",
    },
  })
  require("vscode").load()
end

return M
