install.packages("gapminder") # Librería que trae consigo distintos tipos de datos e indicadores
# de todos los países del mundo.
library(gapminder)
data("gapminder") # Crea una data en base al paquete que contiene la información.
head(gapminder)
tail(gapminder)

# Exportar datos
library(writexl)
write_xlsx(gapminder, "C:/Users/sevil/Desktop/Otros documentos/Cursos/Análisis exploratorio de datos con Python y R/Sección 3 Análisis y procesamiento de datos/R/gapminder.xlsx")

##########################################################################################################################################################################################################
# Segunda parte de la prueba
 # Revisión de los datos

View(gapminder)
head(gapminder)
distinct(gapminder) # Muestra información sobre los datos
str(gapminder) # Ver estructura general de los datos
min(gapminder$lifeExp)

pop_2022 <- gapminder %>%
  filter(country == "Colombia" & year == "2002")
print(pop_2022)

unique(gapminder$country)
