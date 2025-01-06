return {

    {
        "saghen/blink.cmp",
        dependencies = { "rafamadriz/friendly-snippets", "giuxtaposition/blink-cmp-copilot" },

        version = "*",

        opts = {
            keymap = {
                ["<CR>"] = { "accept", "fallback" },
                ["<Tab>"] = {
                    function(cmp)
                        if cmp.snippet_active() then
                            return cmp.select_next()
                        else
                            return cmp.select_next()
                        end
                    end,
                    "snippet_forward",
                    "fallback",
                },
                ["<S-Tab>"] = { "snippet_backward", "fallback" },
                cmdline = {
                    preset = "none",
                },
            },

            appearance = {
                use_nvim_cmp_as_default = true,
                nerd_font_variant = "mono",
            },
            signature = { enabled = true },
            sources = {
                default = { "lsp", "path", "snippets", "buffer" },
                cmdline = {},
                -- providers = {
                --     copilot = {
                --         name = "copilot",
                --         module = "blink-cmp-copilot",
                --         score_offset = 100,
                --         async = true,
                --         transform_items = function(_, items)
                --             local CompletionItemKind = require("blink.cmp.types").CompletionItemKind
                --             local kind_idx = #CompletionItemKind + 1
                --             CompletionItemKind[kind_idx] = "Copilot"
                --             for _, item in ipairs(items) do
                --                 item.kind = kind_idx
                --             end
                --             return items
                --         end,
                --     },
                -- },
            },
            completion = {
                ghost_text = {
                    enabled = false,
                },
                documentation = { auto_show = true, auto_show_delay_ms = 50 },
                -- documentation = { window = { border = "single" } },
                menu = {
                    auto_show = true,

                    -- nvim-cmp style menu
                    draw = {
                        columns = {
                            { "label",     "label_description", gap = 1 },
                            { "kind_icon", "kind" },
                        },
                    },
                },
            },
        },
    },
}
