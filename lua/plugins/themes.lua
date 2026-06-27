return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
  },

  {
    "rebelot/kanagawa.nvim",
    priority = 900,
    lazy = false,
  },

  {
    "vague-theme/vague.nvim",
    priority = 900,
    lazy = false,
  },

  {
    "bluz71/vim-moonfly-colors",
    priority = 900,
    lazy = false,
  },

  {
    "AlexvZyl/nordic.nvim",
    priority = 900,
    lazy = false,
  },

  {
    "neanias/everforest-nvim",
    priority = 900,
    lazy = false,
  },

  {
    "ellisonleao/gruvbox.nvim",
    priority = 900,
    lazy = false,
  },

  {
    "shaunsingh/nord.nvim",
    priority = 900,
    lazy = false,
  },

  {
    "Mofiqul/dracula.nvim",
    priority = 900,
    lazy = false,
  },

  {
    "olimorris/onedarkpro.nvim",
    priority = 900,
    lazy = false,
  },

  {
    "craftzdog/solarized-osaka.nvim",
    name = "solarized",
    priority = 900,
    lazy = false,
  },

  {
    "sainnhe/sonokai",
    priority = 900,
  },

  {
    "savq/melange-nvim",
    priority = 900,
    lazy = false,
  },

  {
    "ribru17/bamboo.nvim",
    priority = 900,
    lazy = false,
  },

  {
    "sainnhe/edge",
    priority = 900,
    lazy = false,
  },

  {
    "zaldih/themery.nvim",
    lazy = false,
    config = function()
      require("themery").setup({
        themes = {
          "catppuccin-frappe",
          "catppuccin-mocha",
          "kanagawa",
          "vague",
          "moonfly",
          "nordic",
          "everforest",
          "gruvbox",
          "nightfox",
          "nord",
          "dracula",
            "onedarkpro",
            "solarized",
            "sonokai",
            "melange",
            "bamboo",
            "edge",
        },
        livePreview = true,
      })
    end,
  },
}
