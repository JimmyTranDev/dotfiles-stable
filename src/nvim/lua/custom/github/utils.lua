local function getRepoName()
  local fullUrl = vim.fn.system("git config --get remote.origin.url")
  local repoName = string.match(fullUrl, ".*/(.*)%.git")
  return repoName
end

local function getRepoUrl(githubUsername, repoName)
  local url = "https://github.com/" .. githubUsername .. "/" .. repoName
  return url;
end


return {
  getRepoName = getRepoName,
  getRepoUrl = getRepoUrl,
}
