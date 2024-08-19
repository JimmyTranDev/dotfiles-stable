local function openLink()
  -- vim.cmd("normal! yiW")
  local link = vim.fn.getreg('0')
  -- focus first window
  vim.cmd("wincmd p")
  vim.cmd("e " .. link)
end

return {
  openLink = openLink,
}
