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
  select(Season, Tide, Time, Salinity, pH) %>%
  pivot_longer(cols = Salinity:pH, # the cols you want to pivot. This says select the temp to percent SGD cols  
                               names_to = "Variables", # the names of the new cols with all the column names 
                               values_to = "Values") %>%
  group_by(Variables, Season, Time) %>%
  summarise(mean_vals = mean(Values, na.rm = TRUE)) ## calculating mean  and removing NA's for the calc values to not mess up ##

ggplot(data = tidyr,
       mapping = aes(x = Time,
                     y = mean_vals,
                     group = Variables,
                     color = Variables))+
  geom_point()+
  labs(x = "Time",
       y = "Salinity pH")

ggsave(here("Week_04", "Output", "lab_tidyr_homework_for_grading.png"))
          
  