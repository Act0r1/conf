return {

	{
		"saghen/blink.cmp",
		dependencies = { "rafamadriz/friendly-snippets" },

		version = "0.9.3",

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
			-- snippets = { preset = 'luasnip' },
			signature = { enabled = true },
			sources = {
				default = { "lsp", "path", "snippets", "buffer" },
				cmdline = {},
			},
			-- completion.list.selection
			completion = {
				-- list = {
				-- 	preselect = true,
				-- 	-- auto_insert = true,
				-- },
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
							{ "label", "label_description", gap = 1 },
							{ "kind_icon", "kind" },
						},
					},
				},
			},
		},
	},
}
