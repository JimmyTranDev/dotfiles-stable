return {
  "akinsho/git-conflict.nvim",
  keys = {
    { mode = "n", "<leader>co", ":GitConflictChooseOurs<CR>",   silent = true, desc = "Conflict Choose Ours" },
    { mode = "n", "<leader>ct", ":GitConflictChooseTheirs<CR>", silent = true, desc = "Conflict Choose Theirs" },
    { mode = "n", "<leader>cb", ":GitConflictChooseBoth<CR>",   silent = true, desc = "Conflict Choose Both" },
    { mode = "n", "<leader>cc", ":GitConflictChooseNone<CR>",   silent = true, desc = "Conflict Choose None" },
    { mode = "n", "<leader>cn", ":GitConflictNextConflict<CR>", silent = true, desc = "Conflict Next" },
    { mode = "n", "<leader>cp", ":GitConflictPrevConflict<CR>", silent = true, desc = "Conflict Previous" },
    { mode = "n", "<leader>cl", ":GitConflictListQf<CR>",       silent = true, desc = "Conflict List" }
  },
  config = function()
    require('git-conflict').setup({
      default_mappings = false,    -- disable buffer local mapping created by this plugin
      default_commands = true,     -- disable commands created by this plugin
      disable_diagnostics = false, -- This will disable the diagnostics in a buffer whilst it is conflicted
      list_opener = 'copen',       -- command or function to open the conflicts list
      highlights = {               -- They must have background color, otherwise the default color will be used
        incoming = 'DiffAdd',
        current = 'DiffText',
      }
    })
  end
}
