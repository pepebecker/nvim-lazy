-- Helper function for transparency formatting
local alpha = function()
  return string.format("%x", math.floor(255 * (vim.g.neovide_transparency_point or 0.8)))
end

-- Set transparency and background color (title bar color)
vim.g.neovide_transparency = 0.0
vim.g.neovide_transparency_point = 0.8
vim.g.neovide_background_color = "#0f1117" .. alpha()

-- Add keybinds to change transparency
local change_transparency = function(delta)
  vim.g.neovide_transparency_point = vim.g.neovide_transparency_point + delta
  vim.g.neovide_background_color = "#0f1117" .. alpha()
end

vim.keymap.set({ "n", "v", "o" }, "<D-]>", function()
  change_transparency(0.01)
end)

vim.keymap.set({ "n", "v", "o" }, "<D-[>", function()
  change_transparency(-0.01)
end)
