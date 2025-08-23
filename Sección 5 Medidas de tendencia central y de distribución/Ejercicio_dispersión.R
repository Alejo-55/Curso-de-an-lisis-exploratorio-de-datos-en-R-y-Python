library(tidyverse)
library(gapminder)
options(scipen = 999)

data("gapminder")

# Desviación estándar
sd(gapminder$pop)

# Varianza
var(gapminder$lifeExp)
