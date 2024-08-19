local fileUtils = require("custom.files.utils")

local function openDir()
  local path = vim.fn.expand("%:p:h")
  fileUtils.open(path)
end

local function moveFileToAsset(dir)
  return function()
    local currentDir = vim.fn.getcwd()
    local assetDirs = fileUtils.listDirsWithName("assets")
    if #assetDirs == 0 then
      print("No assets folder found in src")
      return
    end

    local targetDir = currentDir .. '/' .. assetDirs[1]
    local originDir = fileUtils.getPathFromRoot(dir)
    local fileNames = fileUtils.listFiles(originDir)

    vim.ui.select(fileNames, {
      prompt = "Select file to move to assets:",
    }, function(fileName)
      local newFileName = fileUtils.renameFileWithInput(fileName, originDir, targetDir)
      fileUtils.pasteMarkdownLink(newFileName)
    end)
  end
end

return {
  openDir = openDir,
  moveFileToAsset = moveFileToAsset,
}
