* Mediator
Problema: Multiples inputs que estan relacionados entre ellos y tienen que reaccionar a los cambios de los demas.

Solucion: Mediadior, por ejemplo un controller, saca los datos del dominio y se los pasa a la vista.

* Facade
Una abstraccion que permite agrupar un conjunto de modulos y exponer una unica interfaz hacia fuera.

Es una simplificacion que facilita el acceso a un conjunto de funciones.

* Strategy
Tener una funcion con el mismo nombre que procese datos datos de diferentes origenes.

Por ej, queremos procesar texto que venga plano, en lenguje tex o  como un array.

Siempre llamamos a process
  input ---> process(type) ---> output

```iex
  process(input, type) do
    case type do
      :simple -> simple_process(input)
      :tex -> tex_process(input)
      :array -> array_process(input)
  end
```

En orientacion a objetos se soluciona con herencia.

Tambien se pueden usar funciones de primer order
```iex
def process(input, strategy) do
    ...
    strategy(inputs, ...)
    ...
end
```

# Los objetos en OOP
Los objetos son una abstraccion que encapsula:
* Comportamiento
* Datos
* Mutabilidad

# Como lo hace elixir?
Desacopla esas tres dimensiones

Comportamientos -> defmodules
Para polimorfismo -> behaviours

Datos -> data
Para polimorfismo -> protocols

Mutabilidad -> processes
Para polimorfismo -> messages (o lo agrupamos en comportamientos + datos)

## Tags
@programacion @elixir

## Pergaminos

## Referencias
[https://www.youtube.com/watch?v=agkXUp0hCW8]
