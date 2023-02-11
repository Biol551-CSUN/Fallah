## Today we are going to plot penguin data ####
### Created by: Roshan Fallah #############
### Updated on: 2023-09-10 ####################

#load libraries#
library(palmerpenguins)
library(tidyverse)
library(here)

###load data###
glimpse(penguins)

ggplot(data=penguins,
       mapping = aes(x = bill_depth_mm,
                    y = bill_length_mm,
  group = species,
  color = species))+
geom_point()+
geom_smooth(method = "lm")+
    labs(x = "Bill depth (mm)",
       y = "Bill length (mm)"
       )+


scale_color_manual(values = beyonce_palette(6))+
  #scale_color_viridis_d()+
  scale_x_continuous(breaks = c(14, 17, 21), 
                     labels = c("low", "medium", "high"))+
  theme_linedraw()+
  theme(axis.title = element_text(size = 20,
                                  color = "red"),
  panel.background = element_rect(fill = "linen"))

#coord_polar("x")
#install.packages('devtools')
#devtools::install_github("an-bui/calecopal")
#library(calecopal)
#devtools::install_github("dill/beyonce")
#library(beyonce) 
###


ggplot(diamonds, aes(carat, price)) + 
  geom_point() +
  coord_trans(x = "log10", y = "log10")

ggsave(here("Week_03", "output", "penguin.png"),
width = 7, height = 5)

