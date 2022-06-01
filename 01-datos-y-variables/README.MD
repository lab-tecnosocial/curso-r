Datos y variables
================

## R como una calculadora

Inicialmente, puedes usar R como una calculadora.Puedes usar varias
operaciones aritméticas, incluidas la adición, sustracción,
multiplicación, división, exponenciación y modulo:

-   Adición:`+`
-   Sustracción: `-`
-   Multipliación:`*`
-   División: `/`
-   Exponenciación:`^`
-   Modulo:`%%`

## Variables

Una variable permite almacenar un valor o un objeto. Luego se puede usar
el nombre de la variable para acceder al valor u objeto almacenado,
usarlo o combinarlo. Para ello se debe usar el operador de asignación:

> Operador de asignación: `<-`

Debemos usar nombres descriptivos:

``` r
mis_platanos <- 5
mis_manzanas <- 2
mis_frutas <- mis_platanos + mis_manzanas
print(mis_frutas)
```

    ## [1] 7

Demostración: promedio de materia

## Tipos de datos

Son los tipos de valores que pueden soportar las variables. Existen:

``` r
# integer
mi_entero <- 66
# numeric
mi_decimal <- 66.5
# character
mi_texto <- "Juan"
# logical
mi_logico <- TRUE

# verificar la clase y el tipo
class(mi_entero)
```

    ## [1] "numeric"

``` r
typeof(mi_entero)
```

    ## [1] "double"

Cada tipo de dato permite o se restringe a ciertas operaciones.

Ejercicio: calcular descuento de salario mensual
