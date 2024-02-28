local M = {
  "williamboman/mason-lspconfig.nvim",
  dependencies = {
    "williamboman/mason.nvim",
    "nvim-lua/plenary.nvim",
    "jay-babu/mason-nvim-dap.nvim",
  },
}

function M.config()
  require("mason").setup({
    ui = {
      border = "rounded",
    },
  })
  require("mason-lspconfig").setup({
    ensure_installed = {
      "lua_ls",
      "cssls",
      "html",
      "tsserver",
      "astro",
      "pyright",
      "bashls",
      "jsonls",
      "yamlls",
      "marksman",
      "tailwindcss",
    },
  })
  require("mason-nvim-dap").setup({
    ensure_installed = {
      "js",
    },
  })
end

return M
