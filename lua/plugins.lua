vim.cmd [[packadd packer.nvim]]

return require("packer").startup(function(use)
  use("wbthomason/packer.nvim")

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
  use { 
    "williamboman/mason.nvim", 
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig"
  }
  use 'hrsh7th/nvim-cmp' -- Autocompletion plugin
  use "hrsh7th/cmp-nvim-lsp"

  use 'dcampos/nvim-snippy'
  use "L3MON4D3/LuaSnip" -- snippets needes

  use "saadparwaiz1/cmp_luasnip"
  use "rafamadriz/friendly-snippets"
  use "hrsh7th/cmp-path" 
  use 'hrsh7th/cmp-buffer'

  use('nvim-tree/nvim-web-devicons')

  use {'junegunn/fzf', run = './install --bin' }
  use {'nvim-telescope/telescope-fzf-native.nvim', run = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }

  use 'folke/tokyonight.nvim'

  use 'numToStr/Comment.nvim'

  use {'akinsho/bufferline.nvim', tag = "v3.*", requires = 'nvim-tree/nvim-web-devicons'}

  use({ "iamcco/markdown-preview.nvim", run = "cd app && npm install", setup = function() vim.g.mkdp_filetypes = { "markdown" } end, ft = { "markdown" }, })
end)
