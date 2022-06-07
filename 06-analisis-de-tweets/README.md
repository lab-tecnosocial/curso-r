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

    ## ── Attaching packages ───────────────────────────────────────────────────────────────────────────────── tidyverse 1.3.1 ──

    ## ✔ ggplot2 3.3.6     ✔ purrr   0.3.4
    ## ✔ tibble  3.1.7     ✔ dplyr   1.0.9
    ## ✔ tidyr   1.2.0     ✔ forcats 0.5.1

    ## ── Conflicts ──────────────────────────────────────────────────────────────────────────────────── tidyverse_conflicts() ──
    ## ✖ dplyr::filter()  masks stats::filter()
    ## ✖ purrr::flatten() masks rtweet::flatten()
    ## ✖ dplyr::lag()     masks stats::lag()

## Buscar

``` r
palabras_clave = "bitcoin bolivia"
tweets <- search_tweets(q = palabras_clave, n = 100, include_rts = F)
```

    ## Requesting token on behalf of user...

    ## Waiting for authentication in browser...

    ## Press Esc/Ctrl + C to abort

    ## Authentication complete.

``` r
tweets
```

    ## # A tibble: 44 × 90
    ##    user_id       status_id created_at          screen_name text  source display_text_wi… reply_to_status… reply_to_user_id
    ##    <chr>         <chr>     <dttm>              <chr>       <chr> <chr>             <dbl> <chr>            <chr>           
    ##  1 142777729148… 15341425… 2022-06-07 11:57:48 Yosoy20212  "🙏…  Twitt…              274 <NA>             <NA>            
    ##  2 142777729148… 15341424… 2022-06-07 11:57:12 Yosoy20212  "🙏…  Twitt…              274 <NA>             <NA>            
    ##  3 142777729148… 15341419… 2022-06-07 11:55:08 Yosoy20212  "🙏…  Twitt…              274 <NA>             <NA>            
    ##  4 142777729148… 15341398… 2022-06-07 11:46:47 Yosoy20212  "🙏…  Twitt…              274 <NA>             <NA>            
    ##  5 142777729148… 15341396… 2022-06-07 11:46:01 Yosoy20212  "🙏…  Twitt…              274 <NA>             <NA>            
    ##  6 142777729148… 15341395… 2022-06-07 11:45:44 Yosoy20212  "🙏…  Twitt…              274 <NA>             <NA>            
    ##  7 142777729148… 15341392… 2022-06-07 11:44:43 Yosoy20212  "🙏…  Twitt…              274 <NA>             <NA>            
    ##  8 142777729148… 15341391… 2022-06-07 11:44:05 Yosoy20212  "🙏…  Twitt…              274 <NA>             <NA>            
    ##  9 142777729148… 15341390… 2022-06-07 11:43:35 Yosoy20212  "🙏…  Twitt…              274 <NA>             <NA>            
    ## 10 142777729148… 15341376… 2022-06-07 11:38:09 Yosoy20212  "🙏…  Twitt…              274 <NA>             <NA>            
    ## # … with 34 more rows, and 81 more variables: reply_to_screen_name <chr>, is_quote <lgl>, is_retweet <lgl>,
    ## #   favorite_count <int>, retweet_count <int>, quote_count <int>, reply_count <int>, hashtags <list>, symbols <list>,
    ## #   urls_url <list>, urls_t.co <list>, urls_expanded_url <list>, media_url <list>, media_t.co <list>,
    ## #   media_expanded_url <list>, media_type <list>, ext_media_url <list>, ext_media_t.co <list>,
    ## #   ext_media_expanded_url <list>, ext_media_type <chr>, mentions_user_id <list>, mentions_screen_name <list>,
    ## #   lang <chr>, quoted_status_id <chr>, quoted_text <chr>, quoted_created_at <dttm>, quoted_source <chr>,
    ## #   quoted_favorite_count <int>, quoted_retweet_count <int>, quoted_user_id <chr>, quoted_screen_name <chr>, …

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

    ## # A tibble: 248 × 2
    ##    palabra       n
    ##    <chr>     <int>
    ##  1 https        76
    ##  2 t.co         76
    ##  3 bitcoin      44
    ##  4 bolivia      44
    ##  5 chile        35
    ##  6 colombia     35
    ##  7 ecuador      35
    ##  8 argentina    34
    ##  9 méxico       34
    ## 10 te           34
    ## # … with 238 more rows
