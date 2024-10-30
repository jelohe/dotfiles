### Elixir Plug

Es una libreria que abstrae conexiones y streams de datos.
Te permite definir Plugs.

Un Plug puede ser una funcion o un modulo:

```iex
def my_fn_plug(conn, _opts) do
    conn
    |>put_resp_content_type("text/plain")
    |>send_resp(200, "Hello world")
end
```
*Funcion que recibe un conn y unas options*


```iex
defmodule MyModPlugd do
    # Inicializa las options
    def init([]), do: false

    # Maneja la entrada, devuelve el objecto conn
    def call(conn, _opts), do: conn
end

```
*Modulo que implementa `init` y `call`*

# La libreria utiliza el struct Plug.Conn
[https://hexdocs.pm/plug/Plug.Conn.html]

## Tags
@programacion @elixir @plug

## Pergaminos
[crear-server-minimalista-elixir.md]

## Referencias
[https://hexdocs.pm/plug/readme.html]

