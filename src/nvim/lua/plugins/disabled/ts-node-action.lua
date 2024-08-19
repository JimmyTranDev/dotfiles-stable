return {
  'ckolkey/ts-node-action',
  dependencies = { 'nvim-treesitter' },
  keys = {
    { mode = 'n', '<leader>;a', function() require("ts-node-action").node_action() end, desc = 'Trigger Node Action' }
  }
}
