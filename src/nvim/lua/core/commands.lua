-- Colorscheme
vim.cmd.colorscheme "catppuccin-mocha"

-- Riots.js handling
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

-- Format on save
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  callback = function(args)
    require("conform").format({ bufnr = args.buf })
  end,
})

-- Highlights yank
vim.cmd [[
  augroup highlight_yank
  autocmd!
  au TextYankPost * silent! lua vim.highlight.on_yank({higroup="Visual", timeout=200})
  augroup END
]]

-- Handling for java indent
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
