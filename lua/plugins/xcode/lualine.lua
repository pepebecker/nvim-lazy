return {
  "nvim-lualine/lualine.nvim",
  optional = true,
  event = "VeryLazy",
  opts = function(_, opts)
    local palette = require("catppuccin.palettes").get_palette()
    table.insert(opts.sections.lualine_x, 2, {
      function()
        return '󰙨 ' .. vim.g.xcodebuild_test_plan
      end,
      color = function()
        return { fg = palette.teal }
      end
    })
    table.insert(opts.sections.lualine_x, 2, {
      function()
        return vim.g.xcodebuild_platform == 'macOS' and '  macOS' or
            ' ' .. vim.g.xcodebuild_device_name .. ' (' .. vim.g.xcodebuild_os .. ')'
      end,
      color = function()
        return { fg = palette.yellow }
      end
    })
  end,
}
