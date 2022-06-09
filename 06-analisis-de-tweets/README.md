Análisis de tweets
================

## Instalar y cargar librerias necesarias

Instalar:

-   `rtweet`: para recolectar los datos de la API gratuita de Twitter
-   `tidytext`: para hacer un poco de mineria de texto

``` r
install.packages("rtweet")
install.packages("tidytext")
```

Cargar:

``` r
library(tidyverse)
library(rtweet)
library(tidytext)
```

## Buscar

``` r
palabras_clave = "bitcoin bolivia"
tweets <- search_tweets(q = palabras_clave, n = 100, include_rts = F)
```

``` r
# Mostrar datos recolectados
tweets
```

    ## # A tibble: 44 × 90
    ##    user_id status_id created_at          screen_name text 
    ##    <chr>   <chr>     <dttm>              <chr>       <chr>
    ##  1 xxx606… xxx15343… 2022-06-08 03:49:23 SSBATC      "Bol…
    ##  2 xxx139… xxx15343… 2022-06-08 03:12:00 TripCandy   "Tuc…
    ##  3 xxx142… xxx15341… 2022-06-07 11:57:48 Yosoy20212  "🙏… 
    ##  4 xxx142… xxx15341… 2022-06-07 11:57:12 Yosoy20212  "🙏… 
    ##  5 xxx142… xxx15341… 2022-06-07 11:55:08 Yosoy20212  "🙏… 
    ##  6 xxx142… xxx15341… 2022-06-07 11:46:47 Yosoy20212  "🙏… 
    ##  7 xxx142… xxx15341… 2022-06-07 11:46:01 Yosoy20212  "🙏… 
    ##  8 xxx142… xxx15341… 2022-06-07 11:45:44 Yosoy20212  "🙏… 
    ##  9 xxx142… xxx15341… 2022-06-07 11:44:43 Yosoy20212  "🙏… 
    ## 10 xxx142… xxx15341… 2022-06-07 11:44:05 Yosoy20212  "🙏… 
    ## # … with 34 more rows, and 85 more variables:
    ## #   source <chr>, display_text_width <dbl>,
    ## #   reply_to_status_id <chr>, reply_to_user_id <chr>,
    ## #   reply_to_screen_name <chr>, is_quote <lgl>,
    ## #   is_retweet <lgl>, favorite_count <dbl>,
    ## #   retweet_count <dbl>, quote_count <lgl>,
    ## #   reply_count <lgl>, hashtags <chr>, symbols <lgl>, …

Guardar los datos:

``` r
write_as_csv(tweets, "tweets.csv")
```

## Análisis

Separar palabras:

``` r
palabras <- tweets %>%
  unnest_tokens(palabra, text) %>%
  select(status_id, palabra)
```

Contar palabras con la función `count()`:

``` r
conteo <- palabras %>%
  count(palabra, sort = T)
conteo
```

    ## # A tibble: 244 × 2
    ##    palabra       n
    ##    <chr>     <int>
    ##  1 https        78
    ##  2 t.co         78
    ##  3 bolivia      44
    ##  4 bitcoin      43
    ##  5 chile        36
    ##  6 colombia     36
    ##  7 ecuador      36
    ##  8 argentina    35
    ##  9 ethereum     35
    ## 10 méxico       35
    ## # … with 234 more rows

[\<\<
Anterior](https://github.com/lab-tecnosocial/curso-r/tree/main/05-tidyverse)
