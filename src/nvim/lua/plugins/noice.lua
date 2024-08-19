return {
  "folke/noice.nvim",
  opts = {},
  event = "VeryLazy",
  dependencies = {
    "MunifTanjim/nui.nvim",
    "rcarriga/nvim-notify",
  },
  config = function()
    require("noice").setup({
      notify = {
        enabled = false,
      },
      messages = {
        enabled = false,
      },
      lsp = {
        signature = {
          enabled = false,
        },
        progress = {
          enabled = false,
        },
      }
    })
  end,
  keys = {
    { mode = "n", "<leader>mh", ":Noice<CR>",           silent = true, desc = "History" },
    { mode = "n", "<leader>ml", ":Noice last<CR>",      silent = true, desc = "Last" },
    { mode = "n", "<leader>md", ":Noice dismiss<CR>",   silent = true, desc = "Dismiss" },
    { mode = "n", "<leader>me", ":Noice errors<CR>",    silent = true, desc = "Errors" },
    { mode = "n", "<leader>mD", ":Noice disable<CR>",   silent = true, desc = "Disable" },
    { mode = "n", "<leader>mE", ":Noice enable<CR>",    silent = true, desc = "Enable" },
    { mode = "n", "<leader>ms", ":Noice stats<CR>",     silent = true, desc = "Stats" },
    { mode = "n", "<leader>mt", ":Noice telescope<CR>", silent = true, desc = "Telescope" },
  }
}
