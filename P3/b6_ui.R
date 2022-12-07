library("shiny")
library("ggplot2")
library("plotly")
ui <- fluidPage(
  
  h1("College Majors and Unemployment Rate Interactive Visualization"),
  range_input <- sliderInput("range", "Range of Umeployment Rate:",
                            min = 0.00, max = 0.15, value = 0.15),

  major_input <- selectInput("major_categories", "majors", multiple = TRUE, 
                           choices = all_ages$Major_category, selected =all_ages$Major_category),

  
  plotlyOutput("scatterplot")
)
