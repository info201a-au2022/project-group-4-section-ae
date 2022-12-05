# ui P3

library("shiny")
library("plotly")
library("ggplot2")
library("knitr")
library("markdown")

# BASIC FORMAT FOR TABS AND PAGES

intro_main_content <- mainPanel(
  p("this is a test for para"), 
  plotlyOutput("plot")
)


intro_tab_panel <- tabPanel("Tab Introduction", 
                            titlePanel("title for page"),
                            intro_main_content)


# REPORT

# MAKE SURE ONCE YOURE DONE WITH YOUR TAB TO INCLUDE IT IN THE NAV BAR PAGE

ui <- navbarPage("Title for Tabs",
                 intro_tab_panel)