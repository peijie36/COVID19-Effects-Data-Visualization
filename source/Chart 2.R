library(dplyr)
library(ggplot2)

COVID19_data <- read.csv("../data/COVID19_daily_survey.csv", header = TRUE, stringsAsFactors = FALSE)


#Select columns we need to answer our driving questions
COVID19_data_cleaned <- COVID19_data %>%
   select(unique_id, covid_status, TST, sleepdiary_fellasleep)

#Data analysis: correlation between COVID-19 and quality of sleep (indicated by total sleep time)
COVID19_sleep_quality <- COVID19_data_cleaned %>%
   filter(is.na(covid_status) == FALSE, is.na(sleepdiary_fellasleep) == FALSE) %>%
   group_by(covid_status) %>%
   mutate(contracted_covid = covid_status == 1) %>%
   mutate(avg_TST = mean(TST, na.rm = TRUE))

#Data visualization: scatter plot to model the relationship between sleep time and difficulty of sleep
#                    separated by people who contracted covid and those who did not
COVID_TST_visualization <- ggplot(COVID19_sleep_quality) +
   geom_point(mapping = aes(x = TST, y = sleepdiary_fellasleep, color = contracted_covid)) +
   facet_wrap(~contracted_covid) +
   labs(x = "Average Sleep Time", y = "Difficulty of Sleep", title = "COVID-19 Impact on Sleep Quality")