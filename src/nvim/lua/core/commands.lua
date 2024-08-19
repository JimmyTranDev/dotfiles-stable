LspFormatByFiletype = require("custom.lsp.actions").lspFormatByFiletype

vim.cmd.colorscheme "catppuccin-mocha"
vim.cmd [[hi LineNr guibg=none guifg=#9399b2]]
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  callback = function(args)
    require("conform").format({ bufnr = args.buf })
  end,
})

vim.api.nvim_create_autocmd("BufRead", {
  pattern = "*.tag",
  callback = function()
    vim.bo.filetype = "html"
  end,
})

vim.api.nvim_create_autocmd("BufRead", {
  pattern = "*.riot",
  callback = function()
    vim.bo.filetype = "html"
  end,
})

vim.cmd [[
  augroup highlight_yank
  autocmd!
  au TextYankPost * silent! lua vim.highlight.on_yank({higroup="Visual", timeout=200})
  augroup END
]]

vim.cmd [[
  hi WhichKeyGroup guifg=#cba6f7
  hi WhichKeyDesc guifg=#cba6f7
]]

vim.api.nvim_create_autocmd("BufRead", {
  callback = function()
    if vim.bo.filetype == "java" then
      vim.bo.shiftwidth = 4
      vim.bo.tabstop = 4
    else -- not java
      vim.bo.shiftwidth = 2
      vim.bo.tabstop = 2
    end
  end,
})

vim.cmd('highlight! HarpoonInactive guibg=NONE guifg=#63698c')
vim.cmd('highlight! HarpoonActive guibg=NONE guifg=white')
vim.cmd('highlight! HarpoonNumberActive guibg=NONE guifg=#7aa2f7')
vim.cmd('highlight! HarpoonNumberInactive guibg=NONE guifg=#7aa2f7')
vim.cmd('highlight! TabLineFill guibg=NONE guifg=white')
-- not java indent 2
