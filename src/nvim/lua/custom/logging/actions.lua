local inputUtils = require("custom.input.utils")
local loggingUtils = require("custom.logging.utils")

local function logWithInput(dirName, prefix, prompt)
  return function()
    local message = prefix .. inputUtils.getInputFromUser(prompt)

    loggingUtils.log(dirName, message)
  end
end

local function log(dirName, message)
  return function()
    loggingUtils.log(dirName, message)
  end
end

return {
  logWithInput = logWithInput,
  log = log,
}
