return {
  'bennypowers/nvim-regexplainer',
  event = 'BufRead',
  config = function() require 'regexplainer'.setup() end,
  dependencies = {
    'nvim-treesitter/nvim-treesitter',
    'MunifTanjim/nui.nvim',
  }
}
