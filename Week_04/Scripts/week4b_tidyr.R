### Today we are going to practice tidy with biogeochemistry data from Hawaii ####
### Created by: Roshan Fallah #############
### Updated on: 2023-02-16 ####################


## loading libraries###

library(tidyverse)
library(here)
### Load data ######
ChemData<-read_csv(here("Week_04","Data", "chemicaldata_maunalua.csv"))
View(ChemData)
glimpse(ChemData)

ChemData_clean<-ChemData %>%
filter(complete.cases(.))%>%
separate(col = Tide_time, # choose the tide time col
         into = c("Tide","Time"), # separate it into two columns Tide and time
         sep = "_", # separate by _
  remove = FALSE) %>%
    unite(col = "Site_Zone", # the name of the NEW col
          c(Site,Zone), # the columns to unite
          sep = ".", # lets put a . in the middle
          remove = FALSE)
  
  ChemData_long <- ChemData_clean%>%
  pivot_longer(cols = Temp_in:percent_sgd, # the cols you want to pivot. This says select the temp to percent SGD cols
               names_to = "Variables", # the names of the new cols with all the column names
               values_to = "Values")
  

chemData_long %>%
  group_by(Variables, Site) %>% # group by everything we want 
  summarise(Param_means = mean(Values, na.rm = TRUE), # get mean 
            Param_vars = var(Values, na.rm = TRUE),
            Param_stdv# get variance  


ChemData_long %>%
  ggplot(aes(x = Site, y = Values))+
  geom_boxplot()+
  facet_wrap(~Variables)

ChemData_wide<-ChemData_long %>%
  pivot_wider(names_from = Variables, # column with the names for the new columns
              values_from = Values)


ChemData_clean<-ChemData %>%
  drop_na() %>% #filters out everything that is not a complete row
  separate(col = Tide_time, # choose the tide time col
           into = c("Tide","Time"), # separate it into two columns Tide and time
           sep = "_", # separate by _
           remove = FALSE) %>%
  pivot_longer(cols = Temp_in:percent_sgd, # the cols you want to pivot. This says select the temp to percent SGD cols  
               names_to = "Variables", # the names of the new cols with all the column names 
               values_to = "Values") %>% # names of the new column with all the values 
  group_by(Variables, Site, Time) %>%
  summarise(mean_vals = mean(Values, na.rm = TRUE)) %>%
pivot_wider(names_from = Variables, 
            values_from = mean_vals) %>% # notice it is now mean_vals as the col name
write_csv(here("Week_04","Output","summary.csv"))  # export as a csv to the right folder

View(ChemData_clean)
