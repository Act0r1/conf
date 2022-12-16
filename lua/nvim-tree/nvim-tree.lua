vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1





require("nvim-tree").setup({
  hijack_directories = {
    enable = false,
  },
  renderer = {
    icons = {
      webdev_colors = true,
      git_placement = "before",
      padding = " ",
      symlink_arrow = " ➛ ",
      show = {
        file = true,
        folder = true,
        folder_arrow = true,
        git = true,
      },

    },
  },
  diagnostics = {
    enable = true,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    },
  },
  git = {
    enable = true,
    ignore = true,
    timeout = 500,
  },
  view = {
    width = 30,
    hide_root_folder = false,
    side = "left",
    -- auto_resize = true,
    number = false,
    relativenumber = false,
  },
  actions = {
    use_system_clipboard=true,
  }

})
