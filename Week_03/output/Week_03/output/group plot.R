library(palmerpenguins)
library(tidyverse)
library(here)
library(tidyverse)
library(here)
library(palmerpenguins)
######################
p2
glimpse(penguins)
gglabplot <- ggplot() + 
  geom_point(data = penguins, aes(x = year, fill = species, y = bill_length_mm)) + 
facet_grid(rows = bill_length_mm, ) +
labs(y= "body mass", x = "length of bill")
gglabplot


ggsave(here("Week_03","output","groupplot.png"))
glimpse(penguins)
p2
ggplot(data=penguins,
  mapping = aes(x = bill_length_mm,
            y = bill_depth_mm,
            group = species,
            color = species)) +
geom_point()+
  geom_smooth(method = "lm")+
  labs(x = "bill depth (mm)",
       y = "bill length (mm)")+
  scale_color_viridis_d()+
  scale_color_continuous(limits = c(0, 20))
p2
  
glimpse(penguins)
ggplot(data = penguins,
mapping = aes(x = bill_length_mm,
              y = bill_depth_mm))
geom_point()+
labs(x = "Bill length (mm),
     y = bill depth (mm)")
p1
