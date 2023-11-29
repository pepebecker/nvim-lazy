return {
  {
    "sourcegraph/sg.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim", --[[ "nvim-telescope/telescope.nvim ]]
    },
    keys = {
      {
        mode = { "v", "n" },
        "<Leader>sgs",
        "<cmd>SourcegraphSearch<cr>",
        desc = "Search Sourcegraph",
      },
    },
  },
}
