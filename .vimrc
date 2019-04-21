set nocompatible
syntax on
set mouse=a
set nowrap
set number relativenumber
set incsearch
filetype on
call plug#begin('~/.vim/plugged')
Plug 'jeffkreeftmeijer/vim-numbertoggle'
Plug 'scrooloose/nerdtree'
Plug 'ternjs/tern_for_vim'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'SirVer/ultisnips'
Plug 'connorholyday/vim-snazzy'
Plug 'wincent/command-t'
Plug 'airblade/vim-gitgutter'
Plug 'sainnhe/vim-color-forest-night'
Plug 'w0rp/ale'
Plug 'tpope/vim-surround'
Plug 'Yggdroot/indentLine'
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
"Plug 'Xuyuanp/nerdtree-git-plugin'
call plug#end()
let g:ale_completion_enabled = 1
map <C-b> :NERDTreeToggle<CR>
let NERDTreeQuitOnOpen=1
set termguicolors
colorscheme forest-night 
inoremap {      {}<Left>
inoremap {<CR>  {<CR>}<Esc>O
inoremap {{     {
inoremap {}     {}
set updatetime=100
set completeopt=menu,menuone,preview,noselect,noinsert
set exrc
set secure
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif
set splitright   
map <C-f> :ALEGoToDefinition<CR>
let NERDTreeShowHidden=1
let g:indentLine_color_term = 239
let g:indentLine_char='┊'
let g:NERDTreeHighlightFolders = 1
let g:NERDTreeDirArrowExpandable = '🗀'
let g:NERDTreeDirArrowCollapsible = '🗁'
set cursorline
highlight CursorLine guibg=#494e5a
set statusline+=%F
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
let NERDTreeIgnore=['__pycache__', '.git', '.vagrant']

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
set runtimepath+=~/.vim/my-snippets/
let g:UltiSnipsSnippetsDir='/home/angel/.vim/my-snippets/'
let g:UltiSnipsSnippetDirectories=["my-snippets"]

"fu! SaveSess()
"    execute 'call mkdir(%:p:h/.vim)'
"    execute 'mksession! %:p:h/.vim/session.vim'
"endfunction
"
"fu! RestoreSess()
"execute 'so %:p:h/.vim/session.vim'
"if bufexists(1)
"    for l in range(1, bufnr('$'))
"        if bufwinnr(l) == -1
"            exec 'sbuffer ' . l
"        endif
"    endfor
"endif
"endfunction
"
"autocmd VimLeave * call SaveSess()
"autocmd VimEnter * call RestoreSess()
hi Directory guifg=#cae7ea 
autocmd InsertEnter * set conceallevel=0
autocmd InsertLeave * set conceallevel=2
"let g:gitgutter_highlight_lines = 1
