## Today we are going to plot penguin data ####
### Created by: Roshan Fallah #############
### Updated on: 2022-02-14 ####################

#### Load Libraries ######
library(palmerpenguins)
library(tidyverse)
library(here)
### Load data ######
# The data is part of the package and is called penguins
glimpse(penguins)
head(penguins)

filter(.data = penguins, sex == "female", body_mass_g >5000 )
filter(.data = penguins, year == "2008")

filter(.data = penguins, year == 2008 | year == 2009)


filter(.data = penguins, island != "Dream" )

filter(.data = penguins, species == "Adelie" |
         species == "Gentoo")

data2<-mutate(.data = penguins,
              body_mass_kg = body_mass_g/1000)  ##body mass in kg###
view(data2)       

data2<-mutate(.data = penguins, 
              body_mass_kg = body_mass_g/1000,
              bill_length_depth = bill_length_mm/bill_depth_mm)
view(data2)

data2<- mutate(.data = penguins,
               flipper_BM = body_mass_g + flipper_length_mm)
view(data2)
data2<- mutate(.data = penguins,
               eggs = ifelse(body_mass_g>4000, "big", "small")) 
view(data2)


penguins %>% # use penguin dataframe
  filter(sex == "female") %>% #select females
  mutate(log_mass = log(body_mass_g)) %>% #calculate log biomass
  select(species, island, sex, log_mass) 


penguins %>%
summarise(mean_flipper = mean(flipper_length_mm, na.rm=TRUE))


penguins %>%
  group_by(island) %>%
summarise(mean_bill_length = mean(bill_length_mm, na.rm= TRUE),
          max_bill_length = max(bill_length_mm, na.rm=TRUE))  


penguins %>%
  drop_na(sex)

penguins
drop_na(sex) %>%   ####pipe penguins for data####
  ggplot(aes(x = sex, y = flipper_length_mm)) +
  geom_boxplot()

###### HOMEWORK PART 1 & PART 2 ######

Part_1 <- penguins %>%
  drop_na()%>%
  group_by(species, island, sex)%>%
  summarize(mean_body_mass_g = mean(body_mass_g, na.rm = TRUE),
  varience_body_mass_g = var(body_mass_g, na.rm = TRUE))
  
view(Part_1)

#### PART 2 ####

Part_2 <- penguins %>%
  filter(sex == "male") %>% 
  mutate(log_mass = log(body_mass_g)) %>% #calculate log biomass
  select(species, island, sex, log_mass) %>%

ggplot(data= Part_2,
  mapping = aes(x=species,
                y = log_mass))+
  geom_boxplot()+
    labs(x ="species",
         y = "log_mass")+
  scale_color_manual_d("blue", "orange","pink")

Part_2  
  
ggsave(here("Week_04", "output", "homework_part2.png"))

