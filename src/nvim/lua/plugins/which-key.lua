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
      sort = { "order" },
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
      { "<leader><leader>;", desc = "_" },
      { "<leader><leader>a", desc = "_" },
      { "<leader><leader>b", desc = "_" },
      { "<leader><leader>c", desc = "_" },
      { "<leader><leader>d", desc = "_" },
      { "<leader><leader>e", desc = "_" },
      { "<leader><leader>f", desc = "_" },
      { "<leader><leader>g", desc = "_" },
      { "<leader><leader>h", desc = "_" },
      { "<leader><leader>i", desc = "_" },
      { "<leader><leader>j", desc = "_" },
      { "<leader><leader>k", desc = "_" },
      { "<leader><leader>l", desc = "_" },
      { "<leader><leader>m", desc = "_" },
      { "<leader><leader>n", desc = "_" },
      { "<leader><leader>o", desc = "_" },
      { "<leader><leader>p", desc = "_" },
      { "<leader><leader>q", desc = "_" },
      { "<leader><leader>r", desc = "_" },
      { "<leader><leader>s", desc = "_" },
      { "<leader><leader>t", desc = "_" },
      { "<leader><leader>u", desc = "_" },
      { "<leader><leader>v", desc = "_" },
      { "<leader><leader>w", desc = "_" },
      { "<leader><leader>x", desc = "_" },
      { "<leader><leader>y", desc = "_" },
      { "<leader><leader>z", desc = "_" },
    }, { prefix = "<leader><leader>" })

    -- Subgroups
    wk.add({
      { "<leader>f;", desc = " Special" },
      { "<leader>fb", desc = " Buffers" },
      { "<leader>fh", desc = " History" },
      { "<leader>fj", desc = " Git" },
      { "<leader>fk", desc = " Trouble" },
      { "<leader>fl", desc = " Lists" },
      { "<leader>fv", desc = " Vim" },

      { "<leader>g;", desc = " Misc" },
      { "<leader>ga", desc = " Log" },
      { "<leader>gb", desc = " Branch" },
      { "<leader>gB", desc = "󰡒 Rebase" },
      { "<leader>gc", desc = " Commit" },
      { "<leader>ge", desc = " Diff" },
      { "<leader>gh", desc = "󰾁 Stash" },
      { "<leader>gn", desc = "󰳴 Checkout" },
      { "<leader>go", desc = "󰭃 Origin" },
      { "<leader>gp", desc = "󱋦 Pull" },
      { "<leader>gR", desc = " Reflog" },
      { "<leader>gr", desc = " Reset" },
      { "<leader>gt", desc = "󰜉 Restore" },
      { "<leader>gw", desc = " Worktree" },
      { "<leader>gj", desc = "󰂹 Bisect" },

      { "<leader>ls", desc = "󰒋 Server" },
      { "<leader>t;", desc = " Misc" },
      { "<leader>tc", desc = "󱘗 Cargo" },
      { "<leader>tf", desc = " Flutter" },
      { "<leader>th", desc = "󰕰 Pnpm" },
      { "<leader>tm", desc = " Make" },
      { "<leader>tn", desc = " Npm" },
      { "<leader>tp", desc = " Python" },
      { "<leader>tv", desc = " Maven" },
      { "<leader>tx", desc = "󰅗 Close" },
      { "<leader>vs", desc = "󰒋 Server" },
    }, { prefix = "<leader>" })

    -- Groups
    wk.add({
      { "<leader>;", desc = " Misc" },
      { "<leader>a", desc = " Burn" },
      { "<leader>b", desc = " Database" },
      { "<leader>c", desc = "󰞇 Git Conflict" },
      { "<leader>d", desc = "_" },
      { "<leader>e", desc = "󰁴 Oil" },
      { "<leader>f", desc = " Telescope" },
      { "<leader>g", desc = "󰊢 Git" },
      { "<leader>h", desc = "_" },
      { "<leader>i", desc = " In" },
      { "<leader>j", desc = " Gitsigns" },
      { "<leader>k", desc = " Copilot Chat" },
      { "<leader>l", desc = " Links" },
      { "<leader>m", desc = "󰍢 Noice" },
      { "<leader>n", desc = "󰙨 Neotest" },
      { "<leader>o", desc = " Out" },
      { "<leader>p", desc = " Package Info" },
      { "<leader>Q", desc = "󰩈 Quit All" },
      { "<leader>q", desc = "󰩈 Quit" },
      { "<leader>r", desc = " Resize" },
      { "<leader>S", desc = "󰖽 Sort" },
      { "<leader>s", desc = "󰜏 Search" },
      { "<leader>t", desc = " Terminal" },
      { "<leader>u", desc = " Useful" },
      { "<leader>v", desc = " Project Links" },
      { "<leader>W", desc = " Write All" },
      { "<leader>w", desc = " Write" },
      { "<leader>x", desc = "_" },
      { "<leader>y", desc = "󰃤 Debugger" },
      { "<leader>z", desc = "󰒲 Lazy" },
      { "<leader> ", desc = "󱁐 Space" },
    }, { prefix = "<leader>" })
  end
}
