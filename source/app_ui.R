library(shiny)
library(shinyWidgets)

source("introduction_page.R")
source("virtual_social_chart.R")
source("mental_health_chart.R")
source("sleep_quality_chart.R")
source("physical_exercise_chart.R")
source("summary_takeaways.R")

# Creates UI for Web App
ui <- navbarPage(
  includeCSS("styles.css"),
  setBackgroundColor(
    color = "Linen",
    gradient = c("linear", "radial"),
    direction = c("bottom", "top", "right", "left"),
    shinydashboard = FALSE
  ),
  title = "Can't Sleep Through The Pandemic",
  intro_page,
  virtual_social_chart,
  sleep_quality_chart,
  physical_exercise_chart,
  mental_health_chart,
  summary_page,
  tabPanel(
    "Report",
    fluidRow(
      column(
        8,
        offset = 2,
        includeHTML("report.html")
      ),
    ),
  )
)
