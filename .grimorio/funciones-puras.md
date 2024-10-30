# Funciones puras
Las funciones puras son aquellas que *no tienen efectos secundarios*, por lo que siempre reciben un input y devuelven un output.

.-------.   .--------------.   .--------.
| input |-->| Funcion pura |-->| output |
'-------'   '--------------'   '--------'

* Se encarga de transformar datos y todos sus inputs y outpus son explicitos.

Ejemplos
```
function sum(int a, int b) {
    return a + b;
}
// $ sum(3, 2)
// > 5
```
La funcion suma dos numeros, no cambia ninguno de ellos ni ejecuta un efecto secundario. Devuelve un output.

## Tags
@programming @functional

## Pergaminos
[inmutabilidad.md]
[evitar-efectos-secundarios.md]
[programacion-funcional.md]

## Referencias
