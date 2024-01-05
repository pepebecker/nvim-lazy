return {
  "echasnovski/mini.pairs",
  opts = {
    mappings = {
      ["("] = { action = "open", pair = "()", neigh_pattern = "[^\\].*[^A-z'\"]" },
      ["["] = { action = "open", pair = "[]", neigh_pattern = "[^\\].*[^A-z'\"]" },
      ["{"] = { action = "open", pair = "{}", neigh_pattern = "[^\\].*[^A-z'\"]" },
    },
  },
}
