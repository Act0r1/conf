vim.opt.nu = true
vim.opt.spell=false
vim.opt.relativenumber = true
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.opt.termguicolors = true
vim.opt.backup = false
vim.opt.splitright=true
vim.opt.splitbelow=true
vim.opt.swapfile = false
vim.opt.tabstop = 4
vim.opt.clipboard = "unnamedplus"
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.completeopt = { "menuone", "noselect" }
vim.opt.showcmd = true
vim.opt.cmdheight = 1
-- vim.g.VM_maps = {}
-- vim.g.VM_maps['Find Under'] = '<C-/>'           -- replace C-n
-- vim.g.VM_maps['Find Subword Under'] = '<C-/>'   -- replace visual C-n
vim.g.VM_maps = {
  ["I BS"] = '', -- disable backspace mapping
}
vim.cmd('colorscheme tokyonight')
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

vim.api.nvim_create_autocmd("FileType", {
  pattern = {"javascript.jsx", "javascriptreact", "typescript.tsx", "typescriptreact"},
  callback = function()
    vim.bo.commentstring = "{/* %s */}"
  end
})
