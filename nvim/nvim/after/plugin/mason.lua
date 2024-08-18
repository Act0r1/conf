require("mason").setup()
require("mason-lspconfig").setup()

require("lspconfig").lua_ls.setup {}
require("lspconfig").pyright.setup {}

-- require("lspconfig").basedpyright.setup {}
require("lspconfig").tsserver.setup {}
require("lspconfig").rust_analyzer.setup {}
