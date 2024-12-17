--    /\
--   /  \
--   /  \
--  /  o \
--  /    \
-- / u    \
-- --------
--    ||
--    ||

local function make_tree(length)
  local output = {}
  for n=0, length-1 do
    local line1=string.rep(" ", length-n) .. "/" .. string.rep(" ", n*2) .. "\\"
    local line2=string.rep(" ", length-n-1) .. "/" .. string.rep(" ", (n+1)*2) .. "\\"
    table.insert(output, line1)
    table.insert(output, line2)
  end 

  table.insert(output, string.rep("-", length*2+2))
  table.insert(output, string.rep(" ", length) .. "||")
  table.insert(output, string.rep(" ", length) .. "||")

  return output
end

return make_tree(12) 

-- for _, line in ipairs(tree) do
--   print(line)
-- end
