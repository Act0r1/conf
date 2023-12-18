local opts = { noremap = true, silent = true }
vim.g.mapleader = " "
local key = vim.keymap.set
local wk = require("which-key")
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
key("n", ";", ":")
key("v", "<A-j>", ":m .+1<CR>==", opts)
key("v", "<A-k>", ":m .-2<CR>==", opts)
key("v", "p", '"_dP', opts)
key("n", "<Esc>", ":noh <CR>", opts)
key("n", "<C-h>", "<C-w>h", opts)
key("n", "<C-j>", "<C-w>j", opts)
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


wk.register({
    -- flash search
    l = {
        name = "flash",
        s = { function() require("flash").jump() end, "Flash Jump" },
        t = { function() require("flash").treesitter() end, "Flash Treesitter" },
        r = { function() require("flash").treesitter_search() end, "Flash Treesitter Search" },
    },
}, { prefix = "<leader>" })
