local M = {}

local defaults = require("kak.defaults")

function M.setup(opts)
  local opts = vim.tbl_deep_extend("force", defaults, opts or {})

  require("kak.keybinds").setup(opts)

  if opts.full and package.loaded["which-key"] ~= nil then
    require("kak.which-key-integration")
  end
end

return M
