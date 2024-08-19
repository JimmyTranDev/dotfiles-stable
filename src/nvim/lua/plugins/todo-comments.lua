return {
  "folke/todo-comments.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  event = "BufRead",
  keys = {
    { mode = "n", "<leader>f;t", ":TodoTelescope<CR>", desc = "Open todo list", silent = true },
  },
  config = function()
    require("todo-comments").setup()
  end,
}
