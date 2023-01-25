local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
  -- Packer manger
  use 'wbthomason/packer.nvim'

  -- Package used for a lot of other plugins
  use { "nvim-lua/plenary.nvim" }

  -- Colorschemes
  use { "folke/tokyonight.nvim" }

  -- Identline
  use { "lukas-reineke/indent-blankline.nvim" }

  -- Nvim Tree
  use { 'nvim-tree/nvim-tree.lua',
    requires = {'nvim-tree/nvim-web-devicons'} , -- optional, for file icons
  }

  -- Telescope
  use { 'nvim-telescope/telescope.nvim', tag = '0.1.0',
    requires = { {'nvim-lua/plenary.nvim'} }
  }

  -- Toggleterm
  use { "akinsho/toggleterm.nvim" ,
    tag = '*',
    config = function()
      require("toggleterm").setup()
    end
  }

  -- Send REPL to Window
  use { "karoliskoncevicius/vim-sendtowindow" } 

  -- Autopairs
  use { "windwp/nvim-autopairs" }

  -- Lualine
  use {'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true}
  }

  -- Bufferline
  use {'akinsho/bufferline.nvim', tag = "v3.*",
    requires = { 'nvim-tree/nvim-web-devicons' }
  }

  -- GitSigns
  use { 'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup()
    end
  }

  -- Markdown
  -- install without yarn or npm
  use({
      "iamcco/markdown-preview.nvim",
      run = function()
      vim.fn["mkdp#util#install"]() end,
  })

  use({ "iamcco/markdown-preview.nvim",
    run = "cd app && npm install",
    setup = function()
      vim.g.mkdp_filetypes = { "markdown" } end,
    ft = { "markdown" },
  })

  -- Alpha Dashboard
  use { 'goolord/alpha-nvim',
    config = function ()
      require'alpha'.setup(require'alpha.themes.dashboard'.config)
    end
  }

  -- Treesitter and derivates
  use {
      'nvim-treesitter/nvim-treesitter',
      run = function()
          local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
          ts_update()
      end,
    }

  use { 'nvim-treesitter/nvim-treesitter-context',
    requires = { 'nvim-treesitter/nvim-treesitter' }
  }

  use { 'JoosepAlviste/nvim-ts-context-commentstring',
    require = { 'nvim-treesitter/nvim-treesitter' }
  }

  -- Illuminate
  use { 'RRethy/vim-illuminate' }

  -- Utilities
  use { 'moll/vim-bbye' }
  use { 'tpope/vim-surround' }

  -- Plugin to comment lines properly
  use {
    'numToStr/Comment.nvim',
        require = { 'JoosepAlviste/nvim-ts-context-commentstring' }
  }

  -- LSP support
  use {'williamboman/mason.nvim'}
  use {'williamboman/mason-lspconfig.nvim'}
  use {
    'neovim/nvim-lspconfig',
    config = function() pcall(require, 'plugins.lsp') end,
  }

  -- Autocomplete
  use {
    'hrsh7th/nvim-cmp',
    config = function() pcall(require, 'plugins.nvim-cmp') end,
  }
  use {'hrsh7th/cmp-buffer'}
  use {'hrsh7th/cmp-path'}
  use {'saadparwaiz1/cmp_luasnip'}
  use {'hrsh7th/cmp-nvim-lsp'}

  -- Snippets
  use {
    'L3MON4D3/LuaSnip',
    config = function() pcall(require, 'plugins.luasnip') end,
  }
  use {'rafamadriz/friendly-snippets' }

  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
