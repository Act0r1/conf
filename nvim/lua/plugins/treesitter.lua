return {
    "nvim-treesitter/nvim-treesitter",
    lazy = true,
    build = ":TSUpdate",
    event = { "BufReadPre", "BufNewFile" },
    depends = { "nvim-treesitter/nvim-treesitter-textobjects" },
    config = function()
        local ts = require("nvim-treesitter.configs")
        ts.setup({
            highlight = {
                enable = true,
            },
            textobjects = {
                select = {
                    enable = true,

                    -- Automatically jump forward to textobj, similar to targets.vim
                    lookahead = true,

                    keymaps = {
                        ["af"] = "@function.outer",
                        ["if"] = "@function.inner",
                        ["ip"] = "@parameter.inner",
                        ["ap"] = "@parameter.outer",
                        -- ["ao"] = "@assignment.outer",
                        -- ["ii"] = "@assignment.inner",
                        ["l="] = "@assignment.lhs",
                        ["r="] = "@assignment.rhs",
                        ["id"] = "@conditional.inner",
                        ["ia"] = "@conditional.outer",
                        ["al"] = "@loop.outer",
                        ["il"] = "@loop.inner",
                        ["ic"] = "@class.outer",
                        ["ar"] = "@return.outer",
                        ["ir"] = "@return.inner",
                        ["ac"] = { query = "@class.inner", desc = "Select inner part of a class region" },
                        ["as"] = { query = "@scope", query_group = "locals", desc = "Select language scope" },
                    },
                },
            },
        })
    end,
}
