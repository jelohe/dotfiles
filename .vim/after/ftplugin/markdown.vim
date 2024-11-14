nnoremap <leader>gn :e ~/grimorio/<cfile><cr>
vnoremap <leader>gn :e ~/grimorio/<cfile><cr>

:if !exists("autocommands_loaded")
:   let autocommands_loaded = 1
:   augroup grimorio
:       autocmd!
:       autocmd BufNewFile *.sh execute 'silent! 0r ~/.plantillas/plantilla.txt'
:   augroup END
:endif
