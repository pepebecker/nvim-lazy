return {
  "epwalsh/obsidian.nvim",
  version = "*", -- recommended, use latest release instead of latest commit
  lazy = true,
  ft = "markdown",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  opts = {
    workspaces = {
      {
        name = "Notes",
        path = "/Users/pepe/Library/Mobile Documents/iCloud~md~obsidian/Documents/Pepe's Vault",
      },
    },
  },
}
