local inputUtils = require("custom.input.utils")
local loggingUtils = require("custom.logging.utils")

local function logWithInput(prefix, prompt)
  return function()
    local message = prefix .. inputUtils.getInputFromUser(prompt)

    loggingUtils.log(message)
  end
end

local function log(message)
  return function()
    loggingUtils.log(message)
  end
end

return {
  logWithInput = logWithInput,
  log = log,
}
