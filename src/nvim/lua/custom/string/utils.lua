local function convertSnakeCaseToNormalCase(snakeCase)
  local normalCase = snakeCase:gsub("_", " ")
  return normalCase
end

return {
  convertSnakeCaseToNormalCase = convertSnakeCaseToNormalCase,
}
