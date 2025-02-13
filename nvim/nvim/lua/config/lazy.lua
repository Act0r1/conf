-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
            { out,                            "WarningMsg" },
            { "\nPress any key to exit..." },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
vim.opt.number = true
vim.opt.spell = false
vim.opt.relativenumber = true
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.opt.termguicolors = true
vim.opt.backup = false
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.swapfile = false
vim.opt.tabstop = 4
vim.opt.laststatus = 3
vim.opt.clipboard = "unnamedplus"
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.completeopt = { "menu", "menuone", "noselect" }
vim.opt.showcmd = true
vim.opt.cmdheight = 1
vim.g.lazygit_floating_window_winblend = 0 -- transparency of floating window
vim.g.VM_maps = {
    ["I BS"] = "",                         -- disable backspace mapping
}
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

-- vim.api.nvim_create_autocmd("FileType", {
-- 	pattern = { "javascript.jsx", "javascriptreact", "typescript.tsx", "typescriptreact" },
-- 	callback = function()
-- 		vim.bo.commentstring = "{/* %s */}"
-- 	end,
-- })
--
-- vim.api.nvim_create_autocmd({ "BufWritePre" }, {
-- 	pattern = "*.go",
-- 	callback = function()
-- 		local params = vim.lsp.util.make_range_params(nil, vim.lsp.util._get_offset_encoding())
-- 		params.context = { only = { "source.organizeImports" } }
-- 		local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, 3000)
-- 		for _, res in pairs(result or {}) do
-- 			for _, r in pairs(res.result or {}) do
-- 				if r.edit then
-- 					vim.lsp.util.apply_workspace_edit(r.edit, vim.lsp.util._get_offset_encoding())
-- 				else
-- 					vim.lsp.buf.execute_command(r.command)
-- 				end
-- 			end
-- 		end
-- 	end,
-- })
local TrimWhiteSpaceGrp = vim.api.nvim_create_augroup("TrimWhiteSpaceGrp", {})
vim.api.nvim_create_autocmd("BufWritePre", {
    group = TrimWhiteSpaceGrp,
    pattern = "*",
    command = "%s/\\s\\+$//e",
})
-- Setup lazy.nvim
require("lazy").setup({
    spec = {
        -- import your plugins
        { import = "plugins" },
    },
    checker = { enabled = false },
    change_detection = { enabled = false },
    ui = { notify = false },
})
