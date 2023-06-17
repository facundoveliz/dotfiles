local M = {
  "EdenEast/nightfox.nvim",
  lazy = false,
  priority = 1000,
}

-- local M = {
-- 	"RRethy/nvim-base16",
-- 	lazy = false,
-- 	priority = 1000,
-- }

M.name = "carbonfox"

function M.config()
  local status_ok, _ = pcall(vim.cmd.colorscheme, M.name)
  if not status_ok then
    return
  end
end

return M
