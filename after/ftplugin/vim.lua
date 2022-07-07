vim.o.shiftwidth = 2
vim.o.tabstop = 2

local lsp = require('_helpers.lsp')

require'lspconfig'.vimls.setup{
	capabilities = lsp.capabilities,
	on_attach = lsp.on_attach,
}
