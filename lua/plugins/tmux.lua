return {
  "christoomey/vim-tmux-navigator",
  lazy = false,
  keys = {
    {
      "<C-h>",
      "<cmd> TmuxNavigateLeft <CR>",
      desc = "Navigate to the left tmux pane",
    },
    {
      "<C-l>",
      "<cmd> TmuxNavigateRight <CR>",
      desc = "Navigate to the right tmux pane",
    },
    {
      "<C-k>",
      "<cmd> TmuxNavigateUp <CR>",
      desc = "Navigate to the up tmux pane",
    },
    {
      "<C-j>",
      "<cmd> TmuxNavigateDown <CR>",
      desc = "Navigate to the down tmux pane",
    },
  },
}
