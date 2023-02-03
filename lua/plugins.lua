vim.cmd [[packadd packer.nvim]]

return require("packer").startup(function()
  use("wbthomason/packer.nvim")
  -- use('vim-airline/vim-airline')
  -- use('vim-airline/vim-airline-themes')
  -- use('scrooloose/nerdtree')

  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }

  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons', -- optional, for file icons
    },
    tag = 'nightly' -- optional, updated every week. (see issue #1193)
  }

  use({'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'})

  use('nvim-lua/plenary.nvim')
  use({'nvim-telescope/telescope.nvim', tag = '0.1.1' })

-- LSP
 -- use({'neoclide/coc.nvim', branch = 'release'})
 -- use({'elixir-lsp/coc-elixir', run = "yarn install && yarn prepack"})

  use { "williamboman/mason.nvim" }
  use { 'williamboman/nvim-lsp-installer' }

  use {
    'neovim/nvim-lspconfig',
    after = 'nvim-lsp-installer',
    module = 'lspconfig',
    config = function()
      require 'plugins-configs.lsp_installer'
      require 'plugins-configs.lspconfig'
    end
  }

  use {
    'rafamadriz/friendly-snippets',
    module = 'cmp_nvim_lsp',
    event = 'InsertEnter'
  }

  use {
    'hrsh7th/nvim-cmp',
    after = 'friendly-snippets',
    config = function()
      require 'plugin-config.cmp'
    end
  }

  use {
    'L3MON4D3/LuaSnip',
    after = 'nvim-cmp',
    config = function()
      require('plugin-config.configs.others').luasnip()
    end
  }

  use {
    'saadparwaiz1/cmp_luasnip',
    after = 'LuaSnip'
  }

  use {
    'hrsh7th/cmp-nvim-lua',
    after = 'cmp_luasnip'
  }

  use {
    'hrsh7th/cmp-nvim-lsp',
    after = 'cmp-nvim-lua'
  }

  use {
    'hrsh7th/cmp-buffer',
    after = 'cmp-nvim-lsp'
  }

  use {
    'hrsh7th/cmp-path',
    after = 'cmp-buffer'
  }

  use {
    'windwp/nvim-autopairs',
    after = 'nvim-cmp',
    config = function ()
      require("plugin-config.configs.others").autopairs()
    end
  }

  use('nvim-tree/nvim-web-devicons')
  -- use('romgrk/barbar.nvim')

  use {'junegunn/fzf', run = './install --bin' }
  use {'nvim-telescope/telescope-fzf-native.nvim', run = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }

  use 'folke/tokyonight.nvim'

  use 'numToStr/Comment.nvim'

  -- use { 'noib3/nvim-cokeline', requires = 'kyazdani42/nvim-web-devicons' }
  use {'akinsho/bufferline.nvim', tag = "v3.*", requires = 'nvim-tree/nvim-web-devicons'}
end)
