local constants = require("core.constants")

local function log(dirName, message)
  message = message .. '  '
  local currentWeek = os.date("%V")
  local currentYear = os.date("%Y")
  local shortDate = os.date("%d.%m.%Y")
  local dayName = os.date("%A")

  local title = string.format("# Week %s, %s", currentWeek, currentYear)
  local dayTitle = string.format("## %s (%s)", dayName, shortDate)


  local logFile = string.format("%s-%s.md", currentWeek, currentYear)
  local logFileFullPath = string.format("%s/notes/%s/%s", constants.PROGRAMMING_DIR, dirName, logFile)
  if vim.fn.filereadable(logFileFullPath) == 0 then
    vim.fn.writefile({ title, '', dayTitle, message }, logFileFullPath)
    return;
  end

  local lines = vim.fn.readfile(logFileFullPath)

  local hasDay = false
  local hasTitle = false
  for _, line in ipairs(lines) do
    if line == title then
      hasTitle = true
    end
    if line == dayTitle then
      hasDay = true
    end
    if hasTitle and hasDay then
      break
    end
  end

  if not hasTitle then
    table.insert(lines, title)
  end
  if not hasDay then
    table.insert(lines, "")
    table.insert(lines, dayTitle)
  end
  table.insert(lines, message)
  vim.fn.writefile(lines, logFileFullPath)
end

return {
  log = log,
}
