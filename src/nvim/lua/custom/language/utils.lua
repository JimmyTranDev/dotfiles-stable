local function getCurrentJavaClass()
  local currentFile = vim.fn.expand('%')
  local currentClass = vim.fn.substitute(currentFile, '.*/src/main/java/', '', '')
  currentClass = vim.fn.substitute(currentClass, '/', '.', 'g')
  currentClass = vim.fn.substitute(currentClass, '\\.java', '', '')
  return currentClass
end

return {
  getCurrentJavaClass = getCurrentJavaClass,
}
