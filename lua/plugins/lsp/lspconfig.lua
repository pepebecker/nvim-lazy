return {
  "neovim/nvim-lspconfig",
  init = function()
    -- GLSL
    require("lspconfig").glslls.setup({ cmd = { "glslls", "--stdin", "--target-env=opengl" } })
    require("lspconfig").glsl_analyzer.setup({})

    -- Swift and C/C++/Objective-C
    require("lspconfig").sourcekit.setup({})
  end,
}
