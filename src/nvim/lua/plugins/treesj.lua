return {
  'Wansmer/treesj',
  dependencies = { 'nvim-treesitter/nvim-treesitter' },
  keys = {
    { mode = 'n', "<leader>;r", function() require('treesj').toggle() end, silent = true, desc = " Treesj" }
  },
  config = function()
    local treesj = require('treesj')

    treesj.setup({
      max_join_length = 200,
      use_default_keymaps = false,
    })
  end,
}
