library(shiny)

intro_page <- tabPanel(
  "Introduction",
  fluidRow(
    align = "center", offset = 2,
    h1("Introduction")
  ),
  fluidRow(
    column(8,
      align = "center", offset = 2,
      p("Currently, the COVID-19 pandemic is impacting the lives and wellbeings of families from all around the world. COVID-19 has taken a toll on the economy,
         physical health, mental well-being, and different aspects of human development. With this being a global issue affecting human lives, we can correlate
         its adverse effects on humans. That means through the lens of data science, there has been the potential of COVID-19 statistically increasing or
         declining the quality of life on different individuals. While hearing and learning more about the symptoms of COVID-19: fevers or chills, cough,
         fatigue, sore throat, and loss of taste or smell, etc. Although it can be seen that many of these symptoms remain on the more physical side, the pandemic
         as a whole seemingly has also affected the individual's social interactions with one another. In turn, COVID-19 has its effects on the mental wellbeing of an
         individual as well. Different laws within each country were imposed such as the mask mandate, social distancing, travel bans, and much more which resulted
         in limited interactions. As a repercussion of these limiting forces, it causes negative effects to different families being unable to see each other
         during pivotal moments within their lives, young children are not able to have in-person classes, or they may be limited opportunities because of the fear
         of contracting COVID-19. This quarter, our group was dedicated to finding the influence of COVID-19 on an individual's social and mental health. We were
         inclined in creating more accessible data to understand how the pandemic was either negatively or positively affecting aspects of lives. Here, we researched
         dataset from Boston College daily sleep and well-being survey data during the early phase of the COVID-19 pandemic, which was compiled by Tony Cunningham,
         Eric Fields, and Elizabeth Kensinger from Boston College. From our findings, we found data that potentially connected COVID-19 to different mental health."),
      br(),
      h1("Questions of Focus"),
      br(),
      p("What is the impact of COVID-19 on the number of hours of sleep adults are able to obtain?"),
      br(),
      p("What's the correlation between physical health such as daily steps and COVID-19?"),
      br(),
      p("What's the impact of COVID-19 on an individual's socialized minutes such as online interactions via calls, voice chats, videos, etc?"),
      br(),
      p("What's the impact of COVID-19 on different aspects of mental health?"),
    ),
  ),
  fluidRow(
    column(6,
      align = "right",
      img(src = "https://media.giphy.com/media/kaIJGG8lNC3u5DM3tg/giphy.gif"),
    ),
    column(6,
      align = "left",
      img(src = "https://media.giphy.com/media/Zm17XBTlVfjacXg44z/giphy.gif"),
    ),
  )
)
