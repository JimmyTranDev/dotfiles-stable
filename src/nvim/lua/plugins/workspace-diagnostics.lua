return {
  'artemave/workspace-diagnostics.nvim',
  event = "BufRead",
  config = function()
    vim.api.nvim_set_keymap('n', '<leader>fx', '', {
      noremap = true,
      callback = function()
        for _, client in ipairs(vim.lsp.buf_get_clients()) do
          require("workspace-diagnostics").populate_workspace_diagnostics(client, 0)
        end
      end
    })
    require("lazy").setup({ "artemave/workspace-diagnostics.nvim" })
  end
}
