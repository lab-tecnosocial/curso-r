# instalar tidyverse
install.packages("tidyverse")

# cargar tydiverse
library(tidyverse)

# cargar
data <- read_csv("data/gapminder.csv")

# Verbos de manipulación: filter(), arrange(), mutate() -----

# Filtrar filter()
data %>%
  filter(country == "Bolivia", lifeExp < 50)

# Ordenar: arrange() (menor a mayor); mayor a menor desc()
data %>%
  filter(country == "Bolivia", lifeExp < 50) %>%
  arrange(desc(gdpPercap))

# Mutar (crear nuevas variables o cambiarlas): mutate()
## seleecionado solo bolivia y le pasado a la variable bolivia
bolivia <- data %>%
  filter(country == "Bolivia")

bolivia <- bolivia %>%
  mutate(lifeExpMes = lifeExp * 12) %>%
  mutate(popMillon = pop / 1000000)

# Con Peru
data_peru <- data %>%
  filter(country == "Peru")
