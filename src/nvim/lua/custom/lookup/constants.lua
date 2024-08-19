local TechnicalLinkType = {
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

-- TODO: fix naming
local technicalLinks = require('links.technical-links').technicalLinks
local usefulLinks = require('links.useful-links').usefulLinks

local githubRepoNames = {}
for repoName, _ in pairs(technicalLinks) do
  table.insert(githubRepoNames, repoName)
end

local usefulLinkNames = {}
for key in pairs(usefulLinks) do
  table.insert(usefulLinkNames, key)
end

return {
  technicalLinkCollection = technicalLinks,
  TechnicalLinkType = TechnicalLinkType,
  linkNameToUsefulLink = usefulLinks,
  usefulLinkNames = usefulLinkNames,
  githubRepoNames = githubRepoNames,
}
