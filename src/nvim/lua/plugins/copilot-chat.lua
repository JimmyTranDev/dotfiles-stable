return {
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    branch = "canary",
    dependencies = {
      { "zbirenbaum/copilot.lua" }, -- or github/copilot.vim
      { "nvim-lua/plenary.nvim" },  -- for curl, log wrapper
    },
    config = function()
      require("CopilotChat").setup {
        debug = true, -- Enable debugging
        -- See Configuration section for rest
        window = {
          layout = 'float',
          border = 'rounded',
          height = 0.7,
          width = 0.7,
        }
      }
    end,
    -- See Commands section for default commands if you want to lazy load on them
    keys = {
      { mode = { 'v', 'n' }, "<leader>kk", ":CopilotChat<cr>",             silent = true, desc = "Chat" },
      { mode = 'n',          "<leader>ko", ":CopilotChatOpen<cr>",         silent = true, desc = "Open chat" },
      { mode = 'n',          "<leader>kx", ":CopilotChatClose<cr>",        silent = true, desc = "Close chat" },
      { mode = 'n',          "<leader>kt", ":CopilotChatToggle<cr>",       silent = true, desc = "Toggle chat" },
      { mode = 'n',          "<leader>ks", ":CopilotChatStop<cr>",         silent = true, desc = "Stop copilot" },
      { mode = 'n',          "<leader>kr", ":CopilotChatReset<cr>",        silent = true, desc = "Reset chat" },
      { mode = 'n',          "<leader>ks", ":CopilotChatSave ",            silent = true, desc = "Save chat" },
      { mode = 'n',          "<leader>kl", ":CopilotChatLoad ",            silent = true, desc = "Load chat" },
      { mode = 'n',          "<leader>kd", ":CopilotChatDebugInfo<cr>",    silent = true, desc = "Debug info" },

      { mode = 'v',          "<leader>ke", ":CopilotChatExplain<cr>",      silent = true, desc = "Explain code" },
      { mode = 'v',          "<leader>kr", ":CopilotChatReview<cr>",       silent = true, desc = "Review code" },
      { mode = 'v',          "<leader>kf", ":CopilotChatFix<cr>",          silent = true, desc = "Fix code" },
      { mode = 'v',          "<leader>ko", ":CopilotChatOptimize<cr>",     silent = true, desc = "Optimize code" },
      { mode = 'v',          "<leader>kd", ":CopilotChatDocs<cr>",         silent = true, desc = "Add documentation" },
      { mode = 'v',          "<leader>kt", ":CopilotChatTests<cr>",        silent = true, desc = "Generate tests" },

      { mode = 'n',          "<leader>kc", ":CopilotChatCommit<cr>",       silent = true, desc = "Commit code" },
      { mode = 'n',          "<leader>kC", ":CopilotChatCommitStaged<cr>", silent = true, desc = "Commit staged code" },
    },
  },
}
