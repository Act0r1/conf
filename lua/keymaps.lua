local cmd = vim.cmd             -- execute Vim commands
local exec = vim.api.nvim_exec  -- execute Vimscript
local g = vim.g                 -- global variables
local opt = vim.opt
local map = vim.api.nvim_set_keymap
local vmap = vim.keymap.set
local opts = { noremap = true, silent = true }
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.g.move_key_modifier='C'
-- moving line
map("n", "H", "^", {noremap=true})
map("n", "L", "$", {noremap=true})
map("n", ",<Space>", ":nohlsearch<CR>", { silent = true })
map("n", "<C-right>", ":tabnext<cr>", { silent = true })
map("n", "<C-Left>", ":tabprevious<CR>", { silent = true })
map("n", "<leader>,", ":bprevious<cr>", { silent = true })
map("n", "<leader>.", ":bnext<cr>", { silent = true })
map("n", ";", ":", { noremap=true })
map("n", "<leader>r", ":%bd|e#<cr>", { silent = true })
map("n", "<C-c>", "\"+y<CR>", { noremap=true })
map("v", "<C-c>", "\"+y<CR>", { noremap=true })
map("n", "cd", ":cd", { noremap=true }) -- quick change dir
-- vim.api.nvim_set_keymap("n", "<leader>n", ":NERDTreeFocus<CR>", { noremap=true }) 
map("n", "<M-c>", ":NERDTree<CR>", { noremap=true })
map("n", "<M-o>", ":NERDTreeToggle<CR>", { noremap=true })
vmap('n', 'ma', require("harpoon.mark").add_file) 
vmap('n', 'ms', require("harpoon.ui").toggle_quick_menu) 
vmap('n', '<leader>sw', require('telescope.builtin').grep_string)--, { desc '[S]earch current [W]ord' })
vmap('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', {noremap=true, silent=true})
vmap('n', '<leader>sg', require('telescope.builtin').live_grep) --, { desc = '[S]earch by [G]rep' })
vmap('n', '<leader>sd', require('telescope.builtin').diagnostics) -- , { desc = '[S]earch [D]iagnostics' })
vmap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', {noremap=true, silent=true})
vmap('n', 'ga', '<cmd>lua vim.lsp.buf.code_action()<CR>', {noremap=true, silent=true})
vmap('n', '<C-]>', '<cmd>lua vim.lsp.buf.hover()<CR>', {noremap=true, silent=true})
vmap('n', 'gi', vim.lsp.buf.implementation, {noremap=true, silent=true})
vmap('n', '<space>f', function() vim.lsp.buf.format { async = true } end, {noremap=true, silent=true})
map('n', '<space>p', "<cmd>lua require('fzf-lua').files()<CR>", { noremap = true, silent = true })
map('n', '<space>t', "<cmd>lua require('fzf-lua').tabs()<CR>", { noremap = true, silent = true })
map('n', 'gts', "<cmd>lua require('fzf-lua').git_status()<CR>", { noremap = true, silent = true })
map('n', 'ds', "<cmd>lua require('fzf-lua').lsp_document_symbols()<CR>", { noremap = true, silent = true })
-- better naviagtion
map("n", "<m-h>", "<C-w>h", opts)
map("n", "<m-j>", "<C-w>j", opts)
map("n", "<m-k>", "<C-w>k", opts)
map("n", "<m-l>", "<C-w>l", opts)

map("n", "n", "nzzzv", opts)
map("n", "N", "Nzzzv", opts)
