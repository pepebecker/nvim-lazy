return {
  "b0o/incline.nvim",
  event = "BufReadPre",
  priority = 1200,
  config = function()
    local palette = require("catppuccin.palettes").get_palette()
    require("incline").setup({
      hide = {
        cursorline = true,
      },
      render = function(props)
        local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
        local bg = props.focused and palette.base or palette.surface0
        local fg = props.focused and palette.text or palette.text
        local icon, color = require("nvim-web-devicons").get_icon_color(filename)
        local iconColor = props.focused and color or palette.text
        return {
          { "", guifg = bg },
          { icon .. " ", guibg = bg, guifg = iconColor },
          { filename, guibg = bg, guifg = vim.bo[props.buf].modified and palette.red or fg },
          { "", guifg = bg },
        }
      end,
    })
  end,
}
