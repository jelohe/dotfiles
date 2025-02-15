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

vnoremap J :m '>+1<CR>gv
vnoremap K :m '<-2<CR>gv
nnoremap <tab> <C-^>
nnoremap <Leader>q :bdelete<CR>
nnoremap <Leader>Q :bufdo bd<CR>
nnoremap <Leader>j :m +1<CR>
nnoremap <Leader>k :m -2<CR>
" Open .vimrc
nnoremap <Leader>ce :tabedit $MYVIMRC<CR>
" Reload .vimrc
nnoremap <Leader>cr :source $MYVIMRC<CR>

" Lint
nnoremap <Leader>an :ALENext<CR>
nnoremap <Leader>ap :ALEPrevious<CR>
nnoremap <Leader>f :ALEFix<CR>
" nnoremap <Leader>f :OmniSharpCodeFormat<CR>
" Misc
nnoremap <Enter> :
nnoremap <Leader>cf :let @+ = expand("%")<CR>
nnoremap <Leader>cF :let @+ = expand("%")<CR>
nnoremap <Leader>b :Buffers<CR>

" Window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

set directory=~/.vimtemp/swap//
set backupcopy=yes
set backupdir=~/.vimtemp/backup//
set undofile
set undodir=~/.vimtemp/undo//
set nocompatible
set visualbell
set t_vb=

" Give more space for displaying messages.
set cmdheight=1

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=no

" Save with ctrl+s
nnoremap <c-s> :w<CR>
inoremap <c-s> <Esc>:w<CR>

" Install vim-plug for Neovim if not already installed
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
    silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.local/share/nvim/plugged')
" ~~~ PLUGINS ~~~
" Colors
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'vimpostor/vim-lumen'
Plug 'pgdouyon/vim-yin-yang'
Plug 'zenbones-theme/zenbones.nvim',
Plug 'chriskempson/base16-vim',
" Misc / Extended functionality
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'junegunn/vim-peekaboo'
" Syntax
Plug 'dense-analysis/ale'
Plug 'hail2u/vim-css3-syntax'
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'OmniSharp/omnisharp-vim'
Plug 'elixir-editors/vim-elixir'
Plug 'Olical/conjure'
Plug 'tpope/vim-dispatch'
Plug 'clojure-vim/vim-jack-in'
" Navigation
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
" Project workflow
Plug 'tpope/vim-vinegar'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" All of your Plugins must be added before the following line
call plug#end()

filetype plugin indent on

" ~~~ FZF ~~~
nnoremap <c-p>  :Files<CR>
nnoremap <Leader>r :Rg 
let g:fzf_preview_window = []

" Ignore folders
set wildignore+=**/node_modules
set wildignore+=**/vendor

" ~~~ Statusline ~~~
function! StatusDiagnostic() abort
  let info = get(b:, 'coc_diagnostic_info', {})
  if empty(info) | return '' | endif
  let msgs = []
  if get(info, 'error', 0)
    call add(msgs, 'E' . info['error'])
  endif
  if get(info, 'warning', 0)
    call add(msgs, 'W' . info['warning'])
  endif
  return join(msgs, ' ')
endfunction

set laststatus=2
set statusline=\ %f "File path
set statusline+=\ %m "File modified?
set statusline+=\ %{StatusDiagnostic()}
set statusline+=\ %= "Go to the right side
set statusline+=[%l/%L] "line/total lines
set statusline+=\ %P "Height of the screen %

set autoindent
set tabstop=2 expandtab shiftwidth=2
set timeoutlen=1000 ttimeoutlen=0
set hidden

" ~~~ COC ~~~
let g:coc_global_extensions = [
\ 'coc-tsserver'
\ ]

" ~~~ ALE ~~~
let g:ale_linters_explicit = 1
let g:ale_linters = {
\    'javascript': ['eslint'],
\    'ruby': ['ruby'],
\    'cs': ['OmniSharp']
\}
let g:ale_fixers = {
\   'javascript': ['eslint'],
\   'ruby': ['rubocop'],
\   'json': ['prettier'],
\   'cs': ['dotnet-format'],
\   'elixir': ['mix_format']
\}

" ~~~ Omni # ~~~
let g:OmniSharp_translate_cygwin_wsl = 1
let g:OmniSharp_highlighting = 0

" ~~~ typescript jsx ~~~
" set filetypes as typescriptreact
autocmd BufNewFile,BufRead *.tsx set filetype=typescriptreact

" ~~~ Disable search highlights ~~~
:nohlsearch

" ~~~ Hyperfocus mode ~~~
autocmd! User GoyoEnter Limelight 0.8
autocmd! User GoyoLeave Limelight!

set nonumber
function! ToggleNumbers()
  if &number
    set nonumber signcolumn=no
  else
    set number signcolumn=yes
  endif
endfunction
nnoremap <Leader>l :call ToggleNumbers()<CR>

" ~~~ COLORS ~~~
syntax enable
set termguicolors
" if (&background == 'light')
    colorscheme base16-grayscale-dark
" else
"     colorscheme base16-grayscale-light
" endif

