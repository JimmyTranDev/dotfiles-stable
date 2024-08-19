local popup = require("plenary.popup")

local Win_id

function CloseMenu()
  vim.api.nvim_win_close(Win_id, true)
end

local function showSelectMenu(title, highlight, options, onSelect)
  local height = 20
  local width = 30
  local borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" }

  Win_id = popup.create(options, {
    title = title,
    highlight = highlight,
    line = math.floor(((vim.o.lines - height) / 2) - 1),
    col = math.floor((vim.o.columns - width) / 2),
    minwidth = width,
    minheight = height,
    borderchars = borderchars,
    callback = onSelect,
  })
  local bufnr = vim.api.nvim_win_get_buf(Win_id)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "q", "<cmd>lua CloseMenu()<CR>", { silent = false })
end

return {
  showSelectMenu = showSelectMenu,
}
