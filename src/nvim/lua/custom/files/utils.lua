local stringUtils = require("custom.string.utils")
local inputUtils = require("custom.input.utils")

local function getCwdName()
  local currentWorkingDirectory = vim.fn.getcwd()
  return currentWorkingDirectory:match("([^/]+)$")
end

local function listFiles(dir --[[string]])
  return vim.fn.systemlist("ls -t " .. dir)
end

local function listDirsWithName(folderName)
  local command = "git ls-files | xargs -n 1 dirname | uniq | grep '" .. folderName .. "'"
  return vim.fn.systemlist(command)
end

local getCurrentDir = function()
  return vim.cmd("pwd")
end

local function renameFile(oldFile, newFile)
  vim.fn.system('mv "' .. oldFile .. '" "' .. newFile .. '"')
end

local function getFileExtension(fileName)
  return fileName:match("^.+(%..+)$")
end

local getPathFromRoot = function(path)
  return os.getenv("HOME") .. path
end

local removeFileExtension = function(fileName)
  return fileName:gsub("%..*", "")
end

local function pasteMarkdownLink(fileName)
  local linkLabel = stringUtils.convertSnakeCaseToNormalCase(removeFileExtension(fileName))
  local markdownLink = string.format(
    "![%s](assets/%s)",
    linkLabel,
    fileName
  )
  vim.fn.setreg("*", markdownLink)
  vim.cmd("normal! \"*p")
end

local function renameFileWithInput(fileName, originDir, targetDir)
  local fileExtension = getFileExtension(fileName)
  local rename = inputUtils.getInputFromUserRequired("Enter new file name: ")
  local newFileName = rename .. fileExtension

  local originFile = originDir .. "/" .. fileName
  local targetFile = targetDir .. "/" .. newFileName
  -- print(originFile)
  print(targetDir)
  renameFile(originFile, targetFile)
  return newFileName
end

local function open(item)
  if vim.fn.has('mac') == 1 then
    vim.fn.system("open '" .. item .. "'")
  elseif vim.fn.has('unix') == 1 then
    vim.fn.system("xdg-open '" .. item .. "'")
  end
end

return {
  moveFileToCurrentDir = renameFile,
  getFileExtension = getFileExtension,
  listFiles = listFiles,
  getCurrentDir = getCurrentDir,
  renameFile = renameFile,
  pasteMarkdownLink = pasteMarkdownLink,
  getPathFromRoot = getPathFromRoot,
  removeFileExtension = removeFileExtension,
  renameFileWithInput = renameFileWithInput,
  open = open,
  listDirsWithName = listDirsWithName,
  getCwdName = getCwdName,
}
