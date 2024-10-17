nnoremap <leader>gn :e ~/.grimorio/pergaminos/<cfile><cr>
vnoremap <leader>gn :e ~/.grimorio/pergaminos/<cfile><cr>


:if !exists("autocommands_loaded")
:   let autocommands_loaded = 1
:   augroup grimorio
:       autocmd!
:       autocmd BufNewFile *.md 0r ~/.grimorio/plantillas/plantilla.txt 
:   augroup END
:endif
