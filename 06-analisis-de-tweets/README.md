Análisis de tweets
================

# Recolección

Usaremos el paquete Rtweet:

1.  Instalarlo (no autenticarse)
2.  Buscar tweets con palabras clave
3.  Un dataframe para trabajar

## Instalar y cargar librerias

``` r
install.packages("rtweet")
```

``` r
library(rtweet)
library(tidytext)
library(tidyverse)
```

## Buscar

``` r
palabras_clave = "bitcoin bolivia"
tweets <- search_tweets(q = palabras_clave, n = 100, include_rts = F)
tweets
```

## Análisis

Separar palabras:

``` r
palabras <- tweets %>%
  unnest_tokens(palabra, text) %>%
  select(status_id, palabra)

conteo <- palabras %>%
  count(palabra, sort = T)
conteo
```
