require'nvim-treesitter.configs'.setup {
  ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "python", "rust", "javascript", "typescript", "zig" },

  sync_install = false,

  auto_install = true,


  highlight = {
      enable = true,
  },
}
