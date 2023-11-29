return {
  "nvim-tree/nvim-web-devicons",
  lazy = true,
  opts = function(_, opts)
    local glsl = {
      icon = "",
      color = "#5586a6",
      cterm_color = "65",
      name = "GLSL",
    }
    opts = opts or {}
    opts.override_by_extension = {
      glsl = glsl,
      vert = glsl,
      frag = glsl,
      odin = {
        icon = "",
        color = "#3882d2",
        cterm_color = "214",
        name = "Odin",
      },
    }
  end,
}
