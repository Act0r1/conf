require("harpoon").setup({})

local opts = { noremap = true, silent = true }

vim.g.mapleader = " "
local key = vim.keymap.set


key("n", "<A-a>", ":lua require(\"harpoon.mark\").add_file()<CR>", opts)
key("n", "<A-w>", ":lua require(\"harpoon.ui\").toggle_quick_menu()<CR>", opts)
key("n", "<A-l>", ":lua require(\"harpoon.ui\").nav_next()<CR>", opts)
key("n", "<A-h>", ":lua require(\"harpoon.ui\").nav_prev()<CR>", opts)
