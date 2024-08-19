return {
  "anuvyklack/windows.nvim",
  dependencies = {
    "anuvyklack/middleclass",
    "anuvyklack/animation.nvim"
  },
  config = function()
    vim.o.winwidth = 10
    vim.o.winminwidth = 10
    vim.o.equalalways = false
    require('windows').setup()
  end,
  event = "BufRead",
  keys = {
    { mode = "n", "<leader>rx", ":WindowsMaximize<CR>",             desc = "Maximize Window" },
    { mode = "n", "<leader>rv", ":WindowsMaximizeVertically<CR>",   desc = "Maximize Window Vertically" },
    { mode = "n", "<leader>rh", ":WindowsMaximizeHorizontally<CR>", desc = "Maximize Window Horizontally" },
    { mode = "n", "<leader>re", ":WindowsEqualize<CR>",             desc = "Equalize Windows" },
  },
}
