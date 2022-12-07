#  Server
library(dplyr)
library(shiny)
library(plotly)
library(ggplot2)
library(knitr)
library(markdown)
library(DT)
library(shinydashboard)


# Data wrangling...
  # Table
majors_list <- read.csv("https://raw.githubusercontent.com/info201a-au2022/project-group-4-section-ae/main/data/recent-grads.csv")

majors_list <- majors_list %>% 
  rename("Category" = Major_category,
         "Share of Women" = ShareWomen,
         "Unemployment Rate" = Unemployment_rate) %>% 
  select(Rank, Major, Category, `Share of Women`, Total, Men, Women, `Unemployment Rate`)

  # Gender Plot

women_stem <- read.csv("https://raw.githubusercontent.com/info201a-au2022/project-group-4-section-ae/main/data/women-stem.csv")

test_data_engineering <- women_stem %>% 
  filter(Major_category == "Engineering")

test_data_comp_math <- women_stem %>% 
  filter(Major_category == "Computers & Mathematics")

test_data_health <- women_stem %>% 
  filter(Major_category == "Health")

test_data_bio_ls <- women_stem %>% 
  filter(Major_category == "Biology & Life Science")

test_data_phys_sci <- women_stem %>% 
  filter(Major_category == "Physical Sciences")

  # All Ages
all_ages <- read.csv("https://raw.githubusercontent.com/info201a-au2022/project-group-4-section-ae/main/data/all-ages.csv")



server <- function(input, output) {
  output$plot <- renderPlotly({
    if (input$categories == "All Major Categories") {
      women_stem_plot <- ggplot(women_stem, aes(fill = Major_category)) +
        ggtitle("Shares of Total Women in STEM Majors") +
        geom_col(mapping = aes(x = ShareWomen, y = Major)) +
        labs(x = "Women as Share of Total Major Population", y = "Majors") +
        theme(plot.caption.position = "plot",
              plot.caption = element_text(hjust = 0))
      women_stem_plot
    } else if (input$categories == "Engineering") {
      test_engineering_plot <- ggplot(test_data_engineering, aes(fill = Major_category)) +
        ggtitle("Shares of Total Women in STEM Majors") +
        geom_col(mapping = aes(x = ShareWomen, y = Major)) +
        labs(x = "Women as Share of Total Major Population", y = "Majors") +
        theme(plot.caption.position = "plot",
              plot.caption = element_text(hjust = 0))
      test_engineering_plot
    } else if (input$categories == "Computers & Mathematics") {
      data_comp_math_plot <- ggplot(test_data_comp_math, aes(fill = Major_category)) +
        ggtitle("Shares of Total Women in STEM Majors") +
        geom_col(mapping = aes(x = ShareWomen, y = Major)) +
        labs(x = "Women as Share of Total Major Population", y = "Majors") +
        theme(plot.caption.position = "plot",
              plot.caption = element_text(hjust = 0))
      data_comp_math_plot
    } else if (input$categories == "Health") {
      test_data_health_plot <- ggplot(test_data_health, aes(fill = Major_category)) +
        ggtitle("Shares of Total Women in STEM Majors") +
        geom_col(mapping = aes(x = ShareWomen, y = Major)) +
        labs(x = "Women as Share of Total Major Population", y = "Majors") +
        theme(plot.caption.position = "plot",
              plot.caption = element_text(hjust = 0))
      test_data_health_plot
    } else if (input$categories == "Biology & Life Science") {
      test_data_bio_ls_plot <- ggplot(test_data_bio_ls, aes(fill = Major_category)) +
        ggtitle("Shares of Total Women in STEM Majors") +
        geom_col(mapping = aes(x = ShareWomen, y = Major)) +
        labs(x = "Women as Share of Total Major Population", y = "Majors") +
        theme(plot.caption.position = "plot",
              plot.caption = element_text(hjust = 0))
      test_data_bio_ls_plot
    } else if (input$categories == "Physical Sciences") {
      test_data_phys_sci_plot <- ggplot(test_data_phys_sci, aes(fill = Major_category)) +
        ggtitle("Shares of Total Women in STEM Majors") +
        geom_col(mapping = aes(x = ShareWomen, y = Major)) +
        labs(x = "Women as Share of Total Major Population", y = "Majors") +
        theme(plot.caption.position = "plot",
              plot.caption = element_text(hjust = 0))
      test_data_phys_sci_plot
    }
  })
  output$scatterplot <- renderPlotly({
    all_ages <- all_ages %>% filter(Major_category %in% input$major_categories) %>% group_by(Major_category)%>% summarise(Unemployment_rate_mean = mean(Unemployment_rate))
    
    all_ages_plot <- ggplot(all_ages, mapping = aes(x = Unemployment_rate_mean, y = Major_category)) + 
      ggtitle("Major and Unemployment Rate") + 
      geom_point() +
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

