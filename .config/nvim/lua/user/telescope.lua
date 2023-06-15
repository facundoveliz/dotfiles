local M = {
  "nvim-telescope/telescope.nvim",
  event = "Bufenter",
  cmd = { "Telescope" },
  keys = {
    -- { "<leader>ff", "<cmd>execute 'NeoTreeClose' | Telescope find_files hidden=true<CR>" },
    { "<leader>ff", "<cmd>Telescope find_files hidden=true<CR>" },
    { "<TAB>",      "<cmd>Telescope buffers<CR>" },
    { "<leader>fg", "<cmd>Telescope live_grep hidden=true<CR>" },
    { "<leader>fh", "<cmd>Telescope help_tags<CR>" },
    { "<leader>fo", "<cmd>Telescope oldfiles hidden=true<CR>" },
    { "<leader>fz", "<cmd>Telescope zoxide list<CR>" },
    { "<leader>fr", "<cmd>Telescope resume<CR>" },
  },
  dependencies = {
    "nvim-lua/popup.nvim",
    "jvgrootveld/telescope-zoxide",
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
    },
  },
}

M.opts = {
  function()
    require("telescope").load_extension("fzf")
    require("telescope").load_extension("zoxide")
  end,
  defaults = {
    prompt_prefix = " ",
    selection_caret = " ",
    path_display = { "smart" },
    file_ignore_patterns = { ".git/", "node_modules" },
    mappings = {
      i = {
        ["<C-j>"] = function(...)
          return require("telescope.actions").move_selection_next(...)
        end,
        ["<C-k>"] = function(...)
          return require("telescope.actions").move_selection_previous(...)
        end,
        ["<C-s>"] = function(...)
          return require("telescope.actions").select_horizontal(...)
        end,
        ["<C-v>"] = function(...)
          return require("telescope.actions").select_vertical(...)
        end,
        ["<A-k>"] = function(...)
          return require("telescope.actions").preview_scrolling_up(...)
        end,
        ["<A-j>"] = function(...)
          return require("telescope.actions").preview_scrolling_down(...)
        end,
      },
    },
  },
}

return M
