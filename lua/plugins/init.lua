return {
  { lazy = true, "nvim-lua/plenary.nvim" },

  { "nvim-tree/nvim-web-devicons", opts = {} },
  { "echasnovski/mini.statusline", opts = {} },
  -- { "lewis6991/gitsigns.nvim", opts = {} },

  -- Theme --
  "EdenEast/nightfox.nvim",
  "rebelot/kanagawa.nvim",
  "vague-theme/vague.nvim",
  "catppuccin/nvim",
  "bluz71/vim-moonfly-colors",
  'AlexvZyl/nordic.nvim',
  "neanias/everforest-nvim",
  -- FIM Theme --

  -- Config sem ele abrir no startup --
  -- {
  --   "nvim-tree/nvim-tree.lua",
  --   lazy = false,
  --   cmd = { "NvimTreeToggle", "NvimTreeFocus" },
  --   opts = {
  --     -- Altera o diretório de trabalho do Neovim (CWD) para a raiz da árvore
  --     sync_root_with_cwd = true,
  --     -- Faz o Nvim-Tree mudar o CWD global do Neovim para a pasta do arquivo aberto no startup
  --     prefer_startup_root = true,
  --     respect_buf_cwd = true,
  --     update_focused_file = {
  --       enable = true,
  --       update_root = true,
  --     },
  --   },
  -- },
  
    {
    "nvim-tree/nvim-tree.lua",
    lazy = false,
    opts = {
      sync_root_with_cwd = true,
      prefer_startup_root = true,
      respect_buf_cwd = true,
      update_focused_file = {
        enable = true,
        update_root = true,
      },
    },
    -- ISSO AQUI FAZ ABRIR SOZINHO:
    init = function()
      vim.api.nvim_create_autocmd("VimEnter", {
        callback = function()
          -- Abre o NvimTree na inicialização
          vim.cmd("NvimTreeOpen")
          -- Opcional: Pula o cursor de volta para o arquivo principal (deixando a árvore aberta ao lado)
          vim.cmd("wincmd p")
        end,
      })
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate | TSInstallAll",
    opts = function()
      return require "plugins.configs.treesitter"
    end,
  },

  {
    "akinsho/bufferline.nvim",
    opts = require "plugins.configs.bufferline",
  },

  -- we use blink plugin only when in insert mode
  -- so lets lazyload it at InsertEnter event
  {
    "saghen/blink.cmp",
    version = "1.*",
    event = "InsertEnter",
    dependencies = {
      "rafamadriz/friendly-snippets",

      -- snippets engine
      {
        "L3MON4D3/LuaSnip",
        config = function()
          require("luasnip.loaders.from_vscode").lazy_load()
        end,
      },

      -- autopairs , autocompletes ()[] etc
      { "windwp/nvim-autopairs", opts = {} },
    },
    -- made opts a function cuz cmp config calls cmp module
    -- and we lazyloaded cmp so we dont want that file to be read on startup!
    opts = function()
      return require "plugins.configs.blink"
    end,
  },

  {
    "williamboman/mason.nvim",
    build = ":MasonUpdate",
    cmd = { "Mason", "MasonInstall" },
    opts = {},
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins.configs.lspconfig"
    end,
  },

  {
    "stevearc/conform.nvim",
    opts = require "plugins.configs.conform",
  },
  {
    "folke/which-key.nvim",
    opts = require "plugins.configs.which-key",
  },

  {
    "nvimdev/indentmini.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = {},
  },

  -- files finder etc
  {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    opts = require "plugins.configs.telescope",
  },

  {
    "zaldih/themery.nvim",
    lazy = false,           -- ou true se preferir carregar sob demanda
    config = function()
      require("themery").setup({
        -- Aqui você lista TODOS os temas que você tem instalado
        themes = {
          "catppuccin-frappe",
          "nightfox",
          "vague",
          "moonfly",
          "nordic",
          "everforest",
          -- adicione mais aqui
        },

        livePreview = true,     -- muda o tema ao navegar (muito bom)
        globalBefore = [[
          -- comandos que rodam antes de aplicar qualquer tema
        ]],
        globalAfter = [[
          -- comandos que rodam depois de aplicar o tema
        ]],
      })
    end,
  },

  
  {
  'akinsho/toggleterm.nvim',
    version = "*",
    config = function()
      -- 1. Inicializa o plugin com as configurações gerais
      require('toggleterm').setup({
        shade_terminals = true,
        persist_size = true,
        insert_mappings = true,
      })

      -- 2. Mapeamento para abrir os terminais (Modo Normal e Terminal)
      vim.keymap.set({'n', 't'}, "<C-'>", "<Cmd>ToggleTerm direction=float<CR>", { desc = "Terminal Flutuante" })
      vim.keymap.set({'n', 't'}, "<C-\\>", "<Cmd>ToggleTerm size=10 direction=horizontal<CR>", { desc = "Terminal Horizontal" })

      -- 3. Mapeamento para SAIR do modo terminal (ESC e Ctrl + /)
      _G.set_terminal_keymaps = function()
        local opts = { buffer = 0 }
        
        -- Ao apertar ESC dentro do terminal flutuante, ele fecha/esconde a janela
        vim.keymap.set('t', '<Esc>', [[<Cmd>ToggleTerm<CR>]], opts)
        
        -- Ao apertar Ctrl + / (ou Ctrl + _), ele também fecha/esconde a janela
        vim.keymap.set('t', '<C-/>', [[<Cmd>ToggleTerm<CR>]], opts)
        vim.keymap.set('t', '<C-_>', [[<Cmd>ToggleTerm<CR>]], opts)

      end

      vim.api.nvim_create_autocmd("TermOpen", {
        pattern = "term://*toggleterm#*",
        callback = function()
          set_terminal_keymaps()
        end,
      })
  end
  },


}
