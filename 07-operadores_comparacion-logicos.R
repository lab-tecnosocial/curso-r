# Operadores de comparación
# < menor que
# > mayor que
# <= menor o igual que
# >= mayor o igual que
# == igual
# = o <- asignacion 
# != no igual
mi_vector <- 1:100
mi_vector + 1
mi_vector > 50

# Operados de lógica
# & AND -> solo devuelve verdadero si ambos verdaderos
# | OR -> devuelve falso cuando los dos son falsos
# ! NOT -> cambiar el valor
tengo_suerte <- TRUE
me_bane <- FALSE

tengo_suerte & me_bane
tengo_suerte | me_bane
tengo_suerte & !me_bane

# comparaciones compuestas
mi_vector >= 10 & mi_vector <= 20
mi_vector == 10 | mi_vector == 20

# filtrar
mi_vector_numerico <- seq(1, 20, 2)
mi_vector_logico <- c(T, T, T, F, F, F, F, F, F, F)
mi_vector_numerico[1]
mi_vector_numerico[mi_vector_logico]
mi_vector_numerico[mi_vector_numerico > 10] # Python


# Data frame
estudiantes <- c("Abigail", "Dario", "Nicaela", "Javier", "Vicente")
notas <- c(30, 60, 61, 20, 10)
tabla <- data.frame(estudiantes, notas)
tabla$aprobacion <- tabla$notas > 50
