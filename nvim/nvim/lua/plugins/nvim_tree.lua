
return {
  "nvim-tree/nvim-tree.lua",
  dependencies = { "nvim-tree/nvim-web-devicons" }, -- Optional for file icons
  config = function()
    require("nvim-tree").setup({
      git = {
        -- enable = true,
        ignore = false,
        -- timeout = 500,
      },
      filters = {
        dotfiles = false,
      },
    })
  end,
}
