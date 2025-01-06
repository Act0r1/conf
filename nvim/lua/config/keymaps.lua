local opts = { noremap = true, silent = true }
local key = vim.keymap.set
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- vim.keymap.set("n", "<space>f", function()
--     vim.lsp.buf.format({ async = true })
-- end, opts)

vim.keymap.set({ "n", "v" }, "<leader>f", function()
    require("conform").format({ async = true }, function(err)
        if not err then
            local mode = vim.api.nvim_get_mode().mode
            if vim.startswith(string.lower(mode), "v") then
                vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc>", true, false, true), "n", true)
            end
        end
    end)
end, { desc = "Format code" })
-- autosave
vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*",
    callback = function(args)
        require("conform").format({ bufnr = args.buf })
    end,
})
-------

vim.keymap.set("n", "<leader>jc", function()
    require("treesitter-context").go_to_context(vim.v.count1)
end, { silent = true })

vim.keymap.set("n", "<Leader>bd", function()
    for _, bufnr in ipairs(vim.api.nvim_list_bufs()) do
        if bufnr ~= vim.api.nvim_get_current_buf() and vim.api.nvim_buf_is_loaded(bufnr) then
            vim.api.nvim_buf_delete(bufnr, { force = true })
        end
    end
end, { noremap = true, silent = true })

key("n", ";", ":")
key("n", "<leader>,", ":bprev<CR>")
key("n", "<leader>.", ":bnext<CR>")
key("n", "dl", ":g/^$/d<CR>")
key("n", "v'", 'vi"y')
key("v", "<A-j>", ":m .+1<CR>==", opts)
key("v", "<A-k>", ":m .-2<CR>==", opts)
key("v", "p", '"_dP', opts)
key("n", "<Esc>", ":noh <CR>", opts)
key("n", "<C-h>", "<C-w>h", opts)
key("n", "<leader>v", "<C-w>v")
key("n", "<leader>h", "<C-w>s")
key("n", "<leader>c", "<C-w>c")
key("n", "so", ":source ~/.config/nvim/init.lua<CR>", opts)
key("n", "ww", ":w<CR>", opts)
key("n", "<C-j>", "<C-w>j", opts)
key("n", "<A-.>", "<c-w>5<", opts)
key("n", "<A-,>", "<c-w>5>", opts)
key("n", "<leader>gg", ":LazyGit<CR>", opts)
key("n", "<C-k>", "<C-w>k", opts)
key("n", "<C-l>", "<C-w>l", opts)
key("x", "J", ":move '>+1<CR>gv-gv", opts)
key("x", "K", ":move '<-2<CR>gv-gv", opts)
key("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
key("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)
key("n", "<Tab>", ":BufferLineCycleNext <CR>", opts)
key("n", "<leader>ld", ":Telescope lsp_document_symbols<CR>", opts)
key(
    "n",
    "gy",
    ':lua local pos = vim.api.nvim_win_get_cursor(0); vim.cmd("normal! ggVGy"); vim.api.nvim_win_set_cursor(0, pos)<CR>',
    opts
)

-- Nvim Tree
key("n", "<C-j>", ":NvimTreeToggle <CR>", opts)
key("n", "<leader>tu", ":UndotreeToggle<CR>", opts)

vim.keymap.set("n", "<space>e", vim.diagnostic.open_float)
-- vim.api.nvim_set_keymap("i", "<A-j>", "copilot#Accept('<CR>')", { noremap = true, silent = true, expr = true })
-- harpoon
key("n", "<A-a>", ':lua require("harpoon.mark").add_file()<CR>', opts)
key("n", "<A-w>", ':lua require("harpoon.ui").toggle_quick_menu()<CR>', opts)
key("n", "<A-.>", ':lua require("harpoon.ui").nav_next()<CR>', opts)
key("n", "<A-,>", ':lua require("harpoon.ui").nav_prev()<CR>', opts)
key("n", "<S>.", ':lua require("harpoon.ui").nav_next() <CR>', opts)
