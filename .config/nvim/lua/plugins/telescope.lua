local M = {
  "nvim-telescope/telescope.nvim",
  dependencies = { { "nvim-telescope/telescope-fzf-native.nvim", build = "make", lazy = true } },
  cmd = "Telescope",
  keys = {
    { "<leader>ff", "<cmd>Telescope find_files hidden=true follow=true<cr>", },
    { "<leader>fg", "<cmd>Telescope live_grep hidden=true<cr>", },
    { "<leader>fh", "<cmd>Telescope help_tags<cr>", },
    { "<leader>fr", "<cmd>Telescope resume<cr>", },
    { "<leader>fo", "<cmd>Telescope oldfiles hidden=true<cr>", },
    { "<leader>fk", "<cmd>Telescope keymaps<cr>", },
  },
}

function M.config()
  local actions = require("telescope.actions")

  pcall(require("telescope").load_extension, "fzf")
  pcall(require("telescope").load_extension, "smart_history")
  pcall(require("telescope").load_extension, "ui-select")
  require("telescope").setup({
    defaults = {
      mappings = {
        i = {
          ["<C-n>"] = actions.cycle_history_next,
          ["<C-p>"] = actions.cycle_history_prev,

          ["<C-j>"] = actions.move_selection_next,
          ["<C-k>"] = actions.move_selection_previous,
        },
        n = {
          ["<esc>"] = actions.close,
          ["j"] = actions.move_selection_next,
          ["k"] = actions.move_selection_previous,
          ["q"] = actions.close,
        },
      },
    },
    wrap_results = true,
    extensions = {
      fzf = {},
    },
  })
end

return M
