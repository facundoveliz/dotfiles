local M = {
  "nvim-treesitter/nvim-treesitter",
  event = { "BufReadPost", "BufNewFile" },
  build = ":TSUpdate",
  dependencies = {
    {
      "nvim-treesitter/nvim-treesitter-textobjects",
      event = "VeryLazy",
    },
    {
      "JoosepAlviste/nvim-ts-context-commentstring",
      event = "VeryLazy",
    },
    {
      "windwp/nvim-ts-autotag",
      event = "VeryLazy",
    },
    {
      "nvim-tree/nvim-web-devicons",
      event = "VeryLazy",
    },
    {
      "windwp/nvim-autopairs",
      event = "InsertEnter",
    },
  },
}
function M.config()
  require("nvim-treesitter.configs").setup({
    ensure_installed = {
      "lua",
      "javascript",
      "typescript",
      "tsx",
      "markdown",
      "markdown_inline",
      "bash",
      "python",
      "yaml",
    }, -- put the language you want in this array
    context_commentstring = {
      config = {
        javascript = {
          __default = "// %s",
          jsx_element = "{/* %s */}",
          jsx_fragment = "{/* %s */}",
          jsx_attribute = "// %s",
          comment = "// %s",
        },
        typescript = { __default = "// %s", __multiline = "/* %s */" },
      },
    },
    sync_install = false,
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = false,
    },
    indent = { enable = true },
    matchup = {
      enable = { "astro" },
      disable = { "lua" },
    },
    autotag = { enable = true },
    autopairs = { enable = true },
  })
end

return M
