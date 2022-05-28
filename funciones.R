# funcion que recibe un numero cualquiera y lo devuelve triplicado
triplicar <- function(n){
  n * 3
}

# funcion que recibe dos numeros y eleva el primero al segundo
potenciar <- function(base, potencia){
  base ^ potencia
}

# funcion que recibe tu edad y te dice que año naciste
calc_nacimiento <- function(edad){
  anio_actual <- 2022
  anio_nacimiento <- anio_actual - edad
  cat("Naciste el año:", anio_nacimiento)
}

# funcion que calcula tu IMC (indice de masa corporal). Peso en Kg y altura en Metros
imc <- function(peso, altura){
  peso / altura ^ 2
}

imc(87, 1.72) # bien
imc(1.72, 87) # orden incorrecto
imc(peso = 87, altura = 1.72) # orden incorrecto

