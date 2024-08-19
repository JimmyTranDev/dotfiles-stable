return {
  "NeogitOrg/neogit",
  keys = {
    { mode = "n", "<leader>ng", ":Neogit<CR>" },
  },
  dependencies = {
    "nvim-lua/plenary.nvim",  -- required
    "sindrets/diffview.nvim", -- optional - Diff integration

    -- Only one of these is needed, not both.
    "nvim-telescope/telescope.nvim", -- optional
    "ibhagwan/fzf-lua",              -- optional
  },
  config = true
}
