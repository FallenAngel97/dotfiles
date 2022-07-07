local lsp = require('helpers_lsp')

require'lspconfig'.kotlin_language_server.setup{
	capabilities = lsp.capabilities,
	on_attach = lsp.on_attach,
	cmd = { "/home/angel/Documents/kotlin-language-server/server/build/install/server/bin/kotlin-language-server" }
}

