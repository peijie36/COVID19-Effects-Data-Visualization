library(shiny)
library(markdown)

summary_page <- tabPanel(
  "Summary",
  fluidRow(
    column(
      8,
      offset = 2,
      h1("Summary Takeaways"),
      br(),
      p("1) Looking at the relationship between COVID-19 and virtual socialized minutes in a day, we initially thought
        that COVID-19 would heavily lessen a person's amount of time spent socializing. Yet, after looking at the
        charts, it was revealed that even though the range of minutes spent virtually socializing for people who don't
        have COVID-19 is larger, we found that the general distribution for the median, first, and the third quartile
        is equivalent between both groups. Consequently, COVID-19 does not have a large enough impact to claim that it
        affects a person's virtual social interaction."),
      br(),
      p("2) When it comes to the relationship between COVID-19 and sleep time, our initial assumption was that people who
        contracted COVID-19 tend to have a lower average hours of sleep. However, upon looking at the average sleep time
        for different age groups,  there is no apparent correlation between COVID-19 and an individual's average sleep
        time at different ages. Therefore, we can't determine whether COVID-19 has an effect on people's sleep quality
        or not. It is reasonable that there are no specific sleep patterns because many factors can alter an individual's
        average sleep time. A low average sleep time isn't necessarily a consequence of COVID-19."),
      br(),
      p("3) In terms of the relationship between COVID and participants exercise level, we anticipated to see some decline 
        in the daily exercise steps from those who tested positive. Our data visualization supported this hypothesis: 
        participants who contracted COVID had very concentrated step counts of under 20k, those who did not have COVID had 
        doubled the steps, and a few outlier data points tripled and quadrupled the steps of the covid-positive group. 
        However, our data set only allows us to point the cause of difference to COVID-19 as a general idea and not its 
        specific complications from this data set, we do not know if the decrease in steps was resulted from participants' 
        physical illness hence the lack of energy to walk or the set of government quarantine policies which resulted in 
        the lack of places to be and chances to get out the door. Overall it's safe to say that COVID-19 had significant 
        impact on a person's daily exercise level."),
      br(),
      p("4) Mental well-being is another aspect in which COVID-19 has a negative impact on. After examining the bar chart
        related to mental health, we found that people who contracted COVID-19 are likely to suffer from mental health
        issues more severely. This is shown in the chart that on average, people with COVID-19 tend to show a higher
        average level of being affected in each mental health category. This correlation suggests that people experience
        significant mental health repercussions because of COVID-19.")
    )
  )
)
