return {
  "goolord/alpha-nvim",
  event = "VimEnter",
  enabled = true,
  init = false,
  opts = function()
    local dashboard = require("alpha.themes.dashboard")
    local logo = [[
 ____  ____  ____  ____   __    __
(  _ \(  __)(  _ \/ ___) /  \  /  \
 ) __/ ) _)  ) __/\___ \(  O )(  O )
(__)  (____)(__)  (____/ \__/  \__/
]]
    dashboard.section.header.val = vim.split(logo, "\n")
  end,
}
