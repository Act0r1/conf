vim.cmd([[packadd packer.nvim]])
return require("packer").startup(function(use)
    use({
        "nvim-treesitter/nvim-treesitter-textobjects",
        after = "nvim-treesitter",
        requires = "nvim-treesitter/nvim-treesitter",
    })
    use({
        "kylechui/nvim-surround",
        tag = "*", -- Use for stability; omit to use `main` branch for the latest features
        config = function()
            require("nvim-surround").setup({
                -- Configuration here, or leave empty to use defaults
            })
        end,
    })
    use("wbthomason/packer.nvim")
    use({
        "aveplen/ruscmd.nvim",
        config = function()
            require("ruscmd").setup({})
        end,
    })
    use("https://github.com/lewis6991/gitsigns.nvim")
    use("AlexvZyl/nordic.nvim")
    use("https://github.com/jay-babu/mason-null-ls.nvim")
    use("mbbill/undotree")
    use("https://github.com/rhysd/clever-f.vim")
    use("xiyaowong/transparent.nvim")
    use({
        "windwp/nvim-ts-autotag",
        config = function()
            require("nvim-ts-autotag").setup()
        end,
    })
    use({
        "windwp/nvim-autopairs",
        config = function()
            require("nvim-autopairs").setup({})
        end,
    })
    -- Lua
    use("folke/tokyonight.nvim")
    -- use("folke/flash.nvim")
    use("hrsh7th/nvim-cmp") -- The completion plugin
    use({
        "kdheepak/lazygit.nvim",
        -- optional for floating window border decoration
        requires = {
            "nvim-lua/plenary.nvim",
        },
    })
    use("terrortylor/nvim-comment")
    use("karb94/neoscroll.nvim")
    use("nvim-tree/nvim-tree.lua")
    use("nvim-tree/nvim-web-devicons")
    use("hrsh7th/cmp-buffer") -- buffer completions
    use("hrsh7th/cmp-path") -- path completions
    use("hrsh7th/cmp-cmdline") -- cmdline completions
    use("simrat39/rust-tools.nvim")
    use({
        "ray-x/lsp_signature.nvim",
    })
    use({
        "saecki/crates.nvim",
        tag = "v0.4.0",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            require("crates").setup()
        end,
    })
    use("saadparwaiz1/cmp_luasnip") -- snippet completions
    use("hrsh7th/cmp-nvim-lsp")
    use("hrsh7th/cmp-nvim-lua")
    use("neovim/nvim-lspconfig")          -- enable LSP
    use("williamboman/mason.nvim")        -- simple to use language server installer
    use("williamboman/mason-lspconfig.nvim") -- simple to use language server installer
    use("jose-elias-alvarez/null-ls.nvim") -- LSP diagnostics and code actions
    use({
        "L3MON4D3/LuaSnip",
        -- follow latest release.
        tag = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
        -- install jsregexp (optional!:).
        run = "make install_jsregexp",
    })
    use("rafamadriz/friendly-snippets")
    use({
        "nvim-lualine/lualine.nvim",
        requires = { "nvim-tree/nvim-web-devicons", opt = true },
    })
    use({
        "nvim-telescope/telescope.nvim",
        tag = "0.1.4",
        -- or                            , branch = '0.1.x',
        requires = { { "nvim-lua/plenary.nvim" } },
    })
    use("ThePrimeagen/harpoon")
    use({
        "nvim-treesitter/nvim-treesitter",
        run = function()
            local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
            ts_update()
        end,
    })
end)
