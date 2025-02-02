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
Plug 'catppuccin/vim', { 'as': 'catppuccin' }
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
Plug 'karoliskoncevicius/vim-sendtowindow'
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
" --- FOCUS MODE
" --- 
function! ToggleNumbers()
  if &number
    set nonumber signcolumn=no
    set laststatus=0
  else
    set number signcolumn=no
    set laststatus=2
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
" override by sendtowindow
" nnoremap <leader>j :m +1<cr>
" nnoremap <leader>k :m -2<cr>
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
set termguicolors
set term=xterm-256color
set background=dark
colorscheme catppuccin_macchiato
" transparent bg
hi Normal guibg=NONE ctermbg=NONE

" ---
" --- OPTIONS
" ---
set shiftwidth=4
set softtabstop=4
set expandtab " Default 4 spaces, no tabs
set hidden " Allow buffer navigation with pending changes
set nonumber signcolumn=no
set laststatus=0
" set statusline=\ %m\ %f

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

" REPL

function! OpenNodeInSplit()
  terminal node
  wincmd p
endfunction

function! SendLine()
  :let @p = getline('.')
  wincmd k
  call feedkeys(@p . "\r", 'n')
  call timer_start(0, {-> execute("wincmd p")})
endfunction

nnoremap <leader>n :call OpenNodeInSplit()<CR>
nnoremap <leader>. :call SendLine()<CR>
