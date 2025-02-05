return {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        local builtin = require("telescope.builtin")
        vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
        vim.keymap.set("n", "<leader>ww", builtin.live_grep, {})
        vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
        vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})
        vim.keymap.set("n", "<leader>fl", builtin.lsp_document_symbols, {})
        vim.keymap.set("n", "<leader>fi", builtin.lsp_implementations, {})

        local telescope = require("telescope")

        telescope.setup({
            defaults = {
                mappings = {
                    n = {
                        ["bd"] = require("telescope.actions").delete_buffer,
                    },
                    i = {
                        ["bd"] = require("telescope.actions").delete_buffer,
                    },
                },
            },
        })

        vim.keymap.set("n", "<leader>fw", function()
            require("telescope.builtin").live_grep({
                additional_args = function(opts)
                    return { "--no-ignore" }
                end,
            })
        end, {})
    end,
}
