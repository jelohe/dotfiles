### Plug.Router

# POST
Se utiliza `Plug.Parsers`
[https://hexdocs.pm/plug/Plug.Router.html#module-parameter-parsing]

```ix
defmodule AppRouter do
  use Plug.Router

  plug :match

  # Tiene que ir *ANTES* que `:dispatch`, puede ir antes de `:match`
  plug Plug.Parsers,
       parsers: [:json],
       pass:  ["application/json"],
       json_decoder: Jason

  plug :dispatch

  post "/hello" do
    IO.inspect conn.body_params # Prints JSON POST body
    send_resp(conn, 200, "Success!")
  end
end
```

## Tags
@programacion @elixir

## Pergaminos
[elixir-plug.md]
[crear-server-minimalista-elixir.md]

## Referencias
[https://hexdocs.pm/plug/Plug.Router.html]
[https://hexdocs.pm/plug/Plug.Router.html#module-parameter-parsing]
