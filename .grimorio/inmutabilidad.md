# Inmutabilidad

Programar de una forma en la que los datos no cambian, si no que se crean nuevas versiones de ellos.

      # INPUT #             # FUNC #               # OUTPUT #
.--------------------.   .------------.   .--------------------------.
| [manzana, naranja] |-->|            |   |                          |
:====================:   | AddToArray |-->| [pera, manzana, naranja] |
|        pera        |-->|            |   |                          |
'--------------------'   '------------'   '--------------------------'

```
function AddToArry(string fruit, List<string> fruits) {
    List<string> nextFruits = New List(fruits);
    nextFruits.Add(fruit);
    return nextFruits;
}
```

## Tags
@programming @functional

## Pergaminos
[programacion-funcional.md]

## Referencias
