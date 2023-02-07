blabla
### this is my first script. Iam learning how to import data
### created by: Roshan Fallah
### created on: 2023-02-02
##################################
### Load libraries #########
library(tidyverse)
### Load libraries #########
library(here)
### read in data ###
weightdata<-read_csv(here("Week_02","data","weightdata.csv"))
### Data Analysis ####
head(weightdata)
tail(weightdata)
view(weightdata)
glimpse(weightdata)
