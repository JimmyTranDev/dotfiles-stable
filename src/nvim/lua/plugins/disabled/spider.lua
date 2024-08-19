return {
  "chrisgrieser/nvim-spider",
  event = "VeryLazy",
  keys = {
    { -- example for lazy-loading on keystroke
      "e",
      "<cmd>lua require('spider').motion('e')<CR>",
      mode = { "n", "o", "x" },
    },
    { -- example using an explicit function
      "w",
      function()
        require('spider').motion('w', {
          customPatterns = {
            patterns = { ('%x'):rep(6) .. '+' },
            overrideDefault = true,
          },
        })
      end,
      mode = { 'n', 'o', 'x' },
    },
  },
  config = function()
    vim.keymap.set(
      { "n", "o", "x" },
      "w",
      "<cmd>lua require('spider').motion('w')<CR>",
      { desc = "Spider-w" }
    )
    vim.keymap.set(
      { "n", "o", "x" },
      "e",
      "<cmd>lua require('spider').motion('e')<CR>",
      { desc = "Spider-e" }
    )
    vim.keymap.set(
      { "n", "o", "x" },
      "b",
      "<cmd>lua require('spider').motion('b')<CR>",
      { desc = "Spider-b" }
    )
  end
}
