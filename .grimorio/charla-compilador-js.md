* Sustituir varias llamas a funciones por su implementacion reduce la velocidad de procesamiento de 19MBs a 2MBs (chrome).

* Un commentario de `Use asm` en ascii art lo arregla, no se como.

* Benchmark
```js
function benchmark(fn, N) {
    const start = Date.now()
    for (var i = 0; i < N; i++) {
        fn();
    }
    return (Date.now() - start) / N
}
```

* Si mutas los datos de alguna manera dentro de `fn` el benchmark no va a ser fiable porque fn va a tardar diferentes intervalos de tiempo cada vez que se ejecute.

* JIT, el compilador en tiempo real, optimiza el codigo desde el navegador

## CONCLUSION

El compilador hace todo tipo de optimizaciones.

Escribir un benchmark es dificil porque no sabemos que optimizaciones va a hacer el compilador, es mejor medir el rendimiento de la aplicacion en lugar de aislar funciones.

Las optimizaciones del compilador pueden ser anti-intuitivas. 

## Tags
@programacion @js

## Pergaminos

## Referencias
[https://www.youtube.com/watch?v=g0ek4vV7nEA]

