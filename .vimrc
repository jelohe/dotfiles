" Removing toolbars
set guioptions-=m
set guioptions-=T
set guioptions-=L  "remove left-hand scroll bar

" Keymaps
let mapleader="\<space>"
exe 'ino <script> <C-V>' paste#paste_cmd['i']
let &clipboard = has('unnamedplus') ? 'unnamedplus' : 'unnamed'
nnoremap <Leader>> :bnext<CR>
nnoremap <Leader>< :bprev<CR>
nnoremap <Leader>q :bdelete<CR>
nnoremap <Leader>Q :bufdo bd<CR>

" Open .vimrc
nmap <Leader>ev :tabedit $MYVIMRC

" General remaps
nmap <Enter> :
nmap <c-f> /
nnoremap <c-g> <c-]>

set directory=$HOME/.vimtemp//
set backupcopy=yes
set backupdir=$HOME/.vimtemp//

" save with ctrl+s
nmap <c-s> :w<CR>
imap <c-s> <Esc>:w<CR>

" ~~~ Vundle ~~~~
set nocompatible
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

"Initialize and pass a path where Vundle should install plugins if necessary
call vundle#begin('~/.vim/bundle/')

" ~~~ Plugins ~~~
" Misc / Extended functionality
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-surround'
Plugin 'ludovicchabant/vim-gutentags'
Plugin 'tpope/vim-commentary'
Plugin 'ervandew/supertab'
Plugin 'arnaud-lb/vim-php-namespace' " Auto import with use on php
" Syntax
Plugin 'jelera/vim-javascript-syntax'
Plugin 'hail2u/vim-css3-syntax'
Plugin 'pangloss/vim-javascript'
Plugin 'vim-scripts/vim-stylus'
Plugin 'mxw/vim-jsx'
" Themes
Plugin 'bluz71/vim-moonfly-statusline'
Plugin 'dracula/vim'
" Navigation
Plugin 'kien/ctrlp.vim'
" Session management
Plugin 'tpope/vim-obsession'
Plugin 'dhruvasagar/vim-prosession'
" Project workflow
Plugin 'airblade/vim-gitgutter'
Plugin 'w0rp/ale'

" All of your Plugins must be added before the following line
call vundle#end()

filetype plugin indent on

" Theme
syntax enable
colorscheme dracula
set autoindent
set tabstop=4 expandtab shiftwidth=4
set relativenumber
:se noesckeys
set timeoutlen=1000 ttimeoutlen=0


" ~~~ CtrlP ~~~
" Exclude .gitignore files
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
" Remaps
map <Leader>b :CtrlPBuffer<CR>
map <Leader>r :CtrlPMRU<CR>

" Ignore folders
set wildignore+=**/node_modules

" ~~~ Netrw ~~~
map <C-n> :Vex<CR>
let g:netrw_banner = 0
let g:netrw_liststyle=3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 15

" ~~~ PHP autoimports ~~~
autocmd FileType php nnoremap <Leader>u :call PhpInsertUse()<CR>
let g:php_namespace_sort_after_insert = 1

" ~~~ Statusline ~~~
set laststatus=2

" ~~~ ALE ~~~
let g:ale_linters = {
\    'javascript': ['eslint'],
\}
