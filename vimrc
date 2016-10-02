"<-- VIM TRAINING WHEELS START HERE /-/-/-/-/-/-/-/-/-/-/-/-/-/-->

map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>

"<-- VIM TRAINING WHEELS END HERE /-/-/-/-/-/-/-/-/-/-/-/-/-/-/-->

"<-- ORIGINAL VIM SETTINGS START HERE /-/-/-/-/-/-/-/-/-/-/-/-/-->

filetype indent on

set autoindent
set expandtab
set softtabstop=4
set tabstop=4
set shiftwidth=4

"<-- ESSENTIAL STUFF HERE -->
ino jk <esc>
vno v <esc>
nnoremap ; :
set relativenumber
set showcmd
syntax enable

"<-- ESSENTIAL STUFF END HERE -->

autocmd InsertEnter * :set number | :set norelativenumber
autocmd InsertLeave * :set relativenumber | :set nonumber

let mapleader = ","
set backspace=2

nmap <silent> <C-h> :wincmd h<CR>
nmap <silent> <C-j> :wincmd j<CR>
nmap <silent> <C-k> :wincmd k<CR>
nmap <silent> <C-l> :wincmd l<CR>
nmap <C-v> "+p

set copyindent
set smartcase
set smarttab
set ignorecase
set title

set background=dark

cnoreabbrev <expr> X (getcmdtype() is# ':' && getcmdline() is# 'X') ? 'x' : 'X'

"<-- ORIGINAL VIM SETTINGS END HERE /-/-/-/-/-/-/-/-/-/-/-/-/-/-->

"<-- PLUGIN LIST STARTS HERE -/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-->

call plug#begin()

Plug 'chriskempson/base16-vim'
Plug 'neomake/neomake'
Plug 'tpope/vim-fugitive'
Plug 'easymotion/vim-easymotion'
Plug 'airblade/vim-gitgutter'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'itchyny/lightline.vim'
Plug 'scrooloose/nerdtree'

"<-- AUTOCOMPLETION PLUGINS START HERE /-/-/-/-/-/-/-/-/-/-/-/-->
Plug 'ervandew/supertab'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-clang'
Plug 'rkulla/pydiction'
Plug 'raimondi/delimitmate'

"<-- SYNTAX HIGHLIGHTING PLUGINS START HERE /-/-/-/-/-/-/-/-/-/-->
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'hdima/python-syntax'

call plug#end()

"<-- PLUGIN LIST ENDS HERE -/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-->

colorscheme base16-google-dark

autocmd BufWrite * :Neomake

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
let g:NERDTreeWinSize=40
let g:NERDTreeShowBookmarks = 1

let g:lightline = {
      \ 'colorscheme': 'solarized',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'fugitive', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component': {
      \   'readonly': '%{&filetype=="help"?"":&readonly?"⭤":""}',
      \   'modified': '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}',
      \   'fugitive': '%{exists("*fugitive#head")?fugitive#head():""}'
      \ },
      \ 'component_visible_condition': {
      \   'readonly': '(&filetype!="help"&& &readonly)',
      \   'modified': '(&filetype!="help"&&(&modified||!&modifiable))',
      \   'fugitive': '(exists("*fugitive#head") && ""!=fugitive#head())'
      \ },
      \ }

"<-- DEOPLETE STUFF HERE -->
let g:SuperTabDefaultCompletionType = "<c-n>"
let g:deoplete#enable_at_startup = 1
let g:deoplete#sources#clang#libclang_path = "/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/libclang.dylib"
let g:deoplete#sources#clang#clang_header = "/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/clang/8.0.0/include/"
let g:pydiction_location = '~/.vim/plugged/pydiction/complete-dict'
"<-- DEOPLETE STUFF ENDS HERE -->

map <C-p> :Files<CR>

nmap <Leader>gs :Gstatus<CR>
nmap <Leader>gc :Gcommit<CR>
nmap <Leader>gp :Gpush<CR>
