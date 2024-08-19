local function getCurrentBranchName()
  local branch = vim.fn.system("git rev-parse --abbrev-ref HEAD")
  return vim.fn.substitute(branch, '\n', '', '')
end

local removeShaFromCommitMessage = function(message)
  return string.match(message, "[a-z0-9]+[%s](.*)")
end

local getLastCommitMessage = function()
  local message = vim.fn.system("git log -1 --oneline")
  local cleanedMessage = vim.fn.substitute(message, '\n', '', '')
  return removeShaFromCommitMessage(cleanedMessage)
end

local function getJiraTicketFromBranchName(branchName)
  local jiraTicket = string.match(branchName, "[a-z]+/([A-Z]+-[0-9]+).*")
  return jiraTicket or ""
end

return {
  getCurrentBranchName = getCurrentBranchName,
  getLastCommitMessage = getLastCommitMessage,
  getJiraTicketFromBranchName = getJiraTicketFromBranchName,
}
