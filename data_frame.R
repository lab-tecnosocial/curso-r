# definir varios vectores
edad <- c(24, 22, 18)
sexo_factor <- factor(sexo)
sexo_caracter <- c("Hombre", "Mujer", "Hombre")
gusto_universidad <- c("Pues no me parece tan bien..", "algo jejeje", "como q si")

# crear data frame
tabla <- data.frame(edad, sexo_factor, gusto_universidad)

# algunas operaciones sobre columnas
mean(tabla$edad)
summary(tabla$sexo_factor)
print(tabla$gusto_universidad)

# cargar un data frame
gap <- read.csv("gapminder.csv")

# Ejercicio ---
# crear un data frame con 5 casos 
# y que tengan al menos 5 variables (dos numericas, dos factores, uno de caracter)

desv_tipica <- function(x){
  media <- mean(x)
  n <- length(x)
  varianza <- sum((x - media) ^ 2)
  sqrt(varianza / (n - 1))
}
