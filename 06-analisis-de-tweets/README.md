Análisis de tweets
================

## Recolección

Usaremos el paquete Rtweet:

1.  Instalarlo
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

    ## ── Attaching packages ─────────────────────────── tidyverse 1.3.1 ──

    ## ✓ ggplot2 3.3.3     ✓ purrr   0.3.4
    ## ✓ tibble  3.1.6     ✓ dplyr   1.0.8
    ## ✓ tidyr   1.2.0     ✓ forcats 0.5.1

    ## ── Conflicts ────────────────────────────── tidyverse_conflicts() ──
    ## x dplyr::filter()  masks stats::filter()
    ## x purrr::flatten() masks rtweet::flatten()
    ## x dplyr::lag()     masks stats::lag()

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
