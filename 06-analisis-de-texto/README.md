
# Análisis de texto

# Análisis de texto

En esta lección aplicaremos todo lo aprendido para hacer un análisis
básico de texto con datos relevantes para Bolivia. Usaremos el paquete
`tidytext`, que aplica la filosofía tidyverse al análisis de texto: cada
fila es un token (una palabra o unidad de análisis).

> **Nota:** Esta lección reemplaza el análisis de tweets de versiones
> anteriores. La API gratuita de Twitter/X fue discontinuada en 2023,
> pero la metodología de análisis de texto es exactamente la misma con
> cualquier fuente de datos textuales.

## Instalación y carga de paquetes

``` r
install.packages("tidytext")
```

``` r
library(tidyverse)
library(tidytext)
```

## Cargar los datos

Trabajaremos con un dataset de titulares de noticias sobre Bolivia.
Tiene tres columnas: `texto` (el titular), `fecha` y `categoria`.

``` r
noticias <- read_csv("noticias-bolivia.csv")
noticias
```

``` r
# Ver cuántas noticias hay por categoría
noticias |>
  count(categoria, sort = TRUE)
```

## Tokenización: separar el texto en palabras

El primer paso del análisis de texto es "tokenizar": dividir cada texto
en unidades individuales (en este caso, palabras). `unnest_tokens()` hace
eso y convierte todo a minúsculas automáticamente:

``` r
palabras <- noticias |>
  unnest_tokens(palabra, texto)

palabras
```

## Contar palabras más frecuentes

``` r
palabras |>
  count(palabra, sort = TRUE)
```

Notamos que las palabras más frecuentes son palabras vacías (*stop
words*): "de", "en", "el", "la", etc. Estas no nos dicen nada sobre los
temas. Necesitamos eliminarlas.

## Eliminar stop words

En español podemos crear nuestro propio vector de palabras vacías:

``` r
stop_words_es <- c(
  "de", "en", "el", "la", "los", "las", "un", "una", "unos", "unas",
  "y", "e", "o", "u", "a", "ante", "bajo", "con", "del", "al",
  "para", "por", "que", "se", "su", "sus", "le", "les", "lo",
  "más", "pero", "si", "ya", "no", "es", "son", "ha", "han",
  "fue", "ser", "como", "entre", "sobre"
)

palabras_limpias <- palabras |>
  filter(!palabra %in% stop_words_es)

palabras_limpias |>
  count(palabra, sort = TRUE) |>
  head(20)
```

## Visualizar las palabras más frecuentes

``` r
palabras_limpias |>
  count(palabra, sort = TRUE) |>
  slice_max(n, n = 15) |>
  ggplot(aes(x = reorder(palabra, n), y = n)) +
  geom_col(fill = "steelblue") +
  coord_flip() +
  labs(
    title = "Palabras más frecuentes en noticias sobre Bolivia",
    x = NULL,
    y = "Frecuencia"
  )
```

## Análisis por categoría

Podemos comparar qué palabras son más frecuentes en cada categoría de
noticias:

``` r
palabras_limpias |>
  count(categoria, palabra, sort = TRUE) |>
  group_by(categoria) |>
  slice_max(n, n = 5) |>
  ggplot(aes(x = reorder(palabra, n), y = n, fill = categoria)) +
  geom_col(show.legend = FALSE) +
  facet_wrap(~categoria, scales = "free_y") +
  coord_flip() +
  labs(
    title = "Palabras más frecuentes por categoría",
    x = NULL,
    y = "Frecuencia"
  )
```

## Análisis temporal: noticias por mes

Combinando `lubridate` con el análisis de texto:

``` r
library(lubridate)

noticias |>
  mutate(mes = month(fecha, label = TRUE)) |>
  count(mes, categoria) |>
  ggplot(aes(x = mes, y = n, fill = categoria)) +
  geom_col(position = "stack") +
  labs(
    title = "Noticias por mes y categoría",
    x = "Mes",
    y = "Número de noticias",
    fill = "Categoría"
  )
```

## Para ir más lejos

Si en el futuro quieres trabajar con texto de internet sin usar APIs,
puedes explorar el paquete `rvest` para extraer texto de páginas web:

``` r
install.packages("rvest")
library(rvest)

# Ejemplo: extraer el texto de una página
pagina <- read_html("https://es.wikipedia.org/wiki/Bolivia")
parrafos <- pagina |>
  html_elements("p") |>
  html_text2()
```

[\<\<
Anterior](https://github.com/lab-tecnosocial/curso-r/tree/main/05-tidyverse)
\| [Siguiente
\>\>](https://github.com/lab-tecnosocial/curso-r/tree/main/07-siguientes-pasos)
