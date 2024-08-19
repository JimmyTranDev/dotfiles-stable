-- LSP Find
local function grepMarkDownHeadingsInCurrentFile()
  require('telescope.builtin').live_grep({
    search_dirs = { vim.fn.expand("%:p"), },
    default_text = '^## ',
  })
end

local function findSelectedText()
  vim.cmd('normal! y')

  local selected_text = vim.fn.getreg('"')

  require('telescope.builtin').live_grep({
    default_text = selected_text,
    search_dirs = { vim.fn.expand("%:p:h") }
  })
end

return {
  findSelectedText = findSelectedText,
  grepMarkDownHeadingsInCurrentFile = grepMarkDownHeadingsInCurrentFile,
}
