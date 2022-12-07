library(shiny)
library(ggplot2)
library(tidyverse)

server <- function(input, output) {
  

  all_ages_data <- renderPlot({
    all_ages <- read.csv("https://raw.githubusercontent.com/info201a-au2022/project-group-4-section-ae/main/data/all-ages.csv")
  
    #all_ages <- all_ages %>%  filter(Unemployment_rate > input$range_input)
    #do I need to do this
    all_ages <- all_ages %>% filter(Major_category %in% input$major_input) %>% group_by(Major_category, na.rm = TRUE) %>% summarise(Unemployment_rate_mean = mean(Unemployment_rate))
  })
  
  output$plot <- renderPlot({
    #switch to all_ages_data() when work
    all_ages_plot <- ggplot(all_ages, mapping = aes(y = Major_category, x = Unemployment_rate)) + 
      ggtitle("Major and Unemployment Rate") + 
      geom_violin() + 
      labs(caption = "This chart demonstrates which catagories of college majors 
       have the greatest and least rates of Unemployment. We wanted to create a 
       data visualization that makes it easy for students to see which
       catagories of majors tend to guarentee higher rates of employment, 
       so that they are better informed. Our observations made us realize 
       that major catagories such as Art, Psychology & Social Work,
       and Humanities & Liberal Arts have the greatest unemployment rates.") +
      theme(plot.caption.position = "plot",plot.caption = element_text(hjust = 0))
    
    all_ages_plot
  })
} 