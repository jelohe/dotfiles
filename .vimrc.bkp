" Autocomplete
function! TabOrComplete()
  if col('.')>1 && strpart( getline('.'), col('.')-2, 3 ) =~ '^\w'
    return "\<C-N>"
  else
    return "\<Tab>"
  endif
endfunction
inoremap <Tab> <C-R>=TabOrComplete()<CR>

" Keymaps
let mapleader="\<space>"
exe 'ino <script> <C-V>' paste#paste_cmd['i']
let &clipboard = has('unnamedplus') ? 'unnamedplus' : 'unnamed'

" Lines
vnoremap J :m '>+1<CR>gv
vnoremap K :m '<-2<CR>gv
nnoremap <tab> <C-^>
nnoremap <leader>j :m +1<CR>
nnoremap <leader>k :m -2<CR>
" Vimrc
nnoremap <leader>ce :tabedit $MYVIMRC<CR>
nnoremap <leader>cs :source $MYVIMRC<CR>

" Misc
nnoremap <Enter> :
nnoremap <leader>cf :let @+ = expand("%")<CR>
nnoremap <leader>cF :let @+ = expand("%")<CR>
" Buffers
nnoremap <leader>q :bdelete<CR>
nnoremap <leader>Q :bufdo bd<CR>
nnoremap <leader><space> :Buffers<CR>
nnoremap <leader>f :Files<CR>
nnoremap <leader>r :Rg 
" Window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

set directory=$HOME/.vimtemp//
set backupcopy=yes
set backupdir=$HOME/.vimtemp//
set undofile
set undodir=$HOME/.vimtemp//
set nocompatible
set visualbell
set t_vb=

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

set signcolumn=no

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
" Colors
Plug 'zenbones-theme/zenbones.nvim',
" Misc / Extended functionality
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
" Syntax
Plug 'elixir-editors/vim-elixir'
" Navigation
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
" Project workflow
Plug 'tpope/vim-vinegar'

" All of your Plugins must be added before the following line
call plug#end()
filetype plugin indent on

" ~~~ FZF ~~~
let g:fzf_preview_window = []

" Ignore folders
set wildignore+=**/node_modules
set wildignore+=**/vendor

set autoindent
set tabstop=2 expandtab shiftwidth=2
:se noesckeys
set timeoutlen=1000 ttimeoutlen=0
set hidden

" ~~~ typescript jsx ~~~
" set filetypes as typescriptreact
autocmd BufNewFile,BufRead *.tsx set filetype=typescriptreact

set nonumber signcolumn=no
function! ToggleNumbers()
  if &number
    set nonumber signcolumn=no
  else
    set number signcolumn=no
  endif
endfunction
nnoremap <leader>l :call ToggleNumbers()<CR>

" ~~~ COLORS ~~~
syntax enable
colorscheme tokyobones
