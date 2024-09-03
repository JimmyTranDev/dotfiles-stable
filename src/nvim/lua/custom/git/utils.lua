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

local function getJiraTicket(branchName)
  local jiraTicket = string.match(branchName, "[a-z]+/([A-Z]+-[0-9]+).*")
  return jiraTicket or ""
end

local getCurrentRemoteBranchName = function()
  local branch = vim.fn.system("git rev-parse --abbrev-ref --symbolic-full-name @{u}")
  return vim.fn.substitute(branch, '\n', '', '')
end

local function diffBranchCommits(originBranch, targetBranch)
  local diff = string.format("%s..%s", originBranch, targetBranch)
  local fugitive_command = string.format("Git log %s", diff)
  vim.cmd(fugitive_command)
end

local function getRepoBranchNames()
  local branchNames = {}
  for _, branchName in ipairs(vim.fn.systemlist("git branch --list")) do
    local cleanedBranchName = string.gsub(branchName, "* ", "")
    table.insert(branchNames, cleanedBranchName)
  end

  return branchNames;
end


local function getTags()
  local fugitive_command = "git tag -l | tail -r"
  local tags = vim.fn.systemlist(fugitive_command)
  return tags
end

local function getTagsRemote()
  local fugitive_command = "git ls-remote --tags"
  local tagLines = vim.fn.systemlist(fugitive_command)
  local tags = {}
  for _, tagLine in ipairs(tagLines) do
    local tag = string.match(tagLine, "refs/tags/(.*)")
    table.insert(tags, tag)
  end

  return tags
end

local function getRemoteBranchNames()
  local branchNames = {}
  for _, branchName in ipairs(vim.fn.systemlist("git branch -r")) do
    local cleanedBranchName = string.gsub(branchName, "*", "")
    table.insert(branchNames, cleanedBranchName)
  end

  return branchNames;
end

local function getCommitLineToSha(isAll)
  local fugitive_command
  if isAll then
    fugitive_command = "git log --oneline --all"
  else
    fugitive_command = "git log --oneline"
  end

  local commitLines = vim.fn.systemlist(fugitive_command)

  local commitLineToSha = {}
  for _, commitLine in ipairs(commitLines) do
    local sha = string.sub(commitLine, 1, 7)
    commitLineToSha[commitLine] = sha
  end
  return commitLines, commitLineToSha
end

local function getStashLineToIndex()
  local fugitive_command = "git stash list"
  local stashLines = vim.fn.systemlist(fugitive_command)

  local stashLineToIndex = {}
  for _, stashLine in ipairs(stashLines) do
    local index = string.match(stashLine, "stash@{([0-9]+)}")
    stashLineToIndex[stashLine] = index
  end
  return stashLines, stashLineToIndex
end

local function getReflogLineToIndex()
  local fugitive_command = "git reflog"
  local reflogLines = vim.fn.systemlist(fugitive_command)

  local reflogLineToIndex = {}
  for _, reflogLine in ipairs(reflogLines) do
    local index = string.match(reflogLine, "HEAD@{([0-9]+)}")
    reflogLineToIndex[reflogLine] = index
  end
  return reflogLines, reflogLineToIndex
end

local function getCommitLineTables()
  local fugitive_command = "git log --oneline"
  local commitLines = vim.fn.systemlist(fugitive_command)

  local commitLineToIndex = {}

  for index, commitLine in ipairs(commitLines) do
    commitLineToIndex[commitLine] = index - 1
  end

  return commitLines, commitLineToIndex
end

return {
  diffBranchCommits = diffBranchCommits,
  getCommitLineTables = getCommitLineTables,
  getCommitLineToSha = getCommitLineToSha,
  getCurrentBranchName = getCurrentBranchName,
  getCurrentRemoteBranchName = getCurrentRemoteBranchName,
  getJiraTicket = getJiraTicket,
  getLastCommitMessage = getLastCommitMessage,
  getReflogLineToIndex = getReflogLineToIndex,
  getRemoteBranchNames = getRemoteBranchNames,
  getRepoBranchNames = getRepoBranchNames,
  getStashLineToIndex = getStashLineToIndex,
  getTags = getTags,
  getRemoteTags = getTagsRemote,
}
