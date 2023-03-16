library(shiny)
library(plotly)
library(ggplot2)
library(dplyr)

# Imports table from COVID19 dataset
COVID19_data <- read.csv("COVID19_daily_survey.csv", header = TRUE, stringsAsFactors = FALSE)
COVID19_demographics <- read.csv("COVID19_demographics_survey.csv", header = TRUE, stringsAsFactors = FALSE)

# Server side for Web App
server <- function(input, output) {
  output$vsm_box <- renderPlotly({
    # Filter columns that are of use
    COVID19_data_cleaned <- COVID19_data %>%
      select(covid_status, socialize_min)

    # Data Wrangling: Remove NA's from columns in use and turn 0s and 1s to true/false
    COVID19_vsm_box <- COVID19_data_cleaned %>%
      group_by(covid_status) %>%
      filter(!is.na(covid_status), !is.na(socialize_min)) %>%
      mutate(covid_status = covid_status == 1)

    # Selects correct chart output
    if (input$social == 2) {
      COVID19_vsm_box <- COVID19_vsm_box %>%
        filter(covid_status == TRUE)
    } else if (input$social == 3) {
      COVID19_vsm_box <- COVID19_vsm_box %>%
        filter(covid_status == FALSE)
    } else if (input$social == 4) {
      COVID19_vsm_box <- COVID19_vsm_box %>%
        mutate(covid_status = "combined")
    }

    # Draw the box plot with the specified country
    vsm_box_plot <- plot_ly(COVID19_vsm_box,
      x = ~socialize_min,
      y = ~covid_status, type = "box",
      color = ~covid_status,
      hoverinfo = "x"
    ) %>%
      layout(
        title = "COVID-19 Status and Virtual Socialized Minutes",
        legend = list(title = list(text = "<b> Contracted Covid </b>")),
        xaxis = list(title = "Virtual Socialized Minutes (Day of Survey)", range = c(0, 1005)),
        yaxis = list(title = "Contracted Covid")
      )

    # Returns box plot
    return(vsm_box_plot)
  })



  # Mental health chart
  output$mh_chart <- renderPlotly({
    COVID19_mh_data <- COVID19_data %>%
      group_by(covid_status) %>%
      filter(!is.na(covid_status)) %>%
      mutate(covid_status = covid_status == 1) %>%
      summarize(
        Stress = mean(stress, na.rm = TRUE),
        Isolation = mean(isolation, na.rm = TRUE),
        Depression = mean(depression1, na.rm = TRUE),
        WorryHealth = mean(worry_health, na.rm = TRUE),
        WorryFinances = mean(worry_finances, na.rm = TRUE),
        Tiredness = mean(depression4, na.rm = TRUE),
        DifficultyConcentrating = mean(depression7, na.rm = TRUE)
      )

    mh_chart <- plot_ly(
      data = COVID19_mh_data,
      x = input$mental,
      y = ~ .data[[input$mental]],
      color = ~covid_status,
      type = "bar"
    ) %>%
      layout(
        title = "COVID-19 Effect on Mental Health Severity",
        legend = list(title = list(text = "<b> Contracted Covid </b>")),
        yaxis = list(title = "Scale", range = c(0, 5))
      )
    # Return the visualization
    mh_chart
  })



  # Physical exercise scatter plot
  output$exercise_scatter_plot <- renderPlotly({
    COVID19_exercise_data <- COVID19_data %>%
      group_by(covid_status) %>%
      filter(!is.na(covid_status)) %>%
      mutate(covid_status = covid_status == 1) %>%
      select(steps)
    
    if (input$steps == 2) {
      COVID19_exercise_data <- COVID19_exercise_data %>%
        filter(covid_status == TRUE)
    } else if (input$steps == 3) {
      COVID19_exercise_data <- COVID19_exercise_data %>%
        filter(covid_status == FALSE)
    }
    
    # Draws the scatter plot
    exercise_scatter_plot <- plot_ly(COVID19_exercise_data,
                                 x = ~covid_status,
                                 y = ~steps,
                                 type = 'scatter') %>%
      layout(title = "COVID-19 Status and daily steps",
             xaxis = list(title = "Covid-19 Status"),
             yaxis = list(title = "Total steps taken"))
    
    # Returns scatter plot
    return(exercise_scatter_plot)
  })



  # Average Sleep Time chart (based on age)
  output$sq_chart <- renderPlotly({
    COVID19_age_data <- COVID19_demographics %>%
      select(sub_id, age)

    COVID19_sleep_data <- COVID19_data %>%
      filter(!is.na(covid_status)) %>%
      inner_join(COVID19_age_data, by = "sub_id")

    if (input$age == 1) {
      COVID19_sleep_data <- COVID19_sleep_data %>%
        filter(age >= 18, age <= 24)
    } else if (input$age == 2) {
      COVID19_sleep_data <- COVID19_sleep_data %>%
        filter(age >= 25, age <= 40)
    } else if (input$age == 3) {
      COVID19_sleep_data <- COVID19_sleep_data %>%
        filter(age >= 41, age <= 64)
    } else {
      COVID19_sleep_data <- COVID19_sleep_data %>%
        filter(age >= 65)
    }
    COVID19_sleep_data <- COVID19_sleep_data %>%
      mutate(covid_status = covid_status == 1) %>%
      group_by(age, covid_status) %>%
      summarize(Total_Sleep_Time = mean(TST, na.rm = TRUE))

    # Create visualization
    sq_chart <- plot_ly(
      data = COVID19_sleep_data,
      x = ~age,
      y = ~Total_Sleep_Time,
      color = ~covid_status,
      type = "bar"
    ) %>%
      layout(
        title = "Average Sleep Time Based on Age",
        barmode = "group",
        legend = list(title = list(text = "<b> Contracted Covid </b>")),
        xaxis = list(title = "Age", dtick = 1),
        yaxis = list(title = "Hours", range = c(0, 10))
      )
    # Return the visualization
    sq_chart
  })
}

