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
  use { 'neovim/nvim-lspconfig' }

  -- Automatically set up your configuration after cloning packer.nvim
  --
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
