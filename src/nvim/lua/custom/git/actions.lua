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
  local message = inputUtils.getInputFromUserRequired("New Commit Message: ", gitUtils.getLastCommitMessage())
  if message ~= "" then
    vim.cmd("Git commit --amend --no-verify -m '" .. message .. "'")
  end
end

local function renameCurrentBranch()
  local prompt = "New Branch Name: "
  local text = gitUtils.getCurrentBranchName() .. " " .. gitUtils.getCurrentBranchName()
  local branch = inputUtils.getInputFromUserRequired(prompt, text)
  if branch ~= "" then
    vim.cmd("Git branch -m " .. branch)
  end
end

local function gitDiffWithDevelop()
  -- Get the name of the current branch
  local current_branch = vim.fn.systemlist("git rev-parse --abbrev-ref HEAD")[1]

  -- Set the target branch as 'develop'
  local target_branch = "develop"

  -- Construct the Fugitive command to show the diff between branches
  local fugitive_command = string.format(":Git log %s..%s", target_branch, current_branch)

  -- Execute the Fugitive command
  vim.cmd(fugitive_command)
end

local function createBranch(prefix)
  return function()
    local branchDescription = inputUtils.getInputFromUserRequired("Branch Description: ")
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
    local jiraTicket = gitUtils.getJiraTicketFromBranchName(branchName)

    local commitDescription = inputUtils.getInputFromUserRequired("󰦨 Description: ")
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
      loggingUtils.log("md_tasks", taskMessage)

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

local function searchCommits()
  local searchString = inputUtils.getInputFromUser("Search: ")
  vim.cmd("Git log -S " .. searchString .. " --source --all")
end

return {
  changeLastCommitMessage = changeLastCommitMessage,
  renameCurrentBranch = renameCurrentBranch,
  gitDiffWithDevelop = gitDiffWithDevelop,
  createCommit = createCommit,
  createBranch = createBranch,
  createWorktree = createWorktree,
  searchCommits = searchCommits,
}
