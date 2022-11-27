local set_keymap = vim.api.nvim_set_keymap;

set_keymap('n', '<C-b>', ':NvimTreeToggle<CR>', { noremap = true, silent = true });
set_keymap('n', '<C-n>', ':set invnumber<CR>', { noremap = true });
vim.keymap.set('n', '<Leader>c', vim.lsp.buf.code_action);
vim.keymap.set('n', 'gd', vim.lsp.buf.definition)
set_keymap('n', '<Leader>t', '<cmd>Telescope find_files<CR>', { noremap = true });
set_keymap('n', '<Leader>f', '<cmd>Telescope live_grep<CR>', { noremap = true });
set_keymap('n', '<Leader>gb', '<cmd>Telescope git_branches<CR>', { noremap = true });
set_keymap('n', '<Leader>w', ':bd<CR>', { noremap = true });
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

vim.api.nvim_buf_set_keymap(0, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', {noremap = true})

-- Debugger

set_keymap('n', '<F5>', ":lua require'dap'.continue()<CR>", { noremap = true, silent = true });
set_keymap('n', '<Leader>B', ":lua require 'dap'.toggle_breakpoint()<CR>", { noremap = true });
set_keymap('n', '<Leader>gc', ":Git commit", { noremap = true });
set_keymap('n', '<Leader>gp', ":Git push origin HEAD", { noremap = true });
-- vim.keymap.set('n', '<Leader>d', require('dapui').toggle, { noremap = true });
