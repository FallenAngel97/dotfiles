vim.o.shiftwidth = 4
vim.o.tabstop = 4

local lsp = require('helpers_lsp')

require'lspconfig'.pyright.setup{
	capabilities = lsp.capabilities,
	on_attach = lsp.on_attach,
	autostart = true,
}

