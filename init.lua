require("options")
require("keymaps")
require("plugins")
require("config.telescope")
require("config.nvim-tree")
require("config.prettier")
require("snippets")
require("config.dashboard")

vim.notify = function(msg, ...)
  if msg:match("vim%.tbl_flatten") then return end
  require("notify")(msg, ...)
end