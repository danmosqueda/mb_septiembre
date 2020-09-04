# Gráfica de tarifa explícita e exportaciones
# 03/sep/20
# Daniel Mosqueda

#### Carga de librerías ####

library(tidyverse)
library(readxl)

#### Carga de datos ####

piechart_raw <- read_excel("input_piechart.xlsx") 


piechart <- piechart_raw%>% 
  select(Año, Marca, `País destino`, Cantidad) %>% 
  filter(`País destino` == "Estados Unidos") %>% 
  filter(Año == "2019") %>% 
  replace(is.na(.), 0) %>% 
  group_by(Marca) %>% 
  summarise(Cantidad = sum(Cantidad))
