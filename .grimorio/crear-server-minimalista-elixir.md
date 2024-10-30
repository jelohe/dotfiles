##### Servidor HTTP minimalista con elixir
[https://medium.com/@jonlunsford/elixir-building-a-small-json-endpoint-with-plug-cowboy-and-poison-f4bb40c23bf6]

### Servidor
Tenemos dos opciones:

* erlang-cowboy
deps: `{:plug_cowboy, "~> 2.0"}`
docs: [https://github.com/ninenines/cowboy]

* bandit
deps: `{:bandit, "~> 1.0"}`
docs: [https://hexdocs.pm/bandit/Bandit.html]

### Libreria para gestionar las conexiones
Plug
[https://hexdocs.pm/plug/readme.html]
[elixir-plug.md]

*Conviene crear un proyecto con supervisores*
`mix new my_project --sup`

### Router
Plug.Router [https://hexdocs.pm/plug/Plug.Router.html]
[elixir-plug-router.md]

## Tags
@programacion @elixir

## Pergaminos
[elixir-plug.md]
[elixir-plug-router.md]
[elixir-plug-testing.md]

## Referencias
[https://medium.com/@jonlunsford/elixir-building-a-small-json-endpoint-with-plug-cowboy-and-poison-f4bb40c23bf6]
[https://hexdocs.pm/plug/readme.html]
[https://hexdocs.pm/bandit/Bandit.html]
[https://github.com/ninenines/cowboy]
[https://hexdocs.pm/plug/Plug.Router.html]
