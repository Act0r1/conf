local opts = { noremap = true, silent = true }
vim.g.mapleader = " "
local key = vim.keymap.set
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
key("n", ";", ":")
key("n", "<leader>,", ":bprev<CR>")
-- key("n", "pi", ":PackerSync<CR>")
key("n", "<leader>.", ":bnext<CR>")
key("v", "<A-j>", ":m .+1<CR>==", opts)
key("v", "<A-k>", ":m .-2<CR>==", opts)
-- key("v", "p", '"_dP', opts)
key("n", "<Esc>", ":noh <CR>", opts)
key("n", "<C-h>", "<C-w>h", opts)
key("n", "<leader>v", "<C-w>v")
key("n", "<leader>h", "<C-w>s")
key("n", "<leader>c", "<C-w>c")
key("n", "so", ":source ~/.config/nvim/init.lua<CR>", opts)
-- key("n", "ww", ":w<CR>", opts)
key("n", "<C-j>", "<C-w>j", opts)
key("n", "<leader>gg", ":LazyGit<CR>", opts)
key("n", "<C-k>", "<C-w>k", opts)
key("n", "<C-l>", "<C-w>l", opts)key("x", "J", ":move '>+1<CR>gv-gv", opts)
key("x", "K", ":move '<-2<CR>gv-gv", opts)
key("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
key("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)
key("n", "<Tab>", ":BufferLineCycleNext <CR>", opts)
key("n", "<S-Tab>", ":BufferLineCyclePrev <CR>", opts)
key("n", "<leader>x", ":bd <CR>", opts)
-- Nvim Tree 
key("n", "<C-j>", ":NvimTreeToggle <CR>", opts)


