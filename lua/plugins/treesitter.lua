return {
  "nvim-treesitter/nvim-treesitter",
  opts = function(_, opts)
    opts.incremental_selection.keymaps.init_selection = "<A-Space>"
    opts.incremental_selection.keymaps.node_incremental = "<A-Space>"
    opts.incremental_selection.keymaps.node_decremental = "<bs>"
    opts.incremental_selection.keymaps.scope_incremental = "<Enter>"
    vim.list_extend(opts.ensure_installed, {
      "markdown",
      "markdown_inline",
      "glsl",
      "lua",
      "odin",
      "zig",
    })
  end,
}
