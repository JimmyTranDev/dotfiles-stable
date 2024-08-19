local languageUtils = require("custom.language.utils")

local function runJavaClassMvn()
  local currentClass = languageUtils.getCurrentJavaClass()
  vim.cmd(":2TermExec cmd='mvn compile'")
  vim.cmd(":2TermExec mvn exec:java -Dexec.mainClass=" .. currentClass)
end

local function runJavaClassJavac()
  local currentClass = languageUtils.getCurrentJavaClass()
  local command = [[:terminal javac ]] .. currentClass .. [[; java ]] .. currentClass
  vim.cmd(command)
end

local function installPnpmPackage()
  local selectedText = vim.fn.getreg('"')
  vim.cmd(':2TermExec cmd="pnpm install ' .. selectedText .. '"<CR>')
end

return {
  runJavaClassMvn = runJavaClassMvn,
  runJavaClassJavac = runJavaClassJavac,
  installPnpmPackage = installPnpmPackage,
}
