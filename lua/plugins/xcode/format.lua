return {
  "stevearc/conform.nvim",
  event = { "BufReadPre", "BufNewFile" },
  ---@param opts ConformOpts
  opts = function(_, opts)
    opts.formatters_by_ft.swift = { "swiftformat_ext" }
    opts.formatters.swiftformat_ext = {
      command = "swiftformat",
      args = function()
        return {
          -- "--config",
          -- utils.find_config(".swiftformat") or "~/.config/nvim/.swiftformat", -- update fallback path if needed
          "--stdinpath",
          "$FILENAME",
        }
      end,
      range_args = function(ctx)
        return {
          -- "--config",
          -- utils.find_config(".swiftformat") or "~/.config/nvim/.swiftformat", -- update fallback path if needed
          "--linerange",
          ctx.range.start[1] .. "," .. ctx.range["end"][1],
        }
      end,
      stdin = true,
      condition = function(ctx)
        return vim.fs.basename(ctx.filename) ~= "README.md"
      end,
    }
  end,
}
