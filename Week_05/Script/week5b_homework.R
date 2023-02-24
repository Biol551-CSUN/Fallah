install.packages("lubridate")
library(tidyverse)
library(here)
library(lubridate)
#####TODAY GOING TO BE USING THE LUBRIDATE PACKAGE 2023-02-23 #####
ymd("2021-02-24")
datetimes<-c("02/24/2021 22:22:20",
             "02/25/2021 11:21:10",
             "02/26/2021 8:01:52")
datetimes <- mdy_hms (datetimes)

month(datetimes, label = TRUE)
day(datetimes)
hour(datetimes)
datetimes + hours(4)
datetimes + days(2) ## adds 2 days ###







view(CondData)


###read in the data ####
CondData<-read_csv(here("Week_05","Data", "CondData.csv"))

CondData <- CondData %>%
mutate(Date = mdy_hm(Date)) %>%  ## correcting date and time format ###
  round_date(CondData, "10 seconds")   ### rounding to 10s #
  
### read in the Data ###
DepthData<-read_csv(here("Week_05","Data", "DepthData.csv"))

DepthData <- DepthData %>%
mutate(Date = mdy_hm(Date)) %>%
  
  inner_join(CondData) %>% ##### joining the data #### 

     ### renaming the new joined data to save confusion ###
mutate(Date = round_date(Date, "2 minute")) %>%     ### rounding date ###
group_by(Date) %>%      ### group by date so can produce plot ###

summarise(mean_depth = mean(Depth, na.rm = TRUE),
mean_temp = mean(TempInSitu, na.rm = TRUE),
mean_salinity = mean(Salinity, na.rm = TRUE))

ggplot(data = DepthData,
       mapping = aes(x = mean_depth,
                     y = mean_temp))+

geom_point()
  labs(x = "Mean Depth",
       y = "Mean Temp")
          