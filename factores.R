# de vector a factor (variable categorica)
sexo_caracter <- c("Hombre", "Mujer", "Hombre")
sexo_factor <- factor(sexo) # nominal
summary(sexo_factor)

rendimiento_caracter <- c("Bajo", "Medio", "Medio")
rend_factor <- factor(rendimiento, order = TRUE, levels = c("Bajo", "Medio", "Alto")) # ordinal
summary(rend_factor)

# no es factor o categorico
gusto_escuela <- c("Pues no me parece tan bien..", "algo jejeje", "como q si")

