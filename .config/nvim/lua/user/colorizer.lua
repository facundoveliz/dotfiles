return {
  "chrisbra/Colorizer",
  setup = function() end,
  config = function()
    vim.g.colorizer_auto_filetype = "log"
    vim.g.colorizer_disable_bufleave = 1
  end,
  keys = {
    { "<leader>cc", ":ColorToggle<CR>" },
  },
}
