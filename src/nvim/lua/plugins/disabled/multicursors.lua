return {
  "smoka7/multicursors.nvim",
  dependencies = {
    'smoka7/hydra.nvim',
  },
  opts = {},
  cmd = { 'MCstart', 'MCvisual', 'MCclear', 'MCpattern', 'MCvisualPattern', 'MCunderCursor' },
  keys = {
    {
      mode = { 'v', 'n' },
      '<Leader>mcc',
      ':MCstart<CR>',
      desc = 'Multi Cursor Start',
    },
    {
      mode = { 'v', 'n' },
      '<Leader>mcp',
      ':MCpattern<CR>',
      desc = 'Multi Cursor Pattern',
    },
  },
}
