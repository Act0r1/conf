local null_ls = require("null-ls")
local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)
local lspconfig = require("lspconfig")

-- Enable some language servers with the additional completion capabilities offered by nvim-cmp
local servers = { "clangd", "rust_analyzer", "pyright", "tsserver" }
for _, lsp in ipairs(servers) do
	lspconfig[lsp].setup({
		-- on_attach = my_custom_on_attach,
		capabilities = capabilities,
	})
	if lsp == "pyright" then
		lspconfig[lsp].setup({
			capabilities = capabilities,
			settings = {
				python = {
					analysis = {
						typeCheckingMode = "off",
					},
				},
			},
		})
	end
end

null_ls.setup({
	debug = false,
	sources = {
		formatting.prettier,
		formatting.rustfmt,
		formatting.stylua,
		formatting.black,
		diagnostics.eslint,
		diagnostics.luacheck,
	},
})
