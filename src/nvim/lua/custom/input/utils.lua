local function getInputFromUser(prompt, text)
  local input = vim.fn.input(prompt, text or "")
  if input == "" then
    return ""
  end

  return input
end

local function getInputFromUserRequired(prompt, text)
  local input = vim.fn.input(prompt, text or "")
  if input == "" then
    return getInputFromUserRequired(prompt)
  end

  return input
end

return {
  getInputFromUser = getInputFromUser,
  getInputFromUserRequired = getInputFromUserRequired
}
