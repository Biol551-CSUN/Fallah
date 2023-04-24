#### completing homework on factors ###
## week_11 Roshan Fallah ##


## loading libraries
library(here)
library(tidyverse)
library(janitor)
library(cats)

## read data
intertidal <- read.csv(here("Week_11", "Data", "intertidaldata.csv"))


##  tidaldictionary <- read.csv(here("Week_11", "Data", 
                               #  "intertidal_data_dictionary.csv"))
# view(tidaldictionary)

inter1 <- intertidal %>%
  group_by(Whelks..Counts.)
view(inter1)

inter1clean <- inter1 %>%    ## selecting only columns I need so table is easier to read
  select(Site, Quadrat, Whelks..Counts.)

# view(inter1clean)

i1 <- inter1clean %>%
  count(Site, sort = TRUE) %>%
group_by(Whelks..Counts., Site) %>%
  filter(n>6) # only keep when whelk was found in  >3 zones per site 
  

view(i1)

   
 i1 %>%
   ggplot(aes(x = fct_reorder(Site, n, .desc = TRUE), y = n)) +   ## reordering in descending order
   geom_col() +  
   geom_text(aes(label = n), color = "maroon", hjust = -0.1) +  ## adding stat labels & making them red
   coord_flip()+  ## prefer this orientation for barplots with lots of bars
   theme_gray()+
   ggtitle("Descending No. of whelk zones per site")+
   labs(x = "Whelk Sites")+
   theme(axis.text.y = element_text(size = 16, color = "maroon"),
           axis.title = element_text(size = 18))   ## make the titles bigger
 
 # ggsave(here("Week_11", "Output", "factor_homework.png"))
   
