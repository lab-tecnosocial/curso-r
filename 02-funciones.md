Funciones
================

# Concepto

Tipos: - Incorporadas (built-in) - paste(), print(), sum(), help() -
Definidas por el usuario

Partes - Input - Proceso - Output

Creación y llamadas - El poder de la secuencia - Empaquetar pasos o
acciones. Se deben pensar en los argumentos de antemano. - Resuelve un
problema particular, un problema bien definido. Principio de la caja
negra.

# Sintaxis

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

# Argumentos

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

Composibilidad: Funciones dentro de funciones:

``` r
velocidad <- 31
print(paste("Tu velocidad es", velocidad))
```

    ## [1] "Tu velocidad es 31"

# Ejemplos

Funcion que recibe un numero cualquiera y lo devuelve triplicado

``` r
triplicar <- function(n){
  n * 3
}
triplicar(10)
```

    ## [1] 30

funcion que recibe dos numeros y eleva el primero al segundo

``` r
potenciar <- function(base, potencia){
  base ^ potencia
}
potenciar(2, 4)
```

    ## [1] 16

funcion que recibe tu edad y te dice que año naciste

``` r
calc_nacimiento <- function(edad){
  anio_actual <- 2022
  anio_nacimiento <- anio_actual - edad
  cat("Naciste el año:", anio_nacimiento)
}
calc_nacimiento(36)
```

    ## Naciste el año: 1986

funcion que calcula tu IMC (indice de masa corporal). Peso en Kg y
altura en Metros

``` r
imc <- function(peso, altura){
  peso / altura ^ 2
}

imc(87, 1.72) # bien
```

    ## [1] 29.40779

``` r
imc(1.72, 87) # orden incorrecto
```

    ## [1] 0.0002272427

``` r
imc(peso = 87, altura = 1.72) # orden incorrecto
```

    ## [1] 29.40779
