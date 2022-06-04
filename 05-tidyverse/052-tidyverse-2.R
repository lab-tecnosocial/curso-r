library(tidyverse)
data <- read_csv("data/gapminder.csv")

# Contar: count()
data %>% count(continent)
data %>% count(year)

# Resumir (colapsar el vector columna en un solo valor): summarize()
data %>%
  filter(year == 1952) %>%
  summarize(mediana_esp_vida = median(lifeExp), media_pib = mean(gdpPercap))

data %>%
  filter(year == 2007) %>%
  summarize(media_esp_vida = median(lifeExp))

# Agrupar (para comparar): group_by()
grupos <- data %>%
  group_by(year, continent) %>%
  summarize(mediana_esp = median(lifeExp))

# Visualizaciones con ggplot()

# Graficos de lineas: geom_line()
grupos %>%
  ggplot(aes(x = year, y = mediana_esp, color = continent)) +
  geom_line()

# Graficos de barras: geom_bar() y geom_col()
americas <- data %>%
  filter(continent == "Americas")

americas %>%
  filter(gdpPercap > 10000) %>%
  ggplot(aes(x = country, y = gdpPercap)) +
  geom_col()

# Histogramas con geom_histogram()
data_1952 <- data %>%
  filter(year == 1952)
 
data_1952 %>%
  ggplot(aes(pop)) +
  geom_histogram(bins = 100) +
  scale_x_log10()

# Diagrama con geom_boxplot()
data_1952 %>%
  ggplot(aes(x = continent, y = gdpPercap)) +
  geom_boxplot() +
  scale_y_log10()

# Facetados o matrices de gráficos
data %>%
  ggplot(aes(x = gdpPercap, y = lifeExp, color = continent, size = pop)) +
  geom_point() +
  scale_x_log10() +
  facet_wrap(~year)
