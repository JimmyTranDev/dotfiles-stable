return {
  "chrisgrieser/nvim-scissors",
  dependencies = "nvim-telescope/telescope.nvim", -- optional
  opts = {
    snippetDir = vim.fn.stdpath("config") .. "/snippets"
  },
  keys = {
    { mode = "n",          "<leader>se", function() require("scissors").editSnippet() end,   desc = "Edit Snippet" },
    { mode = { "n", "x" }, "<leader>sa", function() require('scissors').addNewSnippet() end, desc = "Add New Snippet" },
  }
}
