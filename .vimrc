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
nnoremap <Leader>b :buffers<CR>
nnoremap <Leader>q :bdelete<CR>
nnoremap <Leader>Q :bufdo bd<CR>
nnoremap <Leader>j :m +1<CR>
nnoremap <Leader>k :m -2<CR>

" Open .vimrc
nmap <Leader>ev :tabedit $MYVIMRC

" General remaps
nmap <Enter> :
nmap <c-f> /
nnoremap <c-g> <c-]>
nnoremap <Leader>ga :!git add %<CR>
nnoremap <Leader>gc :!git checkout %<CR>:e<CR>
nnoremap <Leader>gn :GitGutterNextHunk<CR>
nnoremap <Leader>gp :GitGutterPrevHunk<CR>
nnoremap <Leader>an :ALENext<CR>
nnoremap <Leader>ap :ALEPrevious<CR>
nnoremap <Leader>cf :let @+ = expand("%:t")<CR>
nnoremap <Leader>cF :let @+ = expand("%")<CR>

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
Plugin 'tpope/vim-commentary'
Plugin 'ervandew/supertab' " Smart autocomplete
" Syntax
Plugin 'jelera/vim-javascript-syntax'
Plugin 'hail2u/vim-css3-syntax'
Plugin 'pangloss/vim-javascript'
Plugin 'vim-scripts/vim-stylus'
Plugin 'mxw/vim-jsx'
" Themes
Plugin 'bluz71/vim-moonfly-statusline'
Plugin 'chriskempson/base16-vim'
" Navigation
Plugin 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plugin 'christoomey/vim-tmux-navigator'
" Session management
Plugin 'tpope/vim-obsession'
Plugin 'dhruvasagar/vim-prosession'
" Project workflow
Plugin 'airblade/vim-gitgutter'
Plugin 'w0rp/ale'
Plugin 'tpope/vim-vinegar'

" All of your Plugins must be added before the following line
call vundle#end()

filetype plugin indent on

" Theme
syntax enable
colorscheme base16-eighties
set autoindent
set tabstop=4 expandtab shiftwidth=4
set relativenumber
:se noesckeys
set timeoutlen=1000 ttimeoutlen=0
"
" ~~~ FZF ~~~
let g:fzf_tags_command = 'ctags -R'
nmap <c-p>  :FZF<CR>

" Ignore folders
set wildignore+=**/node_modules
set wildignore+=**/vendor

" ~~~ Statusline ~~~
set laststatus=2

" ~~~ ALE ~~~
let g:ale_linters = {
\    'javascript': ['eslint'],
\    'php': ['phpcs'],
\    'ruby': ['ruby'],
\}
let g:ale_fixers = {
\   'javascript': ['eslint'],
\}
nnoremap <Leader>f :ALEFix<CR>
