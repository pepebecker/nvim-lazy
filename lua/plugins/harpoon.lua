return {
  "ThePrimeagen/harpoon",
  keys = {
    {
      "<leader>fm",
      "<cmd>Telescope harpoon marks<cr>",
      desc = "Harpoon: Show Marks in Telescope",
    },
    {
      "<leader>vv",
      function()
        require("harpoon.ui").toggle_quick_menu()
      end,
      desc = "Harpoon: Toggle Quick Menu",
    },
    {
      "<leader>v.",
      function()
        require("harpoon.mark").add_file()
        print("Harpoon: File Added")
      end,
      desc = "Harpoon: Add File",
    },
    {
      "<leader>vh",
      function()
        require("harpoon.ui").nav_prev()
      end,
      desc = "Harpoon: Previous File",
    },
    {
      "<leader>vl",
      function()
        require("harpoon.ui").nav_next()
      end,
      desc = "Harpoon: Next File",
    },
    {
      "<leader>v<Left>",
      function()
        require("harpoon.ui").nav_prev()
      end,
      desc = "Harpoon: Previous File",
    },
    {
      "<leader>v<Right>",
      function()
        require("harpoon.ui").nav_next()
      end,
      desc = "Harpoon: Next File",
    },
  },
}
