return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local harpoon = require('harpoon')
    harpoon:setup({})
  end,

  keys = {
    { "<leader>A", function() require("harpoon"):list():add() end },
    {
      "<leader>a", function()
      local harpoon = require("harpoon")
      harpoon.ui:toggle_quick_menu(harpoon:list())
    end
    },
    { "<a-1>",     function() require("harpoon"):list():select(1) end },
    { "<a-2>",     function() require("harpoon"):list():select(2) end },
    { "<a-3>",     function() require("harpoon"):list():select(3) end },
    { "<a-4>",     function() require("harpoon"):list():select(4) end },
    { "<a-5>",     function() require("harpoon"):list():select(5) end },

    { "<a-n>",     function() require("harpoon"):list():next() end },
    { "<a-p>",     function() require("harpoon"):list():prev() end },
  }
}
