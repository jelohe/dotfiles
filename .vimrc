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
Plug 'dense-analysis/ale'
" Navigation
Plug 'christoomey/vim-tmux-navigator'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-vinegar'
" Misc / Extended functionality
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'jelohe/vim-tabcomplete'
call plug#end()
filetype plugin indent on
" Plugins config
let g:fzf_preview_window = []
let g:zenbones_compat = 1
let g:ale_linters_explicit = 1
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_insert_leave = 0
let g:ale_lint_on_enter = 0
let g:ale_lint_on_save = 1
let g:ale_set_quickfix = 1
let g:ale_linters = {'javascript' : ['eslint']}
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
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif
set background=dark
colorscheme tokyobones
set term=xterm-256color

" ---
" --- STATUSLINE
" ---
set laststatus=2
set statusline=\ %m\ %f


" ---
" --- OPTIONS
" ---
setlocal shiftwidth=4
setlocal softtabstop=4
setlocal expandtab
setlocal hidden " Allow buffer navigation with pending changes

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
