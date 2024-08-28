return {
  'kristijanhusak/vim-dadbod-ui',
  dependencies = {
    { 'tpope/vim-dadbod',                     lazy = true },
    { 'kristijanhusak/vim-dadbod-completion', ft = { 'sql', 'mysql', 'plsql' }, lazy = true },
  },
  cmd = {
    'DBUI',
    'DBUIToggle',
    'DBUIAddConnection',
    'DBUIFindBuffer',
  },
  keys = {
    { mode = "n", "<leader>bd", ":DBUI<CR>",              desc = "UI",             silent = true },
    { mode = "n", "<leader>bt", ":DBUIToggle<CR>",        desc = "Toggle UI",      silent = true },
    { mode = "n", "<leader>ba", ":DBUIAddConnection<CR>", desc = "Add Connection", silent = true },
    { mode = "n", "<leader>bf", ":DBUIFindBuffer<CR>",    desc = "Find Buffer",    silent = true },
  },
  init = function()
    -- Your DBUI configuration
    vim.g.db_ui_use_nerd_fonts = 1
  end,
}
