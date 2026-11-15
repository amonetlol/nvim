return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
  },

  { "rebelot/kanagawa.nvim", priority = 900, lazy = false },
  { "neanias/everforest-nvim", priority = 900, lazy = false },
  { "ellisonleao/gruvbox.nvim", priority = 900, lazy = false },
  { "EdenEast/nightfox.nvim", priority = 900, lazy = false },
  { "shaunsingh/nord.nvim", priority = 900, lazy = false },
  { "sainnhe/sonokai", priority = 900, lazy = false },
  { "savq/melange-nvim", priority = 900, lazy = false },
  { "folke/tokyonight.nvim", priority = 900, lazy = false },
  { "navarasu/onedark.nvim", priority = 900, lazy = false },

  {
    "zaldih/themery.nvim",
    lazy = false,
    config = function()
      require("themery").setup({
        themes = {
          "catppuccin-frappe",
          "catppuccin-mocha",
          "kanagawa",
          "everforest",
          "gruvbox",
          "nightfox",
          "nord",
          "sonokai",
          "melange",
          "tokyonight",
          "onedark",
        },
        livePreview = true,
      })
    end,
  },
}
