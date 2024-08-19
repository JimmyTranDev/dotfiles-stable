return {
  "akinsho/git-conflict.nvim",
  keys = {
    {
      mode = "n",
      "<leader>co",
      ":GitConflictChooseOurs<CR>",
      silent = true,
      desc = "Conflict Choose Ours"
    },
    {
      mode = "n",
      "<leader>ct",
      ":GitConflictChooseTheirs<CR>",
      silent = true,
      desc = "Conflict Choose Theirs"
    },
    {
      mode = "n",
      "<leader>cb",
      ":GitConflictChooseBoth<CR>",
      silent = true,
      desc = "Conflict Choose Both"
    },
    {
      mode = "n",
      "<leader>cc",
      ":GitConflictChooseNone<CR>",
      silent = true,
      desc = "Conflict Choose None"
    },
    {
      mode = "n",
      "<leader>cn",
      ":GitConflictNextConflict<CR>",
      silent = true,
      desc = "Conflict Next"
    },
    {
      mode = "n",
      "<leader>cp",
      ":GitConflictPrevConflict<CR>",
      silent = true,
      desc = "Conflict Previous"
    },
    {
      mode = "n",
      "<leader>cl",
      ":GitConflictListQf<CR>",
      silent = true,
      desc = "Conflict List"
    }
  },
  config = function()
    require('git-conflict').setup({
      default_mappings = false,
    })
  end
}
