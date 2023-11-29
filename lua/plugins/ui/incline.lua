return {
  "b0o/incline.nvim",
  event = "BufReadPre",
  priority = 1200,
  config = function()
    local colors = require("catppuccin.palettes.macchiato")
    require("incline").setup({
      hide = {
        cursorline = true,
      },
      render = function(props)
        local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
        local bg = props.focused and colors.base or colors.surface0
        local fg = props.focused and colors.text or colors.text
        local icon, color = require("nvim-web-devicons").get_icon_color(filename)
        local iconColor = props.focused and color or colors.text
        return {
          { "", guifg = bg },
          { icon, guibg = bg, guifg = iconColor },
          { " ", guibg = bg },
          vim.bo[props.buf].modified and { "󰐖 ", guibg = bg, guifg = colors.red } or {},
          { filename, guibg = bg, guifg = fg },
          { "", guifg = bg },
        }
      end,
    })
  end,
}
