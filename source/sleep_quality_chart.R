library(shiny)
library(ggplot2)
library(plotly)


# Widget
covid_input <- radioButtons(
  "covid",
  label = "Contracted Covid",
  choices = list("Negative" = 1, "Positive" = 2, "Both" = 3),
  selected = 1
)

age_input <- radioButtons(
  inputId = "age",
  label = "Age groups",
  choices = list("18 - 24" = 1, "25 - 40" = 2, "41 - 64" = 3, "65 and over" = 4),
  selected = 1
)



# Visualization page
sleep_quality_chart <- tabPanel(
  "Sleep Time",
  sidebarLayout(
    sidebarPanel(
      age_input
    ),
    mainPanel(
      plotlyOutput("sq_chart"),
      br(),
      p("We chose to employ a side by side bar chart to show the average sleep time between different ages,
        grouped by people's COVID status. The purpose of this chart is to discover the impacts of COVID-19
        on a specific age group's length of sleep. We wanted to see if COVID-19 affects an indiviual's sleep time
        and if different age groups are affected more or less because of COVID-19. One thing to note is that because
        of the limitation of dataset, not every age has data collected on the sleep time of people who contracted COVID.")
    )
  )
)
