" Removing toolbars
set guioptions-=m
set guioptions-=T
set guioptions-=L  "remove left-hand scroll bar

" Theme
syntax enable
colorscheme monokai
set guifont=Monospace\ 11
set autoindent
set tabstop=4 expandtab shiftwidth=4
set relativenumber
:se noesckeys
set timeoutlen=1000 ttimeoutlen=0

" Keymaps
let mapleader=","
exe 'ino <script> <C-V>' paste#paste_cmd['i']
let &clipboard = has('unnamedplus') ? 'unnamedplus' : 'unnamed'

" Open .vimrc
nmap <Leader>ev :tabedit $MYVIMRC

nmap <Enter> :
nmap <c-f> /

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
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'tpope/vim-surround'
Plugin 'itchyny/lightline.vim'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'hail2u/vim-css3-syntax'
Plugin 'itchyny/vim-stylus'
Plugin 'airblade/vim-gitgutter'
Plugin 'ervandew/supertab'

" All of your Plugins must be added before the following line
call vundle#end()

filetype plugin indent on

" ~~~ CtrlP ~~~
" Exclude .gitignore files
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

" ~~~ LightLine ~~~
" Theme
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ }

set laststatus=2

" ~~~ NerdTree ~~~
map <C-n> :NERDTreeToggle<CR>

" ~~~ Powerline ~~~
python from powerline.vim import setup as powerline_setup
python powerline_setup()
python del powerline_setup

" Ignore folders
set wildignore+=**/node_modules
