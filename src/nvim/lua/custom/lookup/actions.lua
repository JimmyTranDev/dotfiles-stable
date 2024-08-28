local gitUtils = require('custom.git.utils')
local githubUtils = require('custom.github.utils')
local githubConstants = require('custom.github.constants')
local lookupUtils = require('custom.lookup.utils')
local constants = require('custom.lookup.constants')

local function openTechnicalLink(technicalLinkType)
  return function()
    vim.ui.select(constants.githubRepoNames, {
      prompt = "Select repo to open:",
    }, function(repoName)
      if repoName == nil then
        return
      end
      local technicalLink = constants.repoNameToTechnicalLink[repoName]
      if technicalLink == nil then
        print("No technical link found for repo: " .. repoName)
        return
      end
      local url = technicalLink[technicalLinkType]
      if url == nil then
        print("No url found for technical link type: " .. technicalLinkType)
        return
      end
      lookupUtils.openUrlInBrowser(url)
    end)
  end
end

local function openGithubUrlPrivate()
  local githubUsername = githubConstants.username
  local currentRepoName = githubUtils.getRepoName()
  if currentRepoName == nil then
    print("Git remote origin not found")
    return
  end
  local currentRepoUrl = githubUtils.getRepoUrl(githubUsername, currentRepoName)
  lookupUtils.openUrlInBrowser(currentRepoUrl)
end

local function openTechnicalLinkCurrent(technicalLinkType)
  return function()
    local repoName = githubUtils.getRepoName()
    if repoName == nil then
      print("No repo found in current directory")
      return
    end

    local technicalLink = constants.repoNameToTechnicalLink[repoName]
    if technicalLink == nil then
      openGithubUrlPrivate()
      print("No technical link found for repo: " .. repoName)
      return
    end
    local url = technicalLink[technicalLinkType]
    if url == nil then
      print("No url found for technical link type: " .. technicalLinkType)
      return
    end
    lookupUtils.openUrlInBrowser(url)
  end
end

local function openUsefulLink()
  vim.ui.select(constants.usefulLinkNames, {
    prompt = "Select link to open:",
  }, function(linkName)
    if linkName == nil then
      return
    end
    if linkName == "" then
      return
    end
    lookupUtils.openUrlInBrowser(constants.usefulLink[linkName])
  end)
end

local function openJiraTicket()
  local branchName = gitUtils.getCurrentBranchName()
  local jiraTicket = gitUtils.getJiraTicket(branchName)
  if jiraTicket == "" then
    print("No Jira ticket found in branch name")
    return
  end

  local jiraLink = lookupUtils.getJiraLinkWithTicket(jiraTicket)
  lookupUtils.openUrlInBrowser(jiraLink)
end

local function openNpmUrl()
  vim.cmd("normal! yiW")
  local selectedText = vim.fn.getreg('"')
  selectedText = selectedText:gsub('"', ''):gsub(':', '')
  local url = lookupUtils.getNpmUrl(selectedText)
  lookupUtils.openUrlInBrowser(url)
end

return {
  openJiraTicket = openJiraTicket,
  openUsefulLink = openUsefulLink,
  openNpmUrl = openNpmUrl,
  openTechnicalLink = openTechnicalLink,
  openTechnicalLinkCurrent = openTechnicalLinkCurrent,
  openGithubUrlPrivate = openGithubUrlPrivate,
}
