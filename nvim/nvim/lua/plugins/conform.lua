return {
    "stevearc/conform.nvim",
    opts = {},
    config = function()
        require("conform").setup({
            -- format_on_save = {
            --     timeout_ms = 500,
            --     async = false,
            --     quiet = false,
            -- },
            formatters_by_ft = {
                lua = { "stylua" },
                -- Conform will run multiple formatters sequentially
                python = {
                    "ruff_fix",
                    "ruff_format",
                    "ruff_organize_imports", --[[ "autopep8" ]]
                },
                -- You can customize some of the format options for the filetype (:help conform.format)
                go = { "gofumpt", "goimports" },
                rust = { "rustfmt", lsp_format = "fallback" },
                -- Conform will run the first available formatter
                typescript = { 
                    "prettier",
                },
                typescriptreact = { 
                    "prettier",
                },
                javascript = { 
                    "prettier",
                },
                javascriptreact = { 
                    "prettier",
                },
                -- vue = { "prettierd", "eslint_d" },
                json = { "prettier" },
            },
            formatters = {
                prettier = {
                    prepend_args = {
                        "--tab-width", "4",
                        "--print-width", "100",
                    },
                },
            },
        })

        -- -- Глобальные настройки отступов
        
    end,
}
