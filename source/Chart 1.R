library(dplyr)
library(ggplot2)

# Imports table from Covid19 dataset
COVID19_data <- read.csv("../data/COVID19_daily_survey.csv", header = TRUE, stringsAsFactors = FALSE)

# Filter columns that are of use
COVID19_data_cleaned <- COVID19_data %>%
  select(covid_status, socialize_min)

# Data Wrangling: Remove NA's from columns in use and turn 0s and 1s to true/false
COVID19_data_cleaned <- COVID19_data_cleaned %>%
  group_by(covid_status) %>%
  filter(!is.na(covid_status), !is.na(socialize_min)) %>%
  mutate(covid_status = covid_status == 1)

# Data Visualization: correlation between COVID-19 and a person's physical health
covid_on_physical <- ggplot(COVID19_data_cleaned, aes(x = covid_status, y = socialize_min)) + 
  stat_boxplot(geom ='errorbar', width = 0.75) +
  geom_boxplot(show.legend = TRUE, width = 0.5) +
  scale_fill_discrete(name = "Contracted Covid") +
  coord_flip() +
  labs(x = "Contracted Covid", y = "Virtual Socialized Minutes", title = "COVID-19 Impact on Virtual Socialized Minutes", subtitle = "Shows the relationship of virtual socialized minutes and people with COVID-19.")
covid_on_physical
