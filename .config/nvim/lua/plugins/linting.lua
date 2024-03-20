local M = {
  "mfussenegger/nvim-lint",
  lazy = true,
  event = { "BufReadPre", "BufNewFile" }, -- to disable, comment this out
}

function M.config()
  local lint = require("lint")

  lint.linters_by_ft = {
    javascript = { "biomejs" },
    typescript = { "biomejs" },
    javascriptreact = { "biomejs" },
    typescriptreact = { "biomejs" },
    python = { "pylint" },
  }

  local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })
  vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
    group = lint_augroup,
    callback = function()
      lint.try_lint(nil, { ignore_errors = true })
    end,
  })

  vim.keymap.set("n", "<leader>ll", function()
    lint.try_lint()
  end)
end

return M
