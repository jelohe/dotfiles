# Evitar efectos secundarios

El objetivo es detectar en que partes del sistema suceden los efectos secundarios y
'empujarlos fuera' del resto del codigo puro. [funciones-puras.md]

Ejemplos tipicos de efectos secundarios:
* Leer datos
* Escribir datos
* Lanzar excepciones

                 .____________________.
                 | Side effects layer |-->|output|-->
                 |  ._____________.   |
-->->|input|-->->|  |             |   |-->|write data|-->
                 |  |    Pure     |   |
                 |  |    Code     |   |-->|exceptions|-->
                 |  |             |   |
-->|read data|-->|  ._____________.   |-->|launch nuclear missiles|-->  
                 |                    |
                 | Side effects layer |-->|other side effects|-->
                 .____________________.

## Tags
@programming @functional

## Pergaminos
[programacion-funcional.md]
[funciones-puras.md]

## Referencias
