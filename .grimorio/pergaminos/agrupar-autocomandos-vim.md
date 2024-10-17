Cuando usamos autocmd para reaccionar a eventos de vim, estos se ejecutan multiples veces si recargamos la configuracion o abrimos multiples archivos del mismo tipo.

`autocmd BufNewFile *.md 0r ~/.grimorio/plantillas/plantilla.md`

Podemos grupar los comandos de vim en un augroup.
```
:augroup grimorio
:   autocmd BufNewFile *.md 0r ~/.grimorio/plantillas/plantilla.md 
:augroup end
```

Se puede usar una variable para saber si ya se han ejecutado o no previamente e impedir que se dupliquen.
```
:if !exists("autocommands_loaded")
:   let autocommands_loaded = 1
:   augroup grimorio
:       autocmd BufNewFile *.md 0r ~/.grimorio/plantillas/plantilla.txt 
:   augroup END
:endif
```

## Tags
@vim

## Pergaminos

## Referencias
[https://learnvimscriptthehardway.stevelosh.com/chapters/14.html]
[https://neovim.io/doc/user/autocmd.html]
