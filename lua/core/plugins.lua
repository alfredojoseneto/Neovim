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

  -- Nvim Tree
  use { 'nvim-tree/nvim-tree.lua',
    requires = {'nvim-tree/nvim-web-devicons'} , -- optional, for file icons
  }

  -- Telescope
  use { 'nvim-telescope/telescope.nvim', tag = '0.1.0',
    requires = { {'nvim-lua/plenary.nvim'} }
  }

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

  -- Plugin to comment lines properly
  use {
    'numToStr/Comment.nvim',
        require = { 'JoosepAlviste/nvim-ts-context-commentstring' }
  }

  -- LSP
  -- LSP Support
  use{
    'williamboman/mason.nvim',
    requires = {
      {'neovim/nvim-lspconfig'},             -- Required
      {'williamboman/mason-lspconfig.nvim'}, -- Optional
      -- Autocompletion
      {'hrsh7th/nvim-cmp'},         -- Required
      {'hrsh7th/cmp-nvim-lsp'},     -- Required
      {'hrsh7th/cmp-buffer'},       -- Optional
      {'hrsh7th/cmp-path'},         -- Optional
      {'saadparwaiz1/cmp_luasnip'}, -- Optional
      {'hrsh7th/cmp-nvim-lua'},     -- Optional
      -- Snippets
      {'L3MON4D3/LuaSnip'},             -- Required
    }
  }


  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
