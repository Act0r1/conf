local cmd = vim.cmd             -- execute Vim commands
local exec = vim.api.nvim_exec  -- execute Vimscript
local g = vim.g                 -- global variables
local opt = vim.opt


cmd([[
filetype indent plugin on
syntax enable
]])
cmd([[
set noswapfile
]])
vim.o.completeopt = 'menuone,noselect'
vim.opt.termguicolors = true
opt.shiftwidth=4
opt.softtabstop=8
opt.expandtab=true    
opt.timeoutlen=300
opt.relativenumber = true
opt.tabstop = 4           -- 1 tab == 4 spaces
-- opt.signcolumn="yes"
opt.smartindent = true    -- autoindent new lines
opt.mouse="a"
