set nocompatible
syntax on
set mouse=a
set number relativenumber
call plug#begin('~/.vim/plugged')
Plug 'jeffkreeftmeijer/vim-numbertoggle'
Plug 'scrooloose/nerdtree'
Plug 'connorholyday/vim-snazzy'
Plug 'wincent/command-t'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/async.vim'
Plug 'airblade/vim-gitgutter'
Plug 'prabirshrestha/vim-lsp'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'ryanolsonx/vim-lsp-javascript'
Plug 'ryanolsonx/vim-lsp-python'
Plug 'KKPMW/oldbook-vim'
Plug 'nvie/vim-flake8'
call plug#end()
map <C-b> :NERDTreeToggle<CR>
set termguicolors
colorscheme oldbook
inoremap {      {}<Left>
inoremap {<CR>  {<CR>}<Esc>O
inoremap {{     {
inoremap {}     {}
set updatetime=100
autocmd BufWritePost *.py call Flake8()
let g:flake8_show_in_gutter=1
let g:flake8_quickfix_location="vert belowright"
let g:flake8_quickfix_height=60
set exrc
set secure
