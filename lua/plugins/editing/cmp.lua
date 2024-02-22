local function get_hl_group(name)
  return "Cmp" .. name
end

return {
  "hrsh7th/nvim-cmp",
  version = false,
  event = "InsertEnter",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-nvim-lsp-signature-help",
    "davidmh/cmp-nerdfonts",
    "hrsh7th/cmp-emoji",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
  },
  opts = function()
    local cmp = require("cmp")
    local defaults = require("cmp.config.default")()
    local luasnip = require("luasnip")
    local palette = require("catppuccin.palettes").get_palette()

    local sourceIcons = {
      nvim_lsp = " LSP",
      nvim_lsp_signature_help = " SGN",
      luasnip = " SNP",
      buffer = "󰎞 BUF",
      copilot = " CPT",
      emoji = "󰞅 EMJ",
      nerdfonts = " NFT",
      path = " PTH",
    }

    local colors = {
      -- Kinds
      Copilot = palette.peach,
      -- Sources
      nvim_lsp = palette.red,
      nvim_lsp_signature_help = palette.yellow,
      luasnip = palette.mauve,
      buffer = palette.text,
      copilot = palette.peach,
      emoji = palette.maroon,
      nerdfonts = palette.maroon,
      path = palette.subtext0,
    }

    vim.api.nvim_set_hl(0, "CmpGhostText", { fg = palette.rosewater })

    return {
      colors = colors,
      window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
      },
      completion = {
        completeopt = "menu,menuone,noinsert",
      },
      mapping = cmp.mapping.preset.insert({
        ["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
        ["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
        ["<C-k>"] = cmp.mapping.scroll_docs(-4),
        ["<C-j>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.abort(),
        ["<CR>"] = cmp.mapping.confirm({ select = false }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        ["<S-CR>"] = cmp.mapping.confirm({
          behavior = cmp.ConfirmBehavior.Replace,
          select = true,
        }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        ["<C-CR>"] = function(fallback)
          cmp.abort()
          fallback()
        end,
        ["<C-b>"] = cmp.mapping(function(fallback)
          if luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { "i", "s" }),
        ["<C-f>"] = cmp.mapping(function(fallback)
          if luasnip.jumpable(1) then
            luasnip.jump(1)
          else
            fallback()
          end
        end, { "i", "s" }),
      }),
      sources = cmp.config.sources({
        { name = "nvim_lsp", priority = 500 },
        { name = "nvim_lsp_signature_help" },
        { name = "luasnip" },
        { name = "nerdfonts" },
        { name = "emoji" },
        { name = "path" },
      }, {
        { name = "buffer" },
      }),
      formatting = {
        fields = { "kind", "abbr", "menu" },
        format = function(entry, item)
          local icons = require("lazyvim.config").icons.kinds
          if colors[item.kind] ~= nil then
            item.kind_hl_group = get_hl_group(item.kind)
          end
          item.kind = icons[item.kind] or item.kind
          item.abbr = string.sub(item.abbr, 1, 40)
          local source = entry.source.name
          item.menu = sourceIcons[source] or ("[" .. source .. "]")
          item.menu_hl_group = get_hl_group(source)
          return item
        end,
      },
      experimental = {
        ghost_text = {
          hl_group = "CmpGhostText",
        },
      },
      sorting = defaults.sorting,
    }
  end,
  ---@param opts cmp.ConfigSchema
  config = function(_, opts)
    for _, source in ipairs(opts.sources) do
      source.group_index = source.group_index or 1
    end
    ---@diagnostic disable-next-line: undefined-field
    for key, color in pairs(opts.colors) do
      vim.api.nvim_set_hl(0, get_hl_group(key), { fg = color })
    end
    require("cmp").setup(opts)
  end,
}
