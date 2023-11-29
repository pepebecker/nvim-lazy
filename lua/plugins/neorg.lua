return {
  "nvim-neorg/neorg",
  enabled = true,
  build = ":Neorg sync-parsers",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    require("neorg").setup({
      load = {
        ["core.defaults"] = {}, -- Loads default behaviour
        ["core.concealer"] = {}, -- Adds pretty icons to your documents
        ["core.dirman"] = { -- Manages Neorg workspaces
          config = {
            workspaces = {
              notes = "~/Documents/Neorg/notes",
              korean = "~/Documents/Neorg/korean",
              japanese = "~/Documents/Neorg/japanese",
              chinese = "~/Documents/Neorg/chinese",
            },
            default_workspace = "notes",
          },
        },
      },
    })
  end,
}
