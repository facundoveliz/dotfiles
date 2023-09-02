local M = {
  "jose-elias-alvarez/null-ls.nvim",
  event = "BufReadPre",
  dependencies = {
    {
      "nvim-lua/plenary.nvim",
      lazy = true,
    },
  },
}

function M.config()
  local null_ls = require("null-ls")
  local formatting = null_ls.builtins.formatting
  local diagnostics = null_ls.builtins.diagnostics

  null_ls.setup({
    debug = false,
    sources = {
      formatting.prettierd.with({
        extra_filetypes = { "toml" },
      }),
      formatting.black.with({ extra_args = { "--fast" } }),
      formatting.stylua,
      formatting.eslint,
      diagnostics.eslint,
    },
  })
end

return M
