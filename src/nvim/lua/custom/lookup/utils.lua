local urlUtils = require('custom.url.utils')
local fileUtils = require('custom.files.utils')
local hiddenConstants = require('hidden.constants')
local jiraTicketUrl

if hiddenConstants ~= nil then
  jiraTicketUrl = hiddenConstants.jiraTicketUrl
else
  jiraTicketUrl = "https://jira.com/browse/"
end

local function openUrlInBrowser(url)
  fileUtils.open(url)
end

local function openUrl(url)
  vim.cmd("silent !firefox " .. url)
end

local getGoogleSearchUrl = function(query)
  local encodedQuery = urlUtils.urlencode(query)
  return "https://www.google.com/search?q=" .. encodedQuery
end


local getNpmUrl = function(query)
  local encodedQuery = urlUtils.urlencode(query)
  return "https://www.npmjs.com/package/" .. encodedQuery
end

local function getJiraLinkWithTicket(ticket)
  return jiraTicketUrl .. ticket
end

return {
  openUrlInBrowser = openUrlInBrowser,
  getGoogleSearchUrl = getGoogleSearchUrl,
  getJiraLinkWithTicket = getJiraLinkWithTicket,
  openUrl = openUrl,
  getNpmUrl = getNpmUrl,
}
