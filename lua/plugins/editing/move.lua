local opts = { noremap = true, silent = true }
return {
  "fedepujol/move.nvim",
  keys = {
    -- Normal mode
    { mode = { "n" }, "<A-Up>", "<cmd>MoveLine -1<cr>", desc = "Line: move up", opts },
    { mode = { "n" }, "<A-Down>", "<cmd>MoveLine 1<cr>", desc = "Line: move down", opts },
    { mode = { "n" }, "<A-Left>", "<cmd>MoveHChar -1<cr>", desc = "Char: move left", opts },
    { mode = { "n" }, "<A-Right>", "<cmd>MoveHChar 1<cr>", desc = "Char: move right", opts },
    -- { mode = { "n" }, "<leader>h", "<cmd>MoveHChar -1<cr>", desc = "Char: move left", opts },
    -- { mode = { "n" }, "<leader>j", "<cmd>MoveLine 1<cr>", desc = "Line: move down", opts },
    -- { mode = { "n" }, "<leader>k", "<cmd>MoveLine -1<cr>", desc = "Line: move up", opts },
    -- { mode = { "n" }, "<leader>l", "<cmd>MoveHChar 1<cr>", desc = "Char: move right", opts },
    { mode = { "n" }, "<leader>wb", "<cmd>MoveWord-1<cr>", desc = "Word: move left", opts },
    { mode = { "n" }, "<leader>wf", "<cmd>MoveWord 1<cr>", desc = "Word: move right", opts },
    { mode = { "n" }, "<leader>w<left>", "<cmd>MoveWord -1<cr>", desc = "Word: move left", opts },
    { mode = { "n" }, "<leader>w<right>", "<cmd>MoveWord 1<cr>", desc = "Word: move right", opts },
    -- Visual mode
    { mode = { "v" }, "<A-Up>", ":MoveBlock -1<cr>", desc = "Block: move up", opts },
    { mode = { "v" }, "<A-Down>", ":MoveBlock 1<cr>", desc = "Block: move down", opts },
    { mode = { "v" }, "<A-Left>", ":MoveHBlock -1<cr>", desc = "Block: move left", opts },
    { mode = { "v" }, "<A-Right>", ":MoveHBlock 1<cr>", desc = "Block: move right", opts },
    -- { mode = { "v" }, "<leader>j", ":MoveBlock 1<cr>", desc = "Block: move down", opts },
    -- { mode = { "v" }, "<leader>k", ":MoveBlock -1<cr>", desc = "Block: move up", opts },
    -- { mode = { "v" }, "<leader>h", ":MoveHBlock -1<cr>", desc = "Block: move left", opts },
    -- { mode = { "v" }, "<leader>l", ":MoveHBlock 1<cr>", desc = "Block: move right", opts },
  },
}
