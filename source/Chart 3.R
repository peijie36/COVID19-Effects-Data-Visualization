library(dplyr)
library(ggplot2)
library(tidyr)

# Imports table from Covid19 dataset
COVID19_data <- read.csv("../data/COVID19_daily_survey.csv", header = TRUE, stringsAsFactors = FALSE)

# Filter columns that are of use
COVID19_data_cleaned <- COVID19_data %>%
  select(covid_status, stress, isolation, worry_scale)

# Data Wrangling: Remove NA's from columns in use, turn 0s and 1s to true/false, and find averages of different mental health related data
COVID19_data_cleaned <- COVID19_data_cleaned %>%
  group_by(covid_status) %>%
  filter(!is.na(covid_status), !is.na(stress), !is.na(isolation), !is.na(worry_scale)) %>%
  mutate(covid_status = covid_status == 1) %>%
  summarize(stress_level = mean(stress, na.rm = TRUE), isolation_level = mean(isolation, na.rm = TRUE), worry_level = mean(worry_scale, na.rm = TRUE))

COVID19_data_cleaned <- gather(
  COVID19_data_cleaned,
  key = mental_health,
  value = average,
  -covid_status
)

# Data Visualization: Correlation between COVID-19 on a person's mental health
covid_on_mental <- ggplot(COVID19_data_cleaned) + 
  geom_col(aes(x = mental_health, y = average, group = covid_status, fill = covid_status), stat = "identity", position = "dodge") +
  scale_fill_discrete(name = "Contracted Covid") +
  labs(x = "Mental Health", y = "Average Total", title = "COVID-19 Impact on Mental Health", subtitle = "Difference in mental stress between people with covid and without.")
covid_on_mental
