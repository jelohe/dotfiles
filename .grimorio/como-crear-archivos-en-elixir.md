# Crear archivos desde elixir

Podemos cambiar el directorio de trabajo:
`cd(path)`
***No esta aconsejado porque cambia el path globalmente de la maquina BEAM***

Escribimos el archivo:
`write(path, content, modes \\ [])`
Devuelve `:ok` o `{:error, posix()}`

`content` es un tipo IO[elixir-io-data-type.md]

Si añadimos `!` a las funciones lanzaran una *excepcion* si algo falla.
`File.write!('my/path.txt', ["hello", "world"])`
`:ok`

## Tags
@programacion @elixir

## Pergaminos
[elixir-io-data-type.md]

## Referencias
[https://hexdocs.pm/elixir/1.12.3/File.html#module-api]
