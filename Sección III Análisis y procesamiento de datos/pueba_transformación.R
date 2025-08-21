library(gapminder)
library(tidyverse)

# Abrir la base de datos, solo en caso de no tenerla abierta, con el comando
# data()

# Verificanco que se haya cargado correctamente la base
tail(gapminder)

# Tomar solo una variable
paises <- gapminder["country"]
tail(paises)

# Escoger filas específicas

filas_nuevas <- gapminder[1:88, c(1:6)]
filas_nuevas
# Se le pidió a R tomar las filas desde la 1 hasta la 88, los argumentos dentro 
# del parésntesis indocan (filas, columnas). Los datos son de todas las variables.

# Tomando filas de un a sola variable
filas_variable <- gapminder[1:88,2] # Se le indica a R tomar todas las filas de la columna 2.
filas_variable

# Ordenando datos por variable numérica
ordenados_1 <- gapminder[order(gapminder$pop),]
ordenados_2 <- gapminder[order(gapminder$country),] 


# Agrupamiento de datos

gapminder <- gapminder %>%
  group_by(gapminder$country) %>%
  summarize(min_size = min(year,na.rm = TRUE))
