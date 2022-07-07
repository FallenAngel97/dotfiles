local lsp = require('helpers_lsp')

require'lspconfig'.dockerls.setup{
	capabilities = lsp.capabilities,
	on_attach = lsp.on_attach,
}

