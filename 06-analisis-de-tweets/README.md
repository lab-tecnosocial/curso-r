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

    ## ── Attaching packages ─────────────────────────────────────── tidyverse 1.3.1 ──

    ## ✓ ggplot2 3.3.3     ✓ purrr   0.3.4
    ## ✓ tibble  3.1.6     ✓ dplyr   1.0.8
    ## ✓ tidyr   1.2.0     ✓ stringr 1.4.0
    ## ✓ readr   1.4.0     ✓ forcats 0.5.1

    ## ── Conflicts ────────────────────────────────────────── tidyverse_conflicts() ──
    ## x dplyr::filter()  masks stats::filter()
    ## x purrr::flatten() masks rtweet::flatten()
    ## x dplyr::lag()     masks stats::lag()

## Buscar

``` r
palabras_clave = "bitcoin bolivia"
tweets <- search_tweets(q = palabras_clave, n = 100, include_rts = F)
tweets
```

    ## # A tibble: 8 × 90
    ##   user_id             status_id     created_at          screen_name text  source
    ##   <chr>               <chr>         <dttm>              <chr>       <chr> <chr> 
    ## 1 2300299530          153289702521… 2022-06-04 01:28:25 DiarioBitc… "Tod… wp_tw…
    ## 2 1389314717403975685 153270262245… 2022-06-03 12:35:56 BBirchKwan  "Pro… Twitt…
    ## 3 139654083           153164456256… 2022-05-31 14:31:34 claravega   "¿Có… Tweet…
    ## 4 3156511997          153128932719… 2022-05-30 15:00:00 CriptoNoti… "Si … Twitt…
    ## 5 1416223413052530696 153106336259… 2022-05-30 00:02:06 cardanobol… "Hey… Twitt…
    ## 6 1300897710623674368 153022712430… 2022-05-27 16:39:11 FunkyHedge  "@M_… Twitt…
    ## 7 1067977088236314626 152988615353… 2022-05-26 18:04:17 Serenitybf… "Air… Twitt…
    ## 8 1006619703408840704 152988606634… 2022-05-26 18:03:56 SergioAmat… "Air… Twitt…
    ## # … with 84 more variables: display_text_width <dbl>, reply_to_status_id <chr>,
    ## #   reply_to_user_id <chr>, reply_to_screen_name <chr>, is_quote <lgl>,
    ## #   is_retweet <lgl>, favorite_count <int>, retweet_count <int>,
    ## #   quote_count <int>, reply_count <int>, hashtags <list>, symbols <list>,
    ## #   urls_url <list>, urls_t.co <list>, urls_expanded_url <list>,
    ## #   media_url <list>, media_t.co <list>, media_expanded_url <list>,
    ## #   media_type <list>, ext_media_url <list>, ext_media_t.co <list>, …

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

    ## # A tibble: 111 × 2
    ##    palabra     n
    ##    <chr>   <int>
    ##  1 bolivia     8
    ##  2 https       8
    ##  3 t.co        8
    ##  4 bitcoin     6
    ##  5 que         5
    ##  6 00          4
    ##  7 airbnb      4
    ##  8 el          3
    ##  9 en          3
    ## 10 es          3
    ## # … with 101 more rows
