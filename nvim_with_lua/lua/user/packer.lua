vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'
    use 'AlexvZyl/nordic.nvim'
    -- using packer.nvim
    use { 'akinsho/bufferline.nvim', tag = "*", requires = 'nvim-tree/nvim-web-devicons' }

    use "hrsh7th/nvim-cmp" -- The completion plugin
    use "terrortylor/nvim-comment"
    use "karb94/neoscroll.nvim"
    use "nvim-tree/nvim-tree.lua"
    use "nvim-tree/nvim-web-devicons"
    use "hrsh7th/cmp-buffer"  -- buffer completions
    use "hrsh7th/cmp-path"    -- path completions
    use "nvimtools/none-ls.nvim"
    use "hrsh7th/cmp-cmdline" -- cmdline completions
    use "simrat39/rust-tools.nvim"
    use {
        "ray-x/lsp_signature.nvim",
    }
    use
    { 'saecki/crates.nvim',
        tag = 'v0.4.0',
        dependencies = { 'nvim-lua/plenary.nvim' },
        config = function()
            require('crates').setup()
        end, }

    use "saadparwaiz1/cmp_luasnip" -- snippet completions
    use "hrsh7th/cmp-nvim-lsp"
    use "hrsh7th/cmp-nvim-lua"

    -- LSP
    use "neovim/nvim-lspconfig"             -- enable LSP
    use "williamboman/mason.nvim"           -- simple to use language server installer
    use "williamboman/mason-lspconfig.nvim" -- simple to use language server installer
    use 'jose-elias-alvarez/null-ls.nvim'   -- LSP diagnostics and code actions



    -- snippets
    use "L3MON4D3/LuaSnip" --snippet engine
    use "rafamadriz/friendly-snippets"
    use {

        'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons', opt = true }
    }
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.4',
        -- or                            , branch = '0.1.x',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }

    use {
        'nvim-treesitter/nvim-treesitter',
        run = function()
            local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
            ts_update()
        end, }
end)
