return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300
  end,
  config = function()
    local wk = require("which-key")
    wk.setup({
      icons = {
        mappings = false
      },
      plugins = {

        marks = false,    -- shows a list of your marks on ' and `
        registers = true, -- shows your registers on " in NORMAL kor <C-r> in INSERT mode
        -- the presets plugin, adds help for a bunch of default keybindings in Neovim
        -- No actual key bindings are created
        spelling = {
          enabled = true,   -- enabling this will show WhichKey when pressing z= to select spelling suggestions
          suggestions = 20, -- how many suggestions should be shown in the list?
        },
        presets = {
          operators = true,    -- adds help for operators like d, y, ...
          motions = true,      -- adds help for motions
          text_objects = true, -- help for text objects triggered after entering an operator
          windows = true,      -- default bindings on <c-w>
          nav = true,          -- misc bindings to work with windows
          m = true,
          z = true,            -- bindings for folds, spelling and others prefixed with z
          g = true,            -- bindings for prefixed with g
        },
      },
    })
    wk.add({
      { "<leader>;", desc = " Misc" },
      { "<leader>Q", desc = "󰩈 Quit All" },
      { "<leader>S", desc = "󰖽 Sort" },
      { "<leader>W", desc = " Write All" },
      { "<leader>a", desc = " Burn" },
      -- { "<leader>b", desc = "NONE" },
      { "<leader>c", desc = "󰞇 Git Conflict" },
      { "<leader>d", desc = " Database" },
      { "<leader>e", desc = "󰁴 Oil" },
      { "<leader>f", group = " Telescope" },
      { "<leader>f;", desc = "Special" },
      { "<leader>fb", desc = "Buffers" },
      { "<leader>fh", desc = "History" },
      { "<leader>fj", desc = "Git" },
      { "<leader>fk", desc = "Trouble" },
      { "<leader>fl", desc = "Lists" },
      { "<leader>fv", desc = "Vim" },
      { "<leader>g", group = "󰊢 Git" },
      { "<leader>g;", desc = " Misc" },
      { "<leader>gB", desc = "󰡒 Rebase" },
      { "<leader>gD", desc = "󱠄 Develop" },
      { "<leader>gK", desc = "󰳴 Checkout" },
      { "<leader>gR", desc = " Reflog" },
      { "<leader>gb", desc = " Branch" },
      { "<leader>gc", desc = " Commit" },
      { "<leader>gf", desc = " Fetch" },
      { "<leader>gh", desc = "󰾁 Stash" },
      { "<leader>go", desc = "󰭃 Origin" },
      { "<leader>gp", desc = "󱋦 Pull" },
      { "<leader>gr", desc = " Reset" },
      { "<leader>gt", desc = "󰜉 Restore" },
      { "<leader>gw", desc = " Worktree" },
      { "<leader>gx", desc = "󰂹 Bisect" },
      -- { "<leader>h", desc = "NONE" },
      { "<leader>i", desc = " In" },
      { "<leader>j", desc = " Gitsigns" },
      { "<leader>k", desc = " Copilot Chat" },
      { "<leader>l", desc = " Links" },
      { "<leader>ls", desc = "󰒋 Server" },
      { "<leader>m", desc = "󰍢 Noice" },
      { "<leader>n", desc = "󰙨 Neotest" },
      { "<leader>o", desc = " Out" },
      { "<leader>p", desc = " Package Info" },
      { "<leader>q", desc = "󰩈 Quit" },
      { "<leader>r", desc = " Resize" },
      -- { "<leader>s", desc = "NONE" },
      { "<leader>t", desc = " Terminal" },
      { "<leader>t;", desc = " Misc" },
      { "<leader>tc", desc = "󱘗 Cargo" },
      { "<leader>tf", desc = " Flutter" },
      { "<leader>th", desc = "󰕰 Pnpm" },
      { "<leader>tm", desc = " Make" },
      { "<leader>tn", desc = " Npm" },
      { "<leader>tp", desc = " Python" },
      { "<leader>tv", desc = " Maven" },
      { "<leader>tx", desc = "󰅗 Close" },
      { "<leader>u", desc = " Useful" },
      { "<leader>v", desc = " Project Links" },
      { "<leader>vs", desc = "󰒋 Server" },
      { "<leader>w", desc = " Write" },
      -- { "<leader>x", desc = "NONE" },
      { "<leader>y", desc = "󰃤 Debugger" },
      { "<leader>z", desc = "󰒲 Lazy" },
    }, { prefix = "<leader>" })
  end
}
