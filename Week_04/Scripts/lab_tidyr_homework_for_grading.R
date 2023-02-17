### This is my lab homework week 4 Thursday ####
### Created by: Roshan Fallah #############
### Updated on: 2023-02-16 ####################

library(tidyverse)  ## loading libraries ##
library(here)

ChemData<-read_csv(here("Week_04","Data", "chemicaldata_maunalua.csv"))
View(ChemData)
glimpse(ChemData)

tidyr<- ChemData %>% 
  separate(col = Tide_time, # choose the tide time col
         into = c("Tide","Time"), #Separating into two columns for Tide and time
         sep = "_")%>% # separate by _
  filter(complete.cases(.)) %>%
  filter(Season == "SPRING") %>%
  select(Zone, pH, Temp_in, Phosphate) %>%
  pivot_longer(cols = Zone, # the cols you want to pivot.   
  names_to = "Variables", # the names of the new cols with all the column names 
  values_to = "Values") %>%
  group_by(Variables)
  #summarise(mean_vals = mean(Values, na.rm = TRUE)) ## calculating mean 
view(tidyr)
ggplot(data = tidyr,
       mapping = aes(x = Values,
                     y = pH,
                     group = Values,
                     color = Values))+
                     
geom_point()+ ###adding points to plot###
labs(x = "Zone",
        y = "pH")+
theme_linedraw()+
theme(axis.title = element_text(size = 20,
                                color = "red"),
panel.background = element_rect(fill = "linen")) ## doesnt make it super clear but looks okish I guess ##


ggsave(here("Week_04", "Output", "lab_tidyr_homework_for_grading.png"),
width = 7, height = 5)
  