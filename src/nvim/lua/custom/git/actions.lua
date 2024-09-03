local gitUtils = require("custom.git.utils")
local inputUtils = require("custom.input.utils")
local fileUtils = require("custom.files.utils")
local loggingUtils = require("custom.logging.utils")

local function createWorktree(prefix)
  return function()
    local jiraTicket = inputUtils.getInputFromUser("Jira Ticket: ")
    local branchDescription = inputUtils.getInputFromUser("Branch Description: ")

    local descriptionPart = string.gsub(branchDescription, "%s+", "-")
    local jiraTicketPart = jiraTicket == "" and "" or jiraTicket .. "_"
    local branchName = prefix .. "/" .. jiraTicketPart .. descriptionPart
    local folderName = string.gsub(branchName, "/", "-")

    vim.cmd(string.format("Git worktree add -b %s ../%s", branchName, folderName))
  end
end

local function changeLastCommitMessage()
  local message = inputUtils.getInputFromUser("New Commit Message: ", gitUtils.getLastCommitMessage())
  if message ~= "" then
    vim.cmd("Git commit --amend --no-verify -m '" .. message .. "'")
  end
end

local function renameCurrentBranch()
  local oldBranchName = gitUtils.getCurrentBranchName();
  local newBranchName = inputUtils.getInputFromUser("New Branch Name: ", oldBranchName)

  if newBranchName ~= "" then
    vim.cmd("Git branch -m " .. newBranchName)
    vim.cmd("Git push origin -u " .. newBranchName)
    vim.cmd("Git push origin --delete " .. oldBranchName)
  end
end

local function createBranch(prefix)
  return function()
    local branchDescription = inputUtils.getInputFromUser("Branch Description: ")
    local jiraTicket = inputUtils.getInputFromUser("Jira Ticket: ")

    local descriptionPart = string.gsub(branchDescription, "%s+", "-")
    local jiraTicketPart = jiraTicket == "" and "" or jiraTicket .. "_"
    local branchName = prefix .. "/" .. jiraTicketPart .. descriptionPart
    vim.cmd(string.format("Git checkout -b %s", branchName))
  end
end

local function createCommit(prefix, emoji)
  return function()
    local projectName = fileUtils.getCwdName()
    local branchName = gitUtils.getCurrentBranchName()
    local jiraTicket = gitUtils.getJiraTicket(branchName)

    local commitDescription = inputUtils.getInputFromUser("󰦨 Description: ")
    local commitScope = inputUtils.getInputFromUser("󰟾 Scope: ")
    if (commitDescription == nil) then
      return;
    end

    local jiraTicketPart = jiraTicket == "" and "" or jiraTicket .. " "
    local commitScopePart = commitScope == "" and "" or "(" .. commitScope .. ")"
    local emojiPart = emoji == "" and "" or " " .. emoji

    local commitMessage = prefix
        .. commitScopePart
        .. ":"
        .. emojiPart
        .. " "
        .. jiraTicketPart
        .. commitDescription

    if (projectName ~= 'notes') then
      local taskMessage = string.format("[%s] %s", projectName, commitMessage)
      loggingUtils.log(taskMessage)

      vim.cmd('silent "git -C ~/Programming/notes/ pull --rebase"')
      local newNoteCommitMessage = string.format("feat: ✨ %s", 'Week ' .. os.date("%V"))
      local currentNoteCommit = vim.fn.system("!silent git -C ~/Programming/notes/ log -1 --pretty=%B")
      if (currentNoteCommit == newNoteCommitMessage) then
        vim.cmd('silent "git -C ~/Programming/notes/ commit -m"')
      else
        vim.cmd('silent "git -C ~/Programming/notes/ push"')
      end
    end

    vim.cmd(string.format('Git commit --no-verify -m  "%s"', commitMessage))
  end
end

local function searchCommitMessagesCommits()
  local searchString = inputUtils.getInputFromUser("Search: ")
  if searchString == "" then
    return
  end
  vim.cmd("Git log --format=full --grep='" .. searchString .. "'")
end


local function searchCommitMessagesDiffs()
  local searchString = inputUtils.getInputFromUser("Search: ")
  if searchString == "" then
    return
  end
  vim.cmd("Git show --format=full --grep='" .. searchString .. "'")
end

local function diffBranch()
  local branchNames = gitUtils.getRepoBranchNames()

  vim.ui.select(branchNames, {
    prompt = "Select repo to open:",
  }, function(branchName)
    if branchName == nil then
      return
    end

    branchName = branchName:match("%* (.*)")
    if branchName == nil then
      print("No branch found")
      return
    end
    vim.cmd("Git diff " .. branchName)
  end)
end


local function logBranch()
  local currentBranchName = gitUtils.getCurrentBranchName()
  local branchNames = gitUtils.getRepoBranchNames()

  vim.ui.select(branchNames, {
    prompt = "Select repo to open:",
  }, function(branchName)
    if branchName == nil then
      return
    end

    local cleanBranchName = branchName:match("%* (.*)")
    if cleanBranchName == nil then
      print("No branch found")
      return
    end

    gitUtils.diffBranchCommits(cleanBranchName, currentBranchName)
  end)
end

local function logDiffWithRemote()
  local currentBranch = gitUtils.getCurrentBranchName()
  local remoteBranch = gitUtils.getCurrentRemoteBranchName()
  gitUtils.diffBranchCommits(remoteBranch, currentBranch)
end

local function diffHash()
  local hash = inputUtils.getInputFromUser("Hash: ")
  if hash == "" then
    return
  end
  vim.cmd("Git diff " .. hash)
end

local function diffRemote()
  local currentBranch = gitUtils.getCurrentBranchName()
  local remoteBranch = gitUtils.getCurrentRemoteBranchName()
  gitUtils.diffBranchCommits(currentBranch, remoteBranch)
end

local function logDiffWithHash()
  local hash = inputUtils.getInputFromUser("Hash: ")
  if hash == "" then
    return
  end
  vim.cmd("Git log --abbrev-commit " .. hash .. "...")
end


local function resetBranchHardWithOrigin()
  local originBranch = gitUtils.getCurrentRemoteBranchName()
  vim.cmd("Git reset --hard " .. originBranch)
end

local function addTag()
  local tagName = inputUtils.getInputFromUser("Tag Name: ")
  if tagName == "" then
    return
  end

  local message = inputUtils.getInputFromUser("Tag Message: ")
  if tagName == "" then
    return
  end

  if message == "" then
    vim.cmd("Git tag -f " .. tagName)
  end

  vim.cmd("Git tag -f -a " .. tagName .. " -m " .. message)
end

local function addTagToHash()
  local tagName = inputUtils.getInputFromUser("Tag Name: ")
  if tagName == "" then
    return
  end
  local commitLines, commitLineToSha = gitUtils.getCommitLineToSha(false)
  local message = inputUtils.getInputFromUser("Tag Message: ")

  vim.ui.select(commitLines, {
    prompt = "Select commit to tag:",
  }, function(commitLine)
    if commitLine == nil then
      return
    end

    local sha = commitLineToSha[commitLine]
    if message == "" then
      vim.cmd("Git tag -f " .. tagName .. " " .. sha)
      return
    end

    vim.cmd("Git tag -f -a " .. tagName .. " -m " .. message .. " " .. sha)
  end)
end

local function deleteRemoteTag()
  local tags = gitUtils.getRemoteTags()
  vim.ui.select(tags, {
    prompt = "Select tag to delete:",
  }, function(tag)
    if tag == nil then
      return
    end

    vim.cmd("Git push origin --delete " .. tag)
  end)
end

local function deleteLocalTag()
  local tags = gitUtils.getTags()
  vim.ui.select(tags, {
    prompt = "Select tag to delete:",
  }, function(tag)
    if tag == nil then
      return
    end

    vim.cmd("Git tag -d " .. tag)
  end)
end

local function pushTag()
  local tags = gitUtils.getTags()
  vim.ui.select(tags, {
    prompt = "Select tag to push:",
  }, function(tag)
    if tag == nil then
      return
    end

    vim.cmd("Git push origin " .. tag)
  end)
end

local function revertBranchToCommit()
  local commitLines, commitLineToSha = gitUtils.getCommitLineToSha(false)

  vim.ui.select(commitLines, {
    prompt = "Select commit to revert:",
  }, function(commitLine)
    if commitLine == nil then
      return
    end

    local sha = commitLineToSha[commitLine]
    vim.cmd("Git revert " .. sha)
  end)
end

local function deleteRemoteBranch()
  local remoteBranchNames = gitUtils.getRemoteBranchNames()
  vim.ui.select(remoteBranchNames, {
    prompt = "Select branch to delete:",
  }, function(branchName)
    if branchName == nil then
      return
    end

    vim.cmd("Git push origin --delete " .. branchName)
  end)
end

local function cherryPickCommit()
  local commitLines, commitLineToSha = gitUtils.getCommitLineToSha(true)

  vim.ui.select(commitLines, {
    prompt = "Select commit to cherry-pick:",
  }, function(commitLine)
    if commitLine == nil then
      return
    end

    local sha = commitLineToSha[commitLine]
    vim.cmd("Git cherry-pick " .. sha)
  end)
end

local function mergeBranch()
  local branchNames = gitUtils.getRepoBranchNames()
  local currentBranch = gitUtils.getCurrentBranchName()

  for i, branchName in ipairs(branchNames) do
    if branchName == currentBranch then
      table.remove(branchNames, i)
      break
    end
  end

  vim.ui.select(branchNames, {
    prompt = "Select branch to merge:",
  }, function(branchName)
    if branchName == nil then
      return
    end

    vim.cmd("Git merge " .. branchName)
  end)
end

local function rebaseWithBranch()
  local branchNames = gitUtils.getRepoBranchNames()
  local currentBranch = gitUtils.getCurrentBranchName()

  for i, branchName in ipairs(branchNames) do
    if branchName == currentBranch then
      table.remove(branchNames, i)
      break
    end
  end

  vim.ui.select(branchNames, {
    prompt = "Select branch to rebase:",
  }, function(branchName)
    if branchName == nil then
      return
    end

    vim.cmd("Git rebase " .. branchName)
  end)
end

local function bisectGoodInital()
  local commitLines, commitLineToSha = gitUtils.getCommitLineToSha()

  vim.ui.select(commitLines, {
    prompt = "Select good commit:",
  }, function(commitLine)
    if commitLine == nil then
      return
    end

    local sha = commitLineToSha[commitLine]
    vim.cmd("Git bisect good " .. sha)
  end)
end

local function dropStash()
  local stashLines, stashLineToIndex = gitUtils.getStashLineToIndex()

  vim.ui.select(stashLines, {
    prompt = "Select stash to drop:",
  }, function(stashLine)
    if stashLine == nil then
      return
    end

    local index = stashLineToIndex[stashLine]
    vim.cmd("Git stash drop " .. index)
  end)
end

local function createStash()
  local stashMessage = inputUtils.getInputFromUser("Stash Message: ")
  if stashMessage == "" then
    return
  end
  vim.cmd("Git stash save " .. stashMessage)
end

local function deleteLocalBranch()
  local branchNames = gitUtils.getRepoBranchNames()
  local currentBranch = gitUtils.getCurrentBranchName()

  for i, branchName in ipairs(branchNames) do
    if branchName == currentBranch then
      table.remove(branchNames, i)
      break
    end
  end

  if #branchNames == 0 then
    print("No branches to delete")
    return
  end

  vim.ui.select(branchNames, {
    prompt = "Select branch to delete:",
  }, function(branchName)
    if branchName == nil then
      return
    end

    vim.cmd("Git branch -D " .. branchName)
  end)
end

local function resetToReflogIndex()
  local reflogLines, reflogLineToIndex = gitUtils.getReflogLineToIndex()

  vim.ui.select(reflogLines, {
    prompt = "Select reflog to reset to:",
  }, function(reflogLine)
    if reflogLine == nil then
      return
    end

    local index = reflogLineToIndex[reflogLine]
    vim.cmd("Git reset --hard HEAD@{" .. index .. "}")
  end)
end

local function rebaseBranchInteractive()
  local commitLines, commitLineToIndex = gitUtils.getCommitLineTables()

  vim.ui.select(commitLines, {
    prompt = "Select commit to rebase:",
  }, function(commitLine)
    if commitLine == nil then
      return
    end

    -- index find
    local index = commitLineToIndex[commitLine]
    vim.cmd("Git rebase -i HEAD~" .. index)
  end)
end

local function syncBranchWithRemote()
  local branchNames = gitUtils.getRepoBranchNames()
  local currentBranch = gitUtils.getCurrentBranchName()

  for i, branchName in ipairs(branchNames) do
    if branchName == currentBranch then
      table.remove(branchNames, i)
      break
    end
  end

  vim.ui.select(branchNames, {
    prompt = "Select branch to sync with:",
  }, function(branchName)
    if branchName == nil then
      return
    end

    vim.cmd("Git fetch origin " .. branchName .. ":" .. branchName)
    vim.cmd("Git pull -r origin " .. branchName .. ":" .. branchName)
  end)
end

local function restHardWithBranch()
  local branchNames = gitUtils.getRepoBranchNames()
  local currentBranch = gitUtils.getCurrentBranchName()

  for i, branchName in ipairs(branchNames) do
    if branchName == currentBranch then
      table.remove(branchNames, i)
      break
    end
  end

  vim.ui.select(branchNames, {
    prompt = "Select branch to reset:",
  }, function(branchName)
    if branchName == nil then
      return
    end

    vim.cmd("Git reset --hard " .. branchName)
  end)
end

return {
  addTag = addTag,
  addTagToHash = addTagToHash,
  bisectGoodInital = bisectGoodInital,
  changeLastCommitMessage = changeLastCommitMessage,
  cherryPickCommit = cherryPickCommit,
  createBranch = createBranch,
  createCommit = createCommit,
  createStash = createStash,
  createWorktree = createWorktree,
  deleteLocalBranch = deleteLocalBranch,
  deleteRemoteBranch = deleteRemoteBranch,
  deleteRemoteTag = deleteRemoteTag,
  deleteLocalTag = deleteLocalTag,
  diffBranch = diffBranch,
  diffHash = diffHash,
  diffRemote = diffRemote,
  dropStash = dropStash,
  logBranch = logBranch,
  logDiffWithHash = logDiffWithHash,
  logDiffWithRemote = logDiffWithRemote,
  mergeBranch = mergeBranch,
  pushTag = pushTag,
  rebaseWithBranch = rebaseWithBranch,
  rebaseBranchInteractive = rebaseBranchInteractive,
  renameCurrentBranch = renameCurrentBranch,
  resetBranchHardWithOrigin = resetBranchHardWithOrigin,
  resetToReflogIndex = resetToReflogIndex,
  resetHardWithBranch = restHardWithBranch,
  revertBranchToCommit = revertBranchToCommit,
  searchCommitMessagesCommits = searchCommitMessagesCommits,
  searchCommitMessagesDiffs = searchCommitMessagesDiffs,
  syncBranchWithRemote = syncBranchWithRemote,
}
