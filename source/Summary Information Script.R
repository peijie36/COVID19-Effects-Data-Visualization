# Summary Information Script 

my_dataframe <- read.csv("C:\\Users\\rober\\Documents\\Info201 code\\final-project-starter-ScottN23\\data\\1b_COVID19_daily_survey_ALL_cleaned_deid.csv")
View(my_dataframe)

library(dplyr)

## A function that takes in a dataset and returns a list of info about it:
summary_info <- list()
summary_info$num_observations <- nrow(my_dataframe)
summary_info$num_features <- ncol(my_dataframe)

##Variable 1
summary_info$max_sleeplatency_quarantine <- my_dataframe %>%
  filter(sleepdiary_sleeplatency == max(sleepdiary_sleeplatency, na.rm = TRUE)) %>%
  pull(quarantine)
#1

##Variable 2
summary_info$night_awakening_time_socialize <- my_dataframe %>%
  filter(night_awakening_time == max(night_awakening_time)) %>%
  pull(socialize)
#0

num_socialize_excited <- my_dataframe %>%
  filter(socialize == 1) %>%
  filter(panas_excited3 == 5)%>%
  pull(panas_excited3) %>%
  length()
#164

num_excited <- my_dataframe %>%
  filter(panas_excited3 == 5)%>%
  pull(panas_excited3) %>%
  length()
#206

##Variable 3
summary_info$prop_socialize_excited <- num_socialize_excited/num_excited
# 0.7961165

num_covid_distressed <- my_dataframe %>%
  filter(covid_status == 1) %>%
  filter(panas_distressed3 == 5, na.rm = TRUE)%>%
  pull(panas_distressed3) %>%
  length()
#3

num_distressed <-my_dataframe %>%
  filter(panas_distressed3 == 5, na.rm = TRUE)%>%
  pull(panas_distressed3) %>%
  length()
#210

##Variable 4
summary_info$prop_covid_distressed <- num_covid_distressed/num_distressed
# 0.01428571

num_covid_enthusiastic <- my_dataframe %>%
  filter(covid_status == 1) %>%
  filter(panas_enthusiastic3 == 5, na.rm = TRUE) %>%
  pull(panas_enthusiastic3) %>%
  length()
# 3

num_enthusiastic <- my_dataframe %>%
  filter(panas_enthusiastic3 == 5, na.rm = TRUE) %>%
  pull(panas_enthusiastic3) %>%
  length()
# 359

##Variable 5
summary_info$prop_covid_enthusiastic <- num_covid_enthusiastic/num_enthusiastic
# 0.008356546






           