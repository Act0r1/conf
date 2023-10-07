-- local autocmd = vim.api.nvim_create_autocmd
local cmd = vim.cmd
-- Auto resize panes when resizing nvim window
-- autocmd("VimResized", {
--   pattern = "*",
--   command = "tabdo wincmd =",
-- })
--
cmd([[ 
filetype indent plugin on
syntax enable
set noswapfile
]])
vim.opt.relativenumber=true
vim.g.copilot_no_tab_map = true
vim.api.nvim_set_keymap("i", "<C-a>", 'copilot#Accept("<CR>")', { silent = true, expr = true })
vim.opt.mouse="a"
