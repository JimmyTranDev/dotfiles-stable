local joinPath = function(...)
  local path = ""
  for _, part in ipairs({ ... }) do
    path = path .. part .. "/"
  end
  return path
end

return {
  joinPath = joinPath,
}
