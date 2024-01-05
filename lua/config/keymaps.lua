-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local keymap = vim.keymap
local opts = { noremap = true, silent = true }

-- Select all
vim.keymap.set("n", "<C-a>", "ggVG")

-- Tabs
vim.keymap.set("n", "<leader>t", "<cmd>tabedit<cr>", opts)

-- Split window
keymap.set("n", "ss", ":split<Return>", opts)
keymap.set("n", "sv", ":vsplit<Return>", opts)

-- Move window
keymap.set("n", "s<Left>", "<C-w>h")
keymap.set("n", "s<Up>", "<C-w>k")
keymap.set("n", "s<Down>", "<C-w>j")
keymap.set("n", "s<Right>", "<C-w>l")

-- Resize window
keymap.set("n", "<C-w><left>", "<C-w><")
keymap.set("n", "<C-w><right>", "<C-w>>")
keymap.set("n", "<C-w><up>", "<C-w>+")
keymap.set("n", "<C-w><down>", "<C-w>-")

vim.keymap.set(
  "n",
  "<leader>xd",
  "<cmd>Telescope diagnostics<cr>",
  { noremap = true, silent = true, desc = "Open Diagnostics in Telescope" }
)

vim.keymap.set("n", "<leader>cg", function()
  local cmd = require("copilot.command")
  if require("copilot.client").is_disabled() then
    cmd.enable()
    print("Copilot enabled")
  else
    cmd.disable()
    print("Copilot disabled")
  end
end, { noremap = true, silent = true, desc = "Toggle Copilot" })
