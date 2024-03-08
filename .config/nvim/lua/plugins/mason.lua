local M = {
  "williamboman/mason-lspconfig.nvim",
  dependencies = {
    "williamboman/mason.nvim",
    "nvim-lua/plenary.nvim",
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
      "biome",
      "astro",
      "pyright",
      "bashls",
      "jsonls",
      "yamlls",
      "marksman",
      "tailwindcss",
    },
  })
end

return M
