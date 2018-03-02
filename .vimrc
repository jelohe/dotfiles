" Removing toolbars
set guioptions-=m
set guioptions-=T
set guioptions-=L  "remove left-hand scroll bar

" Keymaps
let mapleader="\<space>"
exe 'ino <script> <C-V>' paste#paste_cmd['i']
let &clipboard = has('unnamedplus') ? 'unnamedplus' : 'unnamed'
vnoremap J :m '>+1<CR>gv
vnoremap K :m '<-2<CR>gv
nnoremap <tab> <C-^>
nnoremap <Leader>q :bdelete<CR>
nnoremap <Leader>Q :bufdo bd<CR>
nnoremap <Leader>j :m +1<CR>
nnoremap <Leader>k :m -2<CR>

" Open .vimrc
nnoremap <Leader>ev :tabedit $MYVIMRC<CR>

" General remaps
nnoremap <Enter> :
nnoremap <c-f> /
nnoremap <c-g> <c-]>
nnoremap <Leader>ga :!git add %<CR>
nnoremap <Leader>gc :!git checkout %<CR>:e<CR>
nnoremap <Leader>gn :GitGutterNextHunk<CR>
nnoremap <Leader>gp :GitGutterPrevHunk<CR>
nnoremap <Leader>an :ALENext<CR>
nnoremap <Leader>ap :ALEPrevious<CR>
nnoremap <Leader>cf :let @+ = expand("%:t")<CR>
nnoremap <Leader>cF :let @+ = expand("%")<CR>
nnoremap <Leader>b Buffers<CR>

set directory=$HOME/.vimtemp//
set backupcopy=yes
set backupdir=$HOME/.vimtemp//
set undofile
set undodir=$HOME/.vimtemp//

" save with ctrl+s
nnoremap <c-s> :w<CR>
inoremap <c-s> <Esc>:w<CR>


" ~~~ Plugins ~~~
" Install vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
                \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
"Initialize and pass a path where vim-plug should install plugins if necessary
call plug#begin('~/.vim/plugged')
" Misc / Extended functionality
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'ervandew/supertab' " Smart autocomplete
" Syntax
Plug 'jelera/vim-javascript-syntax'
Plug 'hail2u/vim-css3-syntax'
Plug 'pangloss/vim-javascript'
Plug 'vim-scripts/vim-stylus'
Plug 'mxw/vim-jsx'
" Themes
Plug 'bluz71/vim-moonfly-statusline'
" Navigation
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'christoomey/vim-tmux-navigator'
" Project workflow
Plug 'airblade/vim-gitgutter'
Plug 'w0rp/ale'
Plug 'tpope/vim-vinegar'

" All of your Plugins must be added before the following line
call plug#end()

filetype plugin indent on

" Theme
syntax enable
colorscheme base16
set autoindent
set tabstop=4 expandtab shiftwidth=4
set relativenumber
:se noesckeys
set timeoutlen=1000 ttimeoutlen=0
"
" ~~~ FZF ~~~
let g:fzf_tags_command = 'ctags -R'
nnoremap <c-p>  :FZF<CR>

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
