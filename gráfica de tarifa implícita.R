# Gráfica de tarifa explícita e exportaciones
# 02/sep/20
# Daniel Mosqueda

#### Carga de librerías ####


library(tidyverse)
library(extrafont)
library(scales)
library(ggplot2)
library(readxl)

#### Carga de datos ####

data_raw  <- read_excel("input_graf_ JSP.xlsx") %>% 
  mutate(EXP_NPT = EXP_NPT/1000000)

graf <- data_raw %>% 
  ggplot(aes(x = EXP_NPT, y =  ARANCEL, color = DECADA)) +
  geom_jitter(size = 3)+
  geom_smooth(se = FALSE, linetype = "dashed", color = "red", size = 1.1) +
  theme( axis.title.y = element_blank(),axis.title.x = element_blank(), 
         legend.title=element_blank(),panel.background = element_blank(),
         axis.text = element_text(size = 10, color = "#000f1c", face = "bold", family = 'Century Gothic'),
         legend.text = element_text(size = 10, color = "#000f1c", face = "bold", family = 'Century Gothic'),
         text = element_text(size = 10, color = "#000f1c", face = "bold", family = 'Century Gothic'),
         axis.text.x = element_text(angle = 360, vjust = 0.5, hjust=1)) +
   scale_y_continuous(labels = function(x) paste0(x*100, "%")) +
  scale_x_continuous(labels = comma)
