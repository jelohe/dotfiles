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
nnoremap <Leader>ev :tabedit $MYVIMRC<CR>
" Git
nnoremap <Leader>gn :GitGutterNextHunk<CR>
nnoremap <Leader>gp :GitGutterPrevHunk<CR>

" Lint
nmap <silent> <Leader>an <Plug>(coc-diagnostic-next)
nnoremap <Leader>ap <Plug>(coc-diagnostic-prev)
nnoremap <Space>f :CocAction<CR>
nnoremap <silent> gd <Plug>(coc-definition)
" nnoremap <Leader>f <Plug>(coc-fix-current)
" nnoremap <Leader>an :ALENext<CR>
" nnoremap <Leader>ap :ALEPrevious<CR>
" nnoremap <Leader>f :ALEFix<CR>
" Misc
nnoremap <Enter> :
nnoremap <Leader>cf :let @+ = expand("%")<CR>
nnoremap <Leader>cF :let @+ = expand("%")<CR>
nnoremap <Leader>b :Buffers<CR>

nnoremap <Leader>td ?\sdescribe<CR>0y%%o<Esc>o<Esc>p%a;<Esc>b%F'ci'
nnoremap <Leader>tt ?\stest<CR>0y%%o<Esc>o<Esc>p%a;<Esc>b%F'ci'
nnoremap <Leader>to mz?\stest<CR>ea.only<Esc>:w<CR>`z
nnoremap <Leader>ts mz?\stest<CR>ea.skip<Esc>:w<CR>`z
nnoremap <Leader>ta mz:%s^\<\(test\.only\\|test\.skip\)\>^test^g<CR>:w<CR>`z

set directory=$HOME/.vimtemp//
set backupcopy=yes
set backupdir=$HOME/.vimtemp//
set undofile
set undodir=$HOME/.vimtemp//
set nocompatible

" Give more space for displaying messages.
set cmdheight=1

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

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
" Syntax
Plug 'hail2u/vim-css3-syntax'
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
" Navigation
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'christoomey/vim-tmux-navigator'
" Project workflow
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-vinegar'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" All of your Plugins must be added before the following line
call plug#end()

filetype plugin indent on

" ~~~ FZF ~~~
nnoremap <c-p>  :FZF<CR>
nnoremap <Leader>r :Rg 
let g:fzf_tags_command = 'ctags -R'
let $FZF_DEFAULT_COMMAND = 'rg --files'
let g:fzf_preview_window = ''

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

syntax enable
set background=dark
colorscheme srcery
let g:srcery_transparent_background=1
set autoindent
set tabstop=4 expandtab shiftwidth=4
set number
:se noesckeys
set timeoutlen=1000 ttimeoutlen=0
set hidden

" ~~~ ALE ~~~
let g:coc_global_extensions = [
\ 'coc-tsserver'
\ ]
" let g:ale_linters_explicit = 1
" let g:ale_linters = {
" \    'javascript': ['eslint'],
" \    'ruby': ['ruby'],
" \}
" let g:ale_fixers = {
" \   'javascript': ['eslint'],
" \   'ruby': ['rubocop'],
" \   'json': ['prettier']
" \}

" ~~~ typescript jsx ~~~
" set filetypes as typescriptreact
autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescriptreact

function! ReactImport(from)
    execute "normal mz"
    let word = expand("<cword>")
    let hasImport = search("from '" . a:from . "'")
    let isMultiLineImport = getline('.') == "} from '" . a:from . "';"

    if hasImport
        if isMultiLineImport
            execute "normal O" . word . ",\<esc>`z"
        else
            execute "normal F}hi, " . word . "\<esc>`z"
        endif
    else
        execute "normal gg}iimport { " . word . " } from '" . a:from . "';\n\<esc>`z"
    endif
    echo word . " IMPORTED"
endfunction

nnoremap <Leader>ia :call ReactImport("actions")<CR>
nnoremap <Leader>is :call ReactImport("selectors")<CR>
nnoremap <Leader>ic :call ReactImport("constants/index")<CR>
