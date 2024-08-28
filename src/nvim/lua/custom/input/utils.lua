local function getInputFromUser(prompt, text)
  local input = vim.fn.input(prompt, text or "")
  if input == "" then
    return getInputFromUser(prompt)
  end

  if input == " " then
    return ""
  end

  return input
end

return {
  getInputFromUser = getInputFromUser
}
