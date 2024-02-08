return {
  "neovim/nvim-lspconfig",
  init = function()
    local lspconfig = require("lspconfig")

    -- GLSL
    lspconfig.glslls.setup({ cmd = { "glslls", "--stdin", "--target-env=opengl" } })
    lspconfig.glsl_analyzer.setup({})

    -- Swift and C/C++/Objective-C
    lspconfig.sourcekit.setup({
      cmd = {
        "/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/sourcekit-lsp",
      },
      root_dir = function(filename, _)
        local util = require("lspconfig.util")
        return util.root_pattern("buildServer.json")(filename)
          or util.root_pattern("*.xcodeproj", "*.xcworkspace")(filename)
          or util.find_git_ancestor(filename)
          or util.root_pattern("Package.swift")(filename)
      end,
    })
  end,
}
