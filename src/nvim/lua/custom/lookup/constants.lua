local technicalLinkField = {
  REPO = "repo",
  DIFF = "diff",
  TEST_LOGS = "testLogs",
  TEST_PODS = "testPods",
  PROD_LOGS = "prodLogs",
  PROD_PODS = "prodPods",
  CONTAINER_REGISTRY = "containerRegistry",
  LOCAL_SERVER = "localServer",
  TEST_SERVER = "testServer",
  PROD_SERVER = "prodServer",
  DESIGN = "design",
}

local repoNameToTechnicalLink = require('hidden.technical-links')
local usefulLink = require('hidden.useful-links')

local githubRepoNames = {}
for repoName, _ in pairs(repoNameToTechnicalLink) do
  table.insert(githubRepoNames, repoName)
end

local usefulLinkNames = {}
for key in pairs(usefulLink) do
  table.insert(usefulLinkNames, key)
end

return {
  repoNameToTechnicalLink = repoNameToTechnicalLink,
  technicalLinkField = technicalLinkField,
  usefulLink = usefulLink,
  usefulLinkNames = usefulLinkNames,
  githubRepoNames = githubRepoNames,
}
