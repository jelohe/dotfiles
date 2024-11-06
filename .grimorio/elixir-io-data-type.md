Tipos que agrupan bytes (enteros entre 0 y 255) o datos de IO enlazados.
["h", "e", "l", "l", "o"]

Cuando concatenamos strings, utilizamos mucha memoria:
```ix
def greeter(name) do
    "Hello" <> name 
end

def polite(name) do
    # Estamos creando una copia del string greeter cada vez que lo usemos
    greeter(name) <> "Pleased to meet you"
end

IO.puts(polite("jose"))
```

Usando IO Data:
```ix
def greeter(name) do
    ["Hello", name]
end

def polite(name) do
    # Declaramos la estructura, no creamos copias
    [greeter(name), "Pleased to meet you"]
end

IO.puts(polite("jose"))
```

## Tags
@programacion @elixir

## Pergaminos
[como-crear-archivos-en-elixir.md]

## Referencias
[https://hexdocs.pm/elixir/1.12.3/IO.html#module-io-data]
