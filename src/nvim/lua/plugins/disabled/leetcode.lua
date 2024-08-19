return {
  "kawre/leetcode.nvim",
  build = ":TSUpdate html",
  keys = {
    { mode = "n", "<Leader>;l", ":Leet<CR>", desc = " Leetcode", silent = true },
  },
  dependencies = {
    "nvim-telescope/telescope.nvim",
    "nvim-lua/plenary.nvim", -- required by telescope
    "MunifTanjim/nui.nvim",

    -- optional
    "nvim-treesitter/nvim-treesitter",
    "rcarriga/nvim-notify",
    "nvim-tree/nvim-web-devicons",
  },
  opts = {
    -- configuration goes here
  },
}
