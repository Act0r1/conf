return {
    "stevearc/conform.nvim",
    opts = {},
    config = function()
        require("conform").setup({
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
                javascript = { "prettierd", "prettier", stop_after_first = true },
            },
        })
    end,
}
