library(shiny)
library(ggplot2)
library(plotly)


# Widget
mental_health_input <- selectInput(
  inputId = "mental",
  label = "Mental Health",
  choices = c("Stress", "Isolation", "Depression", "WorryHealth", "WorryFinances", "Tiredness", "DifficultyConcentrating")
)

# Visualization page
mental_health_chart <- tabPanel(
  "Mental Health",
  sidebarLayout(
    sidebarPanel(
      mental_health_input
    ),
    mainPanel(
      plotlyOutput("mh_chart"),
      br(),
      p("When it comes to mental health, we want to examine how much individuals think they are affected by mental
        health issues because of COVID-19. As a result, we are using a bar chart to compare the impacts of
        COVID-19 on various mental health concerns, on a scale of 0 (not affected at all) to 5 (heavily affected).
        Users are provided a dropdown menu with many common mental health issues to choose from. This allows users
        to spot particular patterns bewteen COVID-19 and its effect on mental health.")
    )
  )
)
