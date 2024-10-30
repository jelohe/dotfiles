Mapear una tecla de VIM para que seleccione el nombre de archivo bajo el cursor e intente crearlo

* Hay que utilizar <cfile> para obtener el nombre de archivo bajo el cursor

* Mapeo del modo normal
`nnoremap <leader>c :e <cfile><cr>`

* Mapeo del modo visual
`vnoremap <leader>c :e <cfile><cr>`

## Tags
@vim @grimorio

## Pergaminos
[crear-script-por-extension-vim.md]
[saber-el-filteype-interno-de-vim-por-extension.md]

## Referencias
[https://superuser.com/questions/277325/create-a-file-under-the-cursor-in-vim]
[https://vi.stackexchange.com/questions/3364/open-filename-under-cursor-like-gf-but-in-a-new-tab-or-split]
