local gitUtils = require('custom.git.utils')
local lookupUtils = require('custom.lookup.utils')
local inputUtils = require('custom.input.utils')
local constants = require('custom.lookup.constants')
local fileUtils = require('custom.files.utils')

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

local function openTechnicalLinkCurrent(technicalLinkType)
  return function()
    local repoName = fileUtils.getCwdName()
    if repoName == nil then
      print("No repo found in current directory")
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
  local jiraTicket = gitUtils.getJiraTicketFromBranchName(branchName)
  if jiraTicket == "" then
    print("No Jira ticket found in branch name")
    return
  end

  local jiraLink = lookupUtils.getJiraLinkWithTicket(jiraTicket)
  lookupUtils.openUrlInBrowser(jiraLink)
end

local function googleSearchSelected()
  vim.cmd("normal! y")
  local selectedText = vim.fn.getreg('"')
  local url = lookupUtils.getGoogleSearchUrl(selectedText)
  lookupUtils.openUrlInBrowser(url)
end

local function openNpmUrl()
  vim.cmd("normal! yiW")
  local selectedText = vim.fn.getreg('"')
  selectedText = selectedText:gsub('"', ''):gsub(':', '')
  local url = lookupUtils.getNpmUrl(selectedText)
  lookupUtils.openUrlInBrowser(url)
end

local function googleSearch()
  local inputText = inputUtils.getInputFromUserRequired("Google Search: ")
  local url = lookupUtils.getGoogleSearchUrl(inputText)
  lookupUtils.openUrlInBrowser(url)
end

return {
  googleSearch = googleSearch,
  googleSearchSelected = googleSearchSelected,
  openJiraTicket = openJiraTicket,
  openUsefulLink = openUsefulLink,
  openNpmUrl = openNpmUrl,
  openTechnicalLink = openTechnicalLink,
  openTechnicalLinkCurrent = openTechnicalLinkCurrent,
}
