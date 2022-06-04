R como un interprete
================

## ¿Qué es R?

R es un sistema para la estadística computacional. Pero puede ser mejor
entendido para sus usuarios tanto como un lenguaje de programación y un
interprete que traduce ese lenguaje a operaciones computacionales útiles
sobre datos.

    humano (español) - R (R) - computadora (binario)

## Evaluación

R espera tus instrucciones. Pero solo puedes comunicarte bien con él de
forma escrita, no con menus o iconos, a traves del lenguaje de R, que
tiene su propia semántica, sintaxis y hasta pragmática.

Al proceso de “interpretación” de lo que le digas a R se lo conoce como
“evaluación”. Si cumples con las reglas de semántica y sintaxis
adecuada, entonces R evaluará bien tus instrucciones y realizará las
operaciones que necesitas.

Hay dos tipos de instrucciones que puedes darle: declaraciones y
expresiones.

## Declaraciones (*statements*)

Las declaraciones son instrucciones de acción simples que se ejecutan de
inmediato:

-   Asigna este dato a este nombre
-   Suma estos dos números

Hacen uso de funciones prefijas como `sum()` y funciones infijas,
también conocidos como operadores, como `<-`, `+`.

## Expresiones (*expressions*)

Las expresiones son una combinación compleja de declaraciones,
funciones, variables y datos que se evaluan a un valor usable, por
ejemplo:

``` rm
sum(primer_parcial * 1, segundo_parcial * 2, tercer_parcial * 3) / sum(1:3)
```

Más adelante definiremos de forma más precisa todos estos terminos.

## Referencias

-   <https://cran.r-project.org/doc/manuals/r-devel/R-lang.html>
