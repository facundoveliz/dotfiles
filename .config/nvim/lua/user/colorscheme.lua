local M = {
  "aktersnurra/no-clown-fiesta.nvim",
  lazy = false,
  priority = 1000,
}

-- local M = {
-- 	"RRethy/nvim-base16",
-- 	lazy = false,
-- 	priority = 1000,
-- }

M.name = "no-clown-fiesta"

function M.config()
  local status_ok, _ = pcall(vim.cmd.colorscheme, M.name)
  if not status_ok then
    return
  end
end

return M
