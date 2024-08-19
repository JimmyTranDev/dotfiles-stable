return {
  'michaelb/sniprun',
  run = 'sh ./install.sh',
  keys = {
    { mode = "v", "<leader>;r", ":'<,'>SnipRun<CR", desc = "SnipRun", silent = true },
  }
}
