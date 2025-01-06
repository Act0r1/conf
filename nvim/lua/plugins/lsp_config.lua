return {
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "saghen/blink.cmp",
            {
                "folke/lazydev.nvim",
                opts = {
                    library = {
                        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
                    },
                },
            },
        },

        config = function()
            local capabilities = require("blink.cmp").get_lsp_capabilities()
            -- require("lspconfig").lua_ls.setup({ capabilites = capabilities })
            require("lspconfig").lua_ls.setup({
                capabilities = capabilities,
                settings = {
                    Lua = {
                        diagnostics = {
                            disable = { "missing-fields" },
                        },
                    },
                },
            })
            require("lspconfig").pyright.setup({ capabilites = capabilities })
            require("lspconfig").ts_ls.setup({ capabilites = capabilities })
            require("lspconfig").rust_analyzer.setup({ capabilites = capabilities })
            require("lspconfig").gopls.setup({ capabilites = capabilities })

            vim.api.nvim_create_autocmd("lspattach", {
                group = vim.api.nvim_create_augroup("userlspconfig", {}),
                callback = function(ev)
                    vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"
                    local opts = { buffer = ev.buf }
                    vim.keymap.set("n", "gd", vim.lsp.buf.declaration, opts)
                    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
                    vim.keymap.set("n", "<c-]>", vim.lsp.buf.hover, opts)
                    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
                    vim.keymap.set("n", "<c-k>", vim.lsp.buf.signature_help, opts)
                    vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, opts)
                    vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, opts)
                    vim.keymap.set("n", "<space>wl", function()
                        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
                    end, opts)
                    vim.keymap.set("n", "<space>d", vim.lsp.buf.type_definition, opts)
                    vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, opts)
                    vim.keymap.set({ "n", "v" }, "<space>ca", vim.lsp.buf.code_action, opts)
                    vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
                    vim.keymap.set("n", "<space>f", function()
                        vim.lsp.buf.format({ async = true })
                    end, opts)
                end,
            })

            vim.api.nvim_create_autocmd("LspAttach", {
                callback = function(args)
                    local c = vim.lsp.get_client_by_id(args.data.client_id)
                    if not c then
                        return
                    end

                    if vim.bo.filetype == "lua" then
                        vim.api.nvim_create_autocmd("BufWritePre", {
                            buffer = args.buf,
                            callback = function()
                                vim.lsp.buf.format({ bufnr = args.buf, id = c.id })
                            end,
                        })
                    end
                end,
            })
        end,
    },
}
