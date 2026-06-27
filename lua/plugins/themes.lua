return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
  },

  {
    "rebelot/kanagawa.nvim",
    priority = 900,
  },

  {
    "vague-theme/vague.nvim",
    priority = 900,
  },

  {
    "bluz71/vim-moonfly-colors",
    priority = 900,
  },

  {
    "AlexvZyl/nordic.nvim",
    priority = 900,
  },

  {
    "neanias/everforest-nvim",
    priority = 900,
  },

  {
    "ellisonleao/gruvbox.nvim",
    priority = 900,
  },

  {
    "shaunsingh/nord.nvim",
    priority = 900,
  },

  {
    "Mofiqul/dracula.nvim",
    priority = 900,
  },

  {
    "olimorris/onedarkpro.nvim",
    priority = 900,
  },

  {
    "craftzdog/solarized-osaka.nvim",
    priority = 900,
  },

  {
    "sainnhe/sonokai",
    priority = 900,
  },

  {
    "savq/melange-nvim",
    priority = 900,
  },

  {
    "ribru17/bamboo.nvim",
    priority = 900,
  },

  {
    "sainnhe/edge",
    priority = 900,
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
