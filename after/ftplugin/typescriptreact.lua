vim.o.shiftwidth = 2
vim.o.tabstop = 2

local lsp = require('helpers_lsp')

require'lspconfig'.tsserver.setup{
	capabilities = lsp.capabilities,
	on_attach = lsp.on_attach,
	autostart = true,
}
