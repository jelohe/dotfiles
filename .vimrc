" --- 
" --- PLUGINS
" --- 
" Install vim-plug if missing
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
                \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
call plug#begin('~/.vim/plugged')
" Colors
Plug 'zenbones-theme/zenbones.nvim'
" Languages
Plug 'elixir-editors/vim-elixir'
" Navigation
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-vinegar'
" Misc / Extended functionality
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'jelohe/vim-tabcomplete'
Plug 'jelohe/vim-minline'
call plug#end()
filetype plugin indent on
" Plugins config
let g:fzf_preview_window = []
let g:zenbones_compat = 1

" --- 
" --- TOGGLE NUMBERS
" --- 
set number signcolumn=no
function! ToggleNumbers()
  if &number
    set nonumber signcolumn=no
  else
    set number signcolumn=no
  endif
endfunction

" --- 
" --- MAPPINGS
" --- 
let mapleader="\<space>"
" Moving lines
vnoremap J :m '>+1<cr>gv
vnoremap K :m '<-2<cr>gv
nnoremap <tab> <c-^>
nnoremap <leader>j :m +1<cr>
nnoremap <leader>k :m -2<cr>
" Config management
nnoremap <leader>ce :tabedit $MYVIMRC<cr>
nnoremap <leader>cs :source $MYVIMRC<cr>
" Buffers
nnoremap <leader>q :bdelete<cr>
nnoremap <leader>Q :bufdo bd<cr>
nnoremap <leader><space> :Buffers<cr>
nnoremap <leader>f :Files<cr>
nnoremap <leader>r :Rg 
" Window navigation
nnoremap <c-h> <c-w>h
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l
" Quality of life
nnoremap <Enter> :
nnoremap <c-s> :w<cr>
inoremap <c-s> <esc>:w<cr>
nnoremap <leader>cf :let @+ = expand("%")<cr>
nnoremap <leader>cF :let @+ = expand("%")<cr>
nnoremap <leader>l :call ToggleNumbers()<cr>

" ---
" --- CLIPBOARD
" ---
exe 'ino <script> <C-V>' paste#paste_cmd['i']
let &clipboard = has('unnamedplus') ? 'unnamedplus' : 'unnamed'

" ---
" --- COLORS
" ---
syntax enable
set termguicolors
set background=dark
colorscheme tokyobones

" ---
" --- STATUSLINE
" ---
set laststatus=2

" ---
" --- OPTIONS
" ---
setlocal shiftwidth=4
setlocal softtabstop=4
setlocal expandtab

" ---
" --- TEMP FILES
" ---
silent !mkdir -p $HOME/.vim/temp/backup
silent !mkdir -p $HOME/.vim/temp/swap
silent !mkdir -p $HOME/.vim/temp/undo
set backup
set backupdir=$HOME/.vim/temp/backup/
set backupext=-vimbackup
set backupskip=
set directory=$HOME/.vim/temp/swap/
set updatecount=100
set undofile
set undodir=$HOME/.vim/temp/undo/
