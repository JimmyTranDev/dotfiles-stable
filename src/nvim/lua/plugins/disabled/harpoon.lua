return {
  'ThePrimeagen/harpoon',
  keys = {
    { mode = 'n', '<leader>hh', function() require("harpoon.mark").add_file() end,        silent = true, desc = "Harpoon Add" },
    { mode = 'n', "<leader>hm", function() require("harpoon.ui").toggle_quick_menu() end, silent = true, desc = "Harpoon Menu" },
    { mode = 'n', "<leader>h1", function() require("harpoon.ui").nav_file(1) end,         silent = true, desc = "Harpoon 1" },
    { mode = 'n', "<leader>h2", function() require("harpoon.ui").nav_file(2) end,         silent = true, desc = "Harpoon 2" },
    { mode = 'n', "<leader>h3", function() require("harpoon.ui").nav_file(3) end,         silent = true, desc = "Harpoon 3" },
    { mode = 'n', "<leader>h4", function() require("harpoon.ui").nav_file(4) end,         silent = true, desc = "Harpoon 4" },
    { mode = 'n', "<leader>h5", function() require("harpoon.ui").nav_file(5) end,         silent = true, desc = "Harpoon 5" },
    { mode = 'n', "<leader>h6", function() require("harpoon.ui").nav_file(6) end,         silent = true, desc = "Harpoon 6" },
    { mode = 'n', "<leader>h7", function() require("harpoon.ui").nav_file(7) end,         silent = true, desc = "Harpoon 7" },
    { mode = 'n', "<leader>h8", function() require("harpoon.ui").nav_file(8) end,         silent = true, desc = "Harpoon 8" },
    { mode = 'n', "<leader>h9", function() require("harpoon.ui").nav_file(9) end,         silent = true, desc = "Harpoon 9" },
  },
  config = function()
    require("harpoon").setup {
      -- sets the marks upon calling `toggle` on the ui, instead of require `:w`.
      save_on_toggle = false,

      -- saves the harpoon file upon every change. disabling is unrecommended.
      save_on_change = true,

      -- sets harpoon to run the command immediately as it's passed to the terminal when calling `sendCommand`.
      enter_on_sendcmd = false,

      -- closes any tmux windows harpoon that harpoon creates when you close Neovim.
      tmux_autoclose_windows = false,

      -- filetypes that you want to prevent from adding to the harpoon list menu.
      excluded_filetypes = { "harpoon" },

      -- set marks specific to each git branch inside git repository
      mark_branch = false,

      -- enable tabline with harpoon marks
      tabline = true,
      tabline_prefix = "   ",
      tabline_suffix = "   ",
    }
  end
}
