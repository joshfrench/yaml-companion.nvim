local M = {}
local matchers = require("yaml-companion._matchers")

M.defaults = {
  builtin_matchers = {
    kubernetes = { enabled = true },
  },
  schemas = {},
}

M.options = {}

function M.setup(options)
  if options == nil then
    options = {}
  end

  M.options = vim.tbl_deep_extend("force", {}, M.defaults, options or {})

  for name, matcher in pairs(M.options.builtin_matchers) do
    if matcher.enabled then
      matchers.load(name)
    end
  end
end

return M
