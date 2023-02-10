###  thursday 2023-02-09
library(palmerpenguins)
library(tidyverse)
library(here)
library(tidyverse)
library(here)
ggplot(data=penguins,
       mapping = aes(x = bill_depth_mm,
                     y = bill_length_mm,
                     group = species,
                    color = species)) +
geom_point()+
  geom_smooth(method = "lm")+
 labs(x = "bill depth (mm)",
       y = "bill length (mm)") +
scale_color_viridis_d() +
scale_x_continuous(limits = c(0,20)) +
scale_y_continuous(limits = c(0,50)) +
theme_bw() +
  theme(axis.title = element_text(size=20,
                                  color = "red"
ggsave(here("Week_03","output","Week_03/output/penguin.png"),
       width = 7, height = 5)
  
      