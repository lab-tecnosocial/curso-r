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
  sqrt(sum((x - mean(x)) ^ 2) / (length(x) - 1))
}

desv_estandar2 <- function(x){
  media <- mean(x)
  n <- length(x) 
  resta <- x - media
  cuadrado <- resta ^ 2
  suma <- sum(cuadrado)
  div <- suma / (n - 1)
  resultado <- sqrt(suma)
  return(resultado)
}

