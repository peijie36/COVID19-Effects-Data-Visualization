library(dplyr)

COVID19_data <- read.csv("../data/COVID19_daily_survey.csv", header = TRUE, stringsAsFactors = FALSE)

aggregate_table <- COVID19_data %>% 
  select(unique_id, covid_status, TST, sleepdiary_fellasleep, socialize_min, exercise, stress, isolation, worry_scale) %>%
  mutate(covid_status = covid_status == 1) %>%
  filter(!is.na(covid_status)) %>%
  group_by(covid_status) %>%
  summarize(total_sleep_time = round(mean(TST, na.rm = TRUE), digits = 3), 
            difficulty_falling_asleep = round(mean(sleepdiary_fellasleep, na.rm = TRUE), digits = 3), 
            virtually_socialization_min = round(mean(socialize_min, na.rm = TRUE), digits = 3),
            stress_level = round(mean(stress, na.rm = TRUE), digits = 3),
            prop_exercise = round(mean(exercise, na.rm = TRUE), digits = 3),
            isolation_level = round(mean(isolation, na.rm = TRUE), digits = 3),
            worry_level = round(mean(worry_scale, na.rm =TRUE), digits = 3))