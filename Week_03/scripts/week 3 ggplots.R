### ggplots ###
### week 3 ###

library(palmerpenguins)

glimpse(penguins)

ggplot(data = penguins, 
       mapping = aes(x = bill_depth_mm,
                     y = bill_length_mm,
                     color = species, 
                     size = body_mass_g,
                     alpha = flipper_length_mm, # this makes it transparent
  shape = island)) +
geom_point()+        
labs(title = "bill depth and length",
subtitle = "dimensions for adelie, chinstrap and gentoo penguins",
x = "bill depth (mm)", y = "bill length",
color = "species",
caption = "source: palmer station",
alpha = "Flipper legth( mm)") +
scale_color_viridis_d()
ggplot(penguins,
       aes(x = bill_depth_mm,
        y = bill_length_mm))+
  geom_point()+
  facet_grid(sex~species)

