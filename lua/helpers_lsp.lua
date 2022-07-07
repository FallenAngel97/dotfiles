local M = {}

M.on_attach = function (client, bufnr)
	if client.resolved_capabilities.document_highlight then
		local VariableHiglight = vim.api.nvim_create_augroup("lsp_document_highlight", { clear = true })
		vim.api.nvim_create_autocmd("CursorHold", {
			callback = vim.lsp.buf.document_highlight,
			group = VariableHiglight,
			buffer = bufnr,
		})
		vim.api.nvim_create_autocmd("CursorHoldI", {
			callback = vim.lsp.buf.document_highlight,
			group = VariableHiglight,
			buffer = bufnr,
		})
		vim.api.nvim_create_autocmd("CursorMoved", {
			callback = vim.lsp.buf.clear_references,
			group = VariableHiglight,
			buffer = bufnr,
		})
	end
end
M.capabilities = vim.lsp.protocol.make_client_capabilities()

return M;
