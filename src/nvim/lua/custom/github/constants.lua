local constants = require('hidden.constants')

local username;

if constants.githubUsername == nil then
  username = 'github-username'
else
  username = constants.githubUsername
end

return {
  username = username,
}
