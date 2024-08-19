return {
  "cbochs/portal.nvim",
  event = "VeryLazy",
  dependencies = {
    "cbochs/grapple.nvim",
    "ThePrimeagen/harpoon"
  },
  config = function()
    -- Navigation
    local keymap = vim.keymap
    keymap.set('n', '<Leader>i', ':Portal jumplist forward<CR>', { desc = "Jump forward", silent = true })
    keymap.set('n', '<Leader>o', ':Portal jumplist backward<CR>', { desc = "Jump backward", silent = true })
  end
}
