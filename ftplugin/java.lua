local autocmd = vim.api.nvim_create_autocmd

local config = {
    cmd = {'/home/angel/Downloads/jdt-language-server-1.28.0-202309281329/bin/jdtls'},
    root_dir = vim.fs.dirname(vim.fs.find({'gradlew', '.git', 'mvnw'}, { upward = true })[1]),
}
require('jdtls').start_or_attach(config)
vim.o.shiftwidth = 2
vim.o.tabstop = 2

autocmd("BufWritePre", {
	command = ":FormatCode"
})
