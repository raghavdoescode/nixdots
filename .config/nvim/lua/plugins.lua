local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath("data").."/site/pack/packer/opt/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({"git", "clone", "https://github.com/wbthomason/packer.nvim", install_path})
  execute "packadd packer.nvim"
end

vim.cmd [[packadd packer.nvim]]

return require("packer").startup(function()
-- Packer can manage itself
use "wbthomason/packer.nvim"

-- Colorscheme
use 'folke/tokyonight.nvim'
use 'morhetz/gruvbox'
use 'ChristianChiarulli/nvcode-color-schemes.vim'

-- Language stuff
use {"nvim-treesitter/nvim-treesitter", run = ":TSUpdate"}
use "windwp/nvim-autopairs"
use "neovim/nvim-lspconfig"
use "onsails/lspkind-nvim"
use "sbdchd/neoformat"

-- Other
use "kyazdani42/nvim-web-devicons"
use "kyazdani42/nvim-tree.lua"
use "hrsh7th/nvim-compe"
use {
  "folke/trouble.nvim",
  requires = "kyazdani42/nvim-web-devicons",
  config = function()
    require("trouble").setup {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    }
  end
}
use "airblade/vim-gitgutter"
use {'akinsho/nvim-bufferline.lua', requires = 'kyazdani42/nvim-web-devicons'}
use {
  'hoob3rt/lualine.nvim',
  requires = {'kyazdani42/nvim-web-devicons', opt = true}
}
use {'windwp/nvim-ts-autotag'}

-- Telescope
use {"nvim-lua/popup.nvim"}
use {"nvim-lua/plenary.nvim"}
use {"nvim-telescope/telescope.nvim"}
use {"nvim-telescope/telescope-fzy-native.nvim"}
end)
