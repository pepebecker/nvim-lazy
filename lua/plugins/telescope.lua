return {
  "nvim-telescope/telescope.nvim",
  config = function()
    if vim.g.neovide ~= nil then
      require("telescope").setup({
        defaults = {
          winblend = 90,
        },
      })
    end
  end,
}
