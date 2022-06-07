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

    ## ── Attaching packages ───────────────────────────────────────────────────────────────────────────────────────────────────────── tidyverse 1.3.1 ──

    ## ✓ ggplot2 3.3.3     ✓ purrr   0.3.4
    ## ✓ tibble  3.1.6     ✓ dplyr   1.0.8
    ## ✓ tidyr   1.2.0     ✓ forcats 0.5.1
    ## ✓ readr   1.4.0

    ## ── Conflicts ──────────────────────────────────────────────────────────────────────────────────────────────────────────── tidyverse_conflicts() ──
    ## x dplyr::filter()  masks stats::filter()
    ## x purrr::flatten() masks rtweet::flatten()
    ## x dplyr::lag()     masks stats::lag()

## Buscar

``` r
palabras_clave = "bitcoin bolivia"
tweets <- search_tweets(q = palabras_clave, n = 100, include_rts = F)
tweets
```

    ## # A tibble: 44 × 90
    ##    user_id     status_id created_at          screen_name text  source display_text_wi… reply_to_status… reply_to_user_id reply_to_screen… is_quote
    ##    <chr>       <chr>     <dttm>              <chr>       <chr> <chr>             <dbl> <chr>            <chr>            <chr>            <lgl>   
    ##  1 1427777291… 15341425… 2022-06-07 11:57:48 Yosoy20212  "🙏…  Twitt…              274 <NA>             <NA>             <NA>             TRUE    
    ##  2 1427777291… 15341424… 2022-06-07 11:57:12 Yosoy20212  "🙏…  Twitt…              274 <NA>             <NA>             <NA>             TRUE    
    ##  3 1427777291… 15341419… 2022-06-07 11:55:08 Yosoy20212  "🙏…  Twitt…              274 <NA>             <NA>             <NA>             TRUE    
    ##  4 1427777291… 15341398… 2022-06-07 11:46:47 Yosoy20212  "🙏…  Twitt…              274 <NA>             <NA>             <NA>             TRUE    
    ##  5 1427777291… 15341396… 2022-06-07 11:46:01 Yosoy20212  "🙏…  Twitt…              274 <NA>             <NA>             <NA>             TRUE    
    ##  6 1427777291… 15341395… 2022-06-07 11:45:44 Yosoy20212  "🙏…  Twitt…              274 <NA>             <NA>             <NA>             TRUE    
    ##  7 1427777291… 15341392… 2022-06-07 11:44:43 Yosoy20212  "🙏…  Twitt…              274 <NA>             <NA>             <NA>             TRUE    
    ##  8 1427777291… 15341391… 2022-06-07 11:44:05 Yosoy20212  "🙏…  Twitt…              274 <NA>             <NA>             <NA>             TRUE    
    ##  9 1427777291… 15341390… 2022-06-07 11:43:35 Yosoy20212  "🙏…  Twitt…              274 <NA>             <NA>             <NA>             TRUE    
    ## 10 1427777291… 15341376… 2022-06-07 11:38:09 Yosoy20212  "🙏…  Twitt…              274 <NA>             <NA>             <NA>             TRUE    
    ## # … with 34 more rows, and 79 more variables: is_retweet <lgl>, favorite_count <int>, retweet_count <int>, quote_count <int>, reply_count <int>,
    ## #   hashtags <list>, symbols <list>, urls_url <list>, urls_t.co <list>, urls_expanded_url <list>, media_url <list>, media_t.co <list>,
    ## #   media_expanded_url <list>, media_type <list>, ext_media_url <list>, ext_media_t.co <list>, ext_media_expanded_url <list>,
    ## #   ext_media_type <chr>, mentions_user_id <list>, mentions_screen_name <list>, lang <chr>, quoted_status_id <chr>, quoted_text <chr>,
    ## #   quoted_created_at <dttm>, quoted_source <chr>, quoted_favorite_count <int>, quoted_retweet_count <int>, quoted_user_id <chr>,
    ## #   quoted_screen_name <chr>, quoted_name <chr>, quoted_followers_count <int>, quoted_friends_count <int>, quoted_statuses_count <int>,
    ## #   quoted_location <chr>, quoted_description <chr>, quoted_verified <lgl>, retweet_status_id <chr>, retweet_text <chr>, …

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
