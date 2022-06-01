Datos y variables
================

# R como una calculadora

Inicialmente, puedes usar R como una calculadora.Puedes usar varias
operaciones aritméticas, incluidas la adición, sustracción,
multiplicación, división, exponenciación y modulo:

-   Adición:`+`
-   Sustracción: `-`
-   Multipliación:`*`
-   División: `/`
-   Exponenciación:`^`
-   Modulo:`%%`

# Variables

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

# Tipos de datos

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

# Funciones

Tipos: - Incorporadas (built-in) - paste(), print(), sum(), help() -
Definidas por el usuario

Partes - Input - Proceso - Output

Creación y llamadas - El poder de la secuencia - Empaquetar pasos o
acciones. Se deben pensar en los argumentos de antemano. - Resuelve un
problema particular, un problema bien definido. Principio de la caja
negra.

Sintaxis:

``` r
my_fun <- function(arg1, arg2) {
  body
}
```

``` r
# Crear la función
potencia_dos <- function(x){
  x * x
}
# Usarla o "llamarla"
potencia_dos(12)
```

    ## [1] 144

## Argumentos

-   R puede emparejar argumentos **por posición** y **por nombre**
-   Puede haber argumentos **por defecto**, lo que facilita su
    aplicación. Pero a veces hay que ingresar. Argumentos requeridos
    vs. opcionales

Buscar documentación de una función:

``` r
help(sample)
?sample
args(sample)
```

    ## function (x, size, replace = FALSE, prob = NULL) 
    ## NULL

Composibilidad: Funciones dentro de funciones:

``` r
velocidad <- 31
print(paste("Tu velocidad es", velocidad))
```

    ## [1] "Tu velocidad es 31"
