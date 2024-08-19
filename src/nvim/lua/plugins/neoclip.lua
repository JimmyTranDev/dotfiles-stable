return {
  "AckslD/nvim-neoclip.lua",
  dependencies = {
    { 'nvim-telescope/telescope.nvim' },
  },
  keys = {
    {
      mode = 'n',
      '<leader>f;c',
      ':Telescope neoclip<CR>',
      silent = true,
      desc = "Telescope Neoclip"
    }
  },
  config = function()
    require('neoclip').setup()
  end,
}
