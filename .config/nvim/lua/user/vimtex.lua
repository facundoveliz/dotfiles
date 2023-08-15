local M = {
  "lervag/vimtex",
  event = { "VimEnter", "InsertEnter", "BufReadPre", "BufAdd", "BufNew", "BufReadPost" },
}

function M.config()
  vim.g.matchup_override_vimtex = 1
  vim.g.matchup_matchparen_deferred = 1
  vim.g.vimtex_matchparen_enabled = 0
end

return M
