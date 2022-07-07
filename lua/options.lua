vim.opt.signcolumn = 'yes:2'
vim.opt.number = true
vim.opt.wildmode = "longest:full,full"
vim.opt.background = 'dark'
vim.opt.mouse = 'a'
vim.opt.wrap = false
vim.opt.exrc = true
vim.opt.list = true
vim.opt.cursorline = true
vim.opt.listchars="eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:·"
vim.opt.modeline = false
vim.opt.foldmethod = 'syntax'
vim.opt.incsearch = true
vim.opt.scrolloff = 8
vim.opt.wildmenu = true
vim.opt.wildignore:append { "*.bmp", "*.gif", "*.ico", "*.jpg", "*.png", "*.ico", "*.pdf", "*.psd", "node_modules/*", "bower_components/*" }
vim.opt.cc="80"
vim.opt.termguicolors = true
vim.o.completeopt = "menuone,noselect"
vim.opt.updatetime = 300
vim.opt.guicursor:append { "a:-blinkwait175-blinkoff150-blinkon175" }
vim.opt.foldmethod = "syntax"
vim.opt.foldlevel = 2
vim.opt.hlsearch = false

