
# Estructuras de control

# Condiciones

## Concepto

A veces necesitaremos que unas u otras instrucciones se ejecuten en
función de si se cumplen ciertas condiciones. Para esto precisamente
sirven las “declaraciones condicionales”, que hacen uso de expresiones
comparativas y lógicas. Su estructura básica es la siguiente:

-   Si pasa una condicion: `if(condicion)`
-   Entonces ejecuta este código: `{codigo1}`
-   Sino, entonces este otro: `else {codigo2}`

Es decir:

``` r
if (condicion) {
  codigo1
} else {
  codigo2
}
```

Por ejemplo:

``` r
# Número de likes en tu último post de Facebook
num_likes_post <- 20

# Condición
if(num_likes_post > 100){
  print("¡Fuiste popular!") # este código no se ejecuta porque no se cumple la condición
} else {
  print("No fuiste popular") # este código sí se ejecuta
}
```

    ## [1] "No fuiste popular"

## Condición vectorizada

Si tenemos un vector, podemos testear una condición para cada elemento
usando la función `ifelse()`,que tiene tres argumentos:

-   Condición
-   Resultado si verdadero
-   Resultado si falso

``` r
num_likes_semana <- c(10, 40, 120, 40, 33)
eval_likes_semana <- ifelse(num_likes_semana > 100, "¡Fuiste popular!", "No fuiste popular" )
print(eval_likes_semana)
```

    ## [1] "No fuiste popular" "No fuiste popular" "¡Fuiste popular!" 
    ## [4] "No fuiste popular" "No fuiste popular"

# Bucles

## Concepto

En muchas ocasiones vamos a querer repetir ciertas operaciones sobre
unos mismos datos (vectores o listas). Para ese necesitaremos los
**bucles** (*loops*).

El bucle más común es el bucle definido `for in`, donde:

-   Se escribe la palabra clave `for()`
-   Se especifica el indice y su rango `(i in rango)`
-   Se usa el indice en el cuerpo para repetir `{vector[i]}`
-   El código del cuerpo se repetira las veces que especifique el rango.

Por ejemplo:

``` r
numeros <- c(2, 4, 8, 10, 12)
for(i in 1:length(numeros)){
  print(2 + numeros[i])
}
```

    ## [1] 4
    ## [1] 6
    ## [1] 10
    ## [1] 12
    ## [1] 14

En R no es necesario construir constantemente bucles como en otros
lenguajes de programación. Esto se debe a que muchas operaciones ya son
vectorizadas, lo que quiere decir que ya se repiten cuando usas un
vector.

Podemos obtener un resultado similar al anterior simplement con lo
siguiente:

``` r
2 + numeros
```

    ## [1]  4  6 10 12 14

Además existe la alternativa de usar las repeticiones de forma más
comoda que los bucles con `lapply()` (ver siguiente documento). \#
Aplicar

## Concepto

Una forma más sencilla de hacer repeticiones es con las funciones
`apply` y concretamente con la función `lapply()`.

Esta función recibe como argumentos una colección de elementos (vector o
lista) y una función, para luego aplicar la función a cada elemento de
la colección, devolviendo si es necesario una lista de resultados.

Por ejemplo, la función `rnorm()` nos devuelve una cantidad de valores
aleatorios que le pidamos usando una distribución normal estandarizada:

``` r
rnorm(10)
```

    ##  [1] -0.7269493  1.3743210 -0.1268122  0.1040339  0.7032396
    ##  [6] -1.1254583 -1.0010680  1.2612136 -0.1124776  0.2267796

¿Pero que pasa si queremos vectores de 10, 100, 1000, 1000 y 100000
datos? Allí debemos usar un `lapply()`

``` r
cantidades <- c(10, 100, 1000, 10000, 100000)
rnorm(cantidades) # erroneo
```

    ## [1]  0.6210064 -2.1828269 -0.6040137 -1.0394619 -0.3418563

``` r
distribuciones <- lapply(cantidades, rnorm) # correcto
distribuciones[1] # ver primer elemento
```

    ## [[1]]
    ##  [1]  0.10259442  1.46259480  1.64408336  0.11498933 -0.48844372
    ##  [6]  0.99596152  0.01135396  0.43848242 -0.27490611  0.76966982
