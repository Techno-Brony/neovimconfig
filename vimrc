"<-- ORIGINAL VIM SETTINGS START HERE /-/-/-/-/-/-/-/-/-/-/-/-/-->
filetype indent on

set autoindent
set expandtab
set softtabstop=4
set tabstop=4
set shiftwidth=4
set history=1000

"<-- ESSENTIAL STUFF HERE -->
ino jk <esc>
vno v <esc>
nnoremap ; :
nnoremap : ;
set relativenumber
set showcmd
syntax enable

"<-- ESSENTIAL STUFF END HERE -->

autocmd InsertEnter * :set number | :set norelativenumber
autocmd InsertLeave * :set relativenumber | :set nonumber

let mapleader = ","
set backspace=2

nmap <silent> <c-h> :wincmd h<CR>
nmap <silent> <c-j> :wincmd j<CR>
nmap <silent> <c-k> :wincmd k<CR>
nmap <silent> <c-l> :wincmd l<CR>

set copyindent
set smartcase
set smarttab
set ignorecase
set title

set background=dark

cnoreabbrev <expr> X (getcmdtype() is# ':' && getcmdline() is# 'X') ? 'x' : 'X'
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>

"<-- ORIGINAL VIM SETTINGS END HERE /-/-/-/-/-/-/-/-/-/-/-/-/-/-->

"<-- PLUGIN LIST STARTS HERE -/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-->

call plug#begin()

Plug 'neomake/neomake'
Plug 'airblade/vim-gitgutter'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'itchyny/lightline.vim'
Plug 'scrooloose/nerdtree'

"<-- AUTOCOMPLETION PLUGINS START HERE /-/-/-/-/-/-/-/-/-/-/-/-->
Plug 'ervandew/supertab'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-clang'

"<-- SYNTAX HIGHLIGHTING PLUGINS START HERE /-/-/-/-/-/-/-/-/-/-->
Plug 'octol/vim-cpp-enhanced-highlight'

call plug#end()

"<-- PLUGIN LIST ENDS HERE -/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-->

colorscheme base16-onedark
if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
endif

autocmd! BufWritePost,BufEnter * Neomake

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
let g:NERDTreeWinSize=40
let g:NERDTreeShowBookmarks = 1
let NERDTreeMinimalUI = 1

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
let g:SuperTabDefaultCompletionType = "context"
let g:deoplete#enable_at_startup = 1
let g:deoplete#sources#clang#libclang_path = "/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/libclang.dylib"
let g:deoplete#sources#clang#clang_header = "/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/clang/8.0.0/include/"
"<-- DEOPLETE STUFF ENDS HERE -->

map <C-p> :Files<CR>
