-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- set scroll speed to 1
vim.opt.mousescroll = "ver:2,hor:4"

-- Make cmp background transparent
vim.opt.pumblend = 0

function P(arg)
  print(vim.inspect(arg))
end
