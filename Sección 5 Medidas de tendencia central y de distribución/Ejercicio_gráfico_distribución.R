library(ggplot2)
library(plotrix)
library(stats)
library(gapminder)
library(tidyverse)

data("gapminder")

######################################################################################################################
########################### HISTOGRAMA ################################################################################


hist(gapminder$lifeExp, main = "Expectativa de vida", 
     xlab = "Expectativa",
     ylab = "Frecuencia",
)

hist(gapminder$lifeExp, main = "Expectativa de vida", 
     xlab = "Expectativa",
     ylab = "Frecuencia",
     breaks = 20 # número de columnas
)

# HISTOGRAMA SUGERIDO POR LA IA: OPCIÓN 1
mean_lifeExp <- mean(gapminder$lifeExp)

ggplot(gapminder, aes(x = lifeExp)) +
  geom_histogram(binwidth = 2, fill = "#2E86AB", color = "white", 
                 alpha = 0.8, linewidth = 0.3) +
  geom_density(aes(y = after_stat(count) * 2), color = "#A23B72", 
               linewidth = 1.2, alpha = 0.7) +
  geom_vline(xintercept = mean_lifeExp, color = "red", 
             linetype = "dashed", linewidth = 1) +
  labs(title = "Distribución de la Expectativa de Vida Mundial",
       subtitle = "Datos del dataset Gapminder (1952-2007)",
       x = "Expectativa de Vida (años)",
       y = "Frecuencia",
       caption = "Fuente: Elaboración propia en base a datos de Gapminder") +
  theme_minimal() +
  theme(
    plot.title = element_text(face = "bold", size = 16, hjust = 0.5),
    plot.subtitle = element_text(size = 12, color = "gray40", hjust = 0.5),
    axis.title = element_text(face = "bold", size = 12),
    axis.text = element_text(size = 10),
    panel.grid.major = element_line(color = "gray90", linewidth = 0.2),
    panel.grid.minor = element_blank(),
    plot.background = element_rect(fill = "white", color = NA),
    plot.margin = margin(20, 20, 20, 20)
  ) +
  scale_x_continuous(breaks = seq(20, 90, by = 10)) +
  annotate("text", x = mean_lifeExp + 2, y = 150, 
           label = paste("Media:", round(mean_lifeExp, 1), "años"),
           color = "red", fontface = "bold")


## OPCIÓN 2
# Calcular estadísticas
mean_lifeExp <- mean(gapminder$lifeExp)
median_lifeExp <- median(gapminder$lifeExp)

ggplot(gapminder, aes(x = lifeExp)) +
  geom_histogram(aes(y = after_stat(density)), 
                 binwidth = 2.5, 
                 fill = "#2E86AB", 
                 color = "white", 
                 alpha = 0.8, 
                 linewidth = 0.3) +
  geom_density(color = "#A23B72", 
               linewidth = 1.2, 
               alpha = 0.7,
               adjust = 1.5) +  # Suavizado de la curva
  geom_vline(xintercept = mean_lifeExp, 
             color = "red", 
             linetype = "dashed", 
             linewidth = 1,
             alpha = 0.8) +
  geom_vline(xintercept = median_lifeExp, 
             color = "darkgreen", 
             linetype = "dashed", 
             linewidth = 1,
             alpha = 0.8) +
  labs(title = "Distribución de la Expectativa de Vida Mundial",
       subtitle = "Análisis de datos demográficos globales (1952-2007)",
       x = "Expectativa de Vida (años)",
       y = "Densidad de Probabilidad",
       caption = "Fuente: Gapminder Foundation | Elaboración propia") +
  theme_minimal() +
  theme(
    plot.title = element_text(face = "bold", size = 16, hjust = 0.5, 
                              margin = margin(b = 10)),
    plot.subtitle = element_text(size = 12, color = "gray40", hjust = 0.5,
                                 margin = margin(b = 15)),
    axis.title = element_text(face = "bold", size = 12),
    axis.text = element_text(size = 10),
    panel.grid.major = element_line(color = "gray90", linewidth = 0.2),
    panel.grid.minor = element_blank(),
    plot.background = element_rect(fill = "white", color = NA),
    plot.margin = margin(20, 20, 20, 20),
    legend.position = "top"
  ) +
  scale_x_continuous(breaks = seq(20, 90, by = 5)) +
  annotate("text", x = mean_lifeExp + 3, y = 0.035, 
           label = paste("Media:", round(mean_lifeExp, 1), "años"),
           color = "red", fontface = "bold", size = 3.5) +
  annotate("text", x = median_lifeExp - 3, y = 0.035, 
           label = paste("Mediana:", round(median_lifeExp, 1), "años"),
           color = "darkgreen", fontface = "bold", size = 3.5) +
  annotate("label", x = 25, y = 0.04, 
           label = paste("n =", format(nrow(gapminder), big.mark = ","), "observaciones"),
           fill = "lightgray", alpha = 0.7, size = 3)

######################################################################################################################
########################### GRÁFICO DE CAJA ################################################################################

boxplot(gapminder$lifeExp, main = "Expectativa de vida", 
        xlab = "Expectativa",
        ylab = "Frecuencia" )
