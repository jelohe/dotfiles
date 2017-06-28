" Removing toolbars
set guioptions-=m
set guioptions-=T
set guioptions-=L  "remove left-hand scroll bar

" Keymaps
let mapleader=","
exe 'ino <script> <C-V>' paste#paste_cmd['i']
let &clipboard = has('unnamedplus') ? 'unnamedplus' : 'unnamed'
nnoremap <Leader>> :bnext<CR>
nnoremap <Leader>< :bprev<CR>
nnoremap <Leader>q :bdelete<CR>

" Open .vimrc
nmap <Leader>ev :tabedit $MYVIMRC

nmap <Enter> :
nmap <c-f> /

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

" plugins
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-surround'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'hail2u/vim-css3-syntax'
Plugin 'itchyny/vim-stylus'
Plugin 'airblade/vim-gitgutter'
Plugin 'ervandew/supertab'
Plugin 'tpope/vim-commentary'
Plugin 'w0rp/ale'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'kien/ctrlp.vim'
Plugin 'dracula/vim'
Plugin 'bluz71/vim-moonfly-statusline'

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

" Ignore folders
set wildignore+=**/node_modules

" ~~~ NerdTree ~~~
map <C-n> :NERDTreeToggle<CR>
map <Leader>b :CtrlPBuffer<CR>
map <Leader>r :CtrlPMRU<CR>

" ~~~ Statusline ~~~
set laststatus=2

" ~~~ ALE ~~~
let g:ale_linters = {
\    'javascript': ['eslint'],
\}
