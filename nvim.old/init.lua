require("user.keymaps")
require("user.options")
require("user.packer")
require('transparent').clear_prefix('NvimTree')
vim.api.nvim_set_keymap('i', '<A-j>',"copilot#Accept('<CR>')", {noremap=true, silent=true, expr=true})






