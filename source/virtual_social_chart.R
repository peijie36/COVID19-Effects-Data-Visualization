library(shiny)
library(plotly)
library(ggplot2)

virtual_social_chart <- tabPanel(

  # Creates title for this section
  title = "Socialization",

  # Creates select box for country and slider for year range
  sidebarLayout(
    sidebarPanel(
      radioButtons("social",
        label = h3("Contracted Covid"),
        choices = list("Both" = 1, "True" = 2, "False" = 3, "Combined" = 4),
        selected = 1
      ),
    ),

    # Show a box plot of the generated distribution
    mainPanel(
      plotlyOutput("vsm_box"),
      br(),
      p("In this chart, we decided to use a box plot to discover the relationship between COVID-19 and
        virtual socialization. Specifically, we are looking at the total minutes a person spends doing
        virtual/phone socialization in a day based on their covid status. Users are given the option to
        select between people with and/or without covid, or a combined plot of all individuals. This
        allows users to see the distribution of virtual socialization minutes alongside specific covid status.")
    )
  )
)
