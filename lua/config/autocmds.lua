-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "glsl", "vert", "frag" },
  callback = function()
    vim.bo.commentstring = "// %s"
  end,
  group = vim.api.nvim_create_augroup("glsl", { clear = true }),
})
