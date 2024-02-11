local M = {
  "nvimtools/none-ls.nvim",
}

function M.config()
  local null_ls = require "null-ls"

  local formatting = null_ls.builtins.formatting
  local diagnostics = null_ls.builtins.diagnostics

  null_ls.setup {
    sources = {
      formatting.stylua,
      formatting.prettierd.with({
        extra_filetypes = { "toml" },
      }),
      formatting.eslint_d,
      formatting.black,
      formatting.xmlformat,
      diagnostics.eslint_d
    },
  }
end

return M
