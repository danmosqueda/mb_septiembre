# Gráfica de tarifa explícita e exportaciones
# 03/sep/20
# Daniel Mosqueda

#### Carga de librerías ####

library(tidyverse)
library(readxl)

#### Carga de datos ####

piechart_raw <- read_excel("input_piechart.xlsx")

input_ensamblaje_mex <- read_excel("input ensamblaje mex.xlsx") %>% 
  rename(Marca = Makes, Modelo = Carlines) %>% 
  select(!Manufacturer) %>% 
  select(!Marca)

piechart <- piechart_raw%>% 
  select(Año, Marca, `País destino`, Cantidad) %>% 
  filter(`País destino` == "Estados Unidos") %>% 
  filter(Año == "2019") %>% 
  replace(is.na(.), 0) %>% 
  group_by(Marca) %>% 
  summarise(Cantidad = sum(Cantidad))

write.csv(piechart, "datos de 2019 de exportación de vehículos a estados unidos.csv")


ligeros <- piechart_raw%>% 
  select(Año, Marca, `País destino`, Cantidad, Segmento) %>% 
  filter(`País destino` == "Estados Unidos") %>% 
  filter(Año == "2019") %>% 
  replace(is.na(.), 0) %>% 
  group_by(Segmento) %>% 
  summarise(Cantidad = sum(Cantidad))

write.csv(ligeros, "datos de 2019 de coches ligeros y pickups.csv")


#### 

contenido_regional <- piechart_raw%>% 
  select(Año, Marca, Modelo, `País destino`, Cantidad, Segmento) %>% 
  filter(`País destino` == "Estados Unidos") %>% 
  filter(Año == "2019") %>% 
  left_join(input_ensamblaje_mex) %>% 
  filter(Cumplimiento_contenido == 1) %>% 
  summarise( exp_cont = sum(Cantidad))
