Como crear un archivo nuevo proporcionando un template

`autocmd BufNewFile *.sh 0r ~/skeletons/markdown.md`

* `autocmd` -> Responde a un evento
* `BufNewFile` -> Nuevo archivo
* `*.sh` -> Regex para saber que archivos detectar
* `0r` -> lee el archivo a continuacion desde la linea 0
* `~/skeletons/markdown.md` -> Cualquier ruta a nuestro template 

Cuidado al crear los autocmd porque pueden ejecutarse multiples veces
Solucion -> [agrupar-autocomandos-vim.md]

Tambien hay que tener en cuenta que el skeleton se añada a la lista de buffers abiertos

## Tags
@vim @grimorio

## Pergaminos
[agrupar-autocomandos-vim.md]

## Referencias
[https://vimtricks.com/p/vim-file-templates/]
