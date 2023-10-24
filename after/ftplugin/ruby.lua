vim.o.shiftwidth = 2
vim.o.tabstop = 2

local lsp = require('helpers_lsp')

local nvim_lsp = require('lspconfig')
local handlers = {
	["textDocument/publishDiagnostics"] = vim.lsp.with(
		vim.lsp.diagnostic.on_publish_diagnostics, {
			virtual_text = true
		}
	)
}
local capabilities = vim.lsp.protocol.make_client_capabilities()
nvim_lsp.solargraph.setup {
	cmd = {
		"solargraph",
		"stdio"
	},
	filetypes = {
		"ruby"
	},
	flags = {
		debounce_text_changes = 150
	},
	autostart = true,
	on_attach = lsp.on_attach,
	root_dir = nvim_lsp.util.root_pattern("Gemfile", ".git", "."),
	capabilities = lsp.capabilities,
	handlers = handlers,
	settings = {
		solargraph = {
			autoformat = true,
			completion = true,
			diagnostic = true,
			folding = true,
			references = true,
			rename = true,
			symbols = true
		}
	}
}
