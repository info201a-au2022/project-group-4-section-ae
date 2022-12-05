# ui P3


library("shiny")
library("plotly")
library("ggplot2")

# BASIC FORMAT FOR TABS AND PAGES

all_ages_data <- mainPanel(
  p("this is a test for para")
)


intro_tab_panel <- tabPanel("Tab Introduction", 
                            titlePanel("title for page"),
                            intro_main_content)


# MAKE SURE ONCE YOURE DONE WITH YOUR TAB TO INCLUDE IT IN THE NAV BAR PAGE

ui <- navbarPage("Title for Tabs",
                 intro_tab_panel)
