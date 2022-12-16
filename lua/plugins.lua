local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
local is_bootstrap = false
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  is_bootstrap = true
  vim.fn.execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
  vim.cmd [[packadd packer.nvim]]
end

vim.cmd [[colorscheme dracula]]
return require('packer').startup(function(use)
  -- theme
    -- packer can manage itself
  use 'wbthomason/packer.nvim'
  -- cmp -----------------------|
  use 'hrsh7th/cmp-nvim-lsp' 
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/nvim-cmp'                -- autocompletion
  use 'saadparwaiz1/cmp_luasnip'
  -- you can alias plugin names
  use { 'l3mon4d3/luasnip', requires = { 'saadparwaiz1/cmp_luasnip' },tag = "v<currentmajor>.*"}         
  use "rafamadriz/friendly-snippets"
  use 'https://github.com/ryanoasis/vim-devicons'
  use 'yuezk/vim-js'
  use 'herringtondarkholme/yats.vim'
  use 'maxmellon/vim-jsx-pretty'
  use 'https://github.com/preservim/nerdtree'
-- rust
  use 'rust-lang/rust.vim'
-- theme
  use {'dracula/vim', as = 'dracula'}
  use 'nvim-tree/nvim-web-devicons'
--  use {'romgrk/barbar.nvim', wants = 'nvim-web-devicons'}
  use 'ayu-theme/ayu-vim'
  use 'terryma/vim-multiple-cursors'
  use 'https://github.com/tpope/vim-surround'
  use { 'ibhagwan/fzf-lua',
  -- optional for icon support
  requires = { 'kyazdani42/nvim-web-devicons' }
  }
  use 'matze/vim-move'
  use 'nvim-lua/plenary.nvim'
  use 'simrat39/rust-tools.nvim'
  use { 'numtostr/comment.nvim'}
  use {
       'nvim-treesitter/nvim-treesitter',
        run = ':tsupdate'
    }
  use 'neovim/nvim-lspconfig'                                                     -- collection of configurations for built-in lsp client
  use 'williamboman/nvim-lsp-installer'                                           -- automatically install language servers to stdpath
  use 'mjlbach/onedark.nvim'                                                      -- theme inspired by atom
  use 'sbdchd/neoformat'
  use 'lukas-reineke/indent-blankline.nvim'                                       -- add indentation guides even on blank lines
  use 'tpope/vim-sleuth'                                                          -- detect tabstop and shiftwidth automatically
  use 'psliwka/vim-smoothie'
  use 'cohama/lexima.vim'
  use 'vimjas/vim-python-pep8-indent'
  use 'powerman/vim-plugin-ruscmd'
  use 'theprimeagen/harpoon'
  use { 'nvim-telescope/telescope.nvim', requires = { 'nvim-lua/plenary.nvim' } } -- fuzzy finder (files, lsp, etc)
-- status linee
  use 'nvim-lualine/lualine.nvim'                                                 -- fancier statusline
  


require'nvim-treesitter.configs'.setup {
 autotag = {
    enable = true,
  }
}

require("luasnip.loaders.from_vscode").lazy_load()



vim.diagnostic.config({
  virtual_text = false,
  virtual_lines = false,
})
end)
