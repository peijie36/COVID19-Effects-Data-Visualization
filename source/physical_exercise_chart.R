library(shiny)
library(plotly)
library(ggplot2)

physical_exercise_chart <- tabPanel(

  # Title for this page
  title = "Physical exercise",

  # Creates select box for country and slider for year range
  sidebarLayout(
    sidebarPanel(
      radioButtons("steps",
        label = h3("Covid-19 status"),
        choices = list("Overview" = 1, "Covid Positive" = 2, "Covid Negative" = 3),
        selected = 1
      ),
    ),

    # Show a scatter plot of the generated distribution
    mainPanel(
      plotlyOutput("exercise_scatter_plot"),
      br(),
      p("In this section, we're interested in looking at the impact COVID has on participants physical exercise 
        level. We used a scatter plot to visualize the relationship between a participant's COVID status and 
        their daily exercise steps. Users have the option to see the daily exercise data for those who contracted 
        COVID, those who didn't and an overview comparison of both which clearly indicates the difference between
        the two.")
    )
  )
)

