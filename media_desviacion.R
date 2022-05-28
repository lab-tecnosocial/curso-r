# ejercicio media (paso por paso)
mi_media <- function(x) {
  suma <- sum(x)
  n <- length(x)
  return(suma / n)
}

mi_media2 <- function(num){
  abs(sum(x) / length(x))
}


# ejercicio desviacion estandar
desv_estandar <- function(x){
  sqrt(sum((x - mean(x)) ^ 2))
}

numeros <- c(10, 20, 30)

desv_estandar2 <- function(x){
  media <- mean(x)
  resta <- x - media
  cuadrado <- x ^ 2
  suma <- sum(cuadrado)
  resultado <- sqrt(suma)
  return(resultado)
}

nombre <- "Alex"
apellido <- "Ojeda"
x <- "X"

# resultado final "Alex Ojeda X"
res <- paste(nombre, apellido) # Alex Ojeda
res2 <- paste(res, x)
# otra forma
str_to_upper(paste(paste(nombre, apellido), x))
# con tuberias
paste(nombre, apellido) %>%
  paste(x) %>%
  str_to_upper()
