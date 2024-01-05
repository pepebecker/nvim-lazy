return {
  "folke/zen-mode.nvim",
  keys = {
    {
      "<leader>Z",
      "<cmd>ZenMode<cr>",
      desc = "Browse Files",
    },
  },
  opts = {
    plugins = {
      wezterm = {
        enabled = false,
        -- font = "+2",
      },
      tmux = {
        -- enabled = true,
      },
    },
    on_open = function()
      local command = "tmux list-panes -F '#F' | grep -q Z"
      local exit_code = os.execute(command)
      if exit_code ~= 0 then
        vim.fn.jobstart("tmux resize-pane -Z")
      end
    end,
    on_close = function()
      local command = "tmux list-panes -F '#F' | grep -q Z"
      local exit_code = os.execute(command)
      if exit_code == 0 then
        vim.fn.jobstart("tmux resize-pane -Z")
      end
    end,
  },
}
