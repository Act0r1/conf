local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
vim.keymap.set("n", "<leader>fw", builtin.live_grep, {})
vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})

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
