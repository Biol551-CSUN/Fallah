##today I will be creating maps

install.packages(c("maps", "mapproj", "mapdata"))

#load libraries

library(tidyverse)
library(here)
library(maps)
library(mapdata)
library(mapproj)

popdata<-read_csv(here("Week_07","Data","CApopdata.csv"))
stars<-read_csv(here("Week_07","data","stars.csv"))

world<-map_data("world")  #get data for entire world
head(world)


usa<-map_data("usa")
view(usa)

italy<-map_data("italy")
        
head(italy)      

states<-map_data("state")
head(states)

counties<-map_data("county")
head(counties)

ggplot()+
  geom_polygon(data = world, aes(x = long, y = lat, group = group,
                                 fill = region),
                                 color = "black") +
  guides(fill = FALSE)+
  theme_minimal()+
  theme(panel.background = element_rect(fill = "lightblue"))+
  coord_map(projection = "sinusoidal",
            xlim = c(-180,180))

head(states)
CA_data<-states %>%
filter(region == "california")

view(CA_data)

ggplot()+
  geom_polygon(data = CApop_county, aes(x = long, y = lat, group = group,
                                   fill = Population),
               color = "yellow")+
  geom_point(data = stars, # add a point at all my sites 
             aes(x = long, 
                 y = lat,
                 size = star_no))+
    coord_map()+
    theme_void()+
    scale_fill_gradient(trans = "log10")+
    labs(size = "# stars/m2")

CApop_county<-popdata %>%
  select("subregion" = County, Population) %>%
  inner_join(counties) %>%
  filter(region == "california")

head(CApop_county)
view(CApop_county)
