# ui P3

library(shiny)
library(plotly)
library(ggplot2)
library(knitr)
library(markdown)

# Data

# BASIC FORMAT FOR TABS AND PAGES

intro_main_content <- mainPanel(
  p("this is a test for para")
)


intro_tab_panel <- tabPanel("Tab Introduction", 
                            titlePanel("Introduction"),
                            intro_main_content)

# Graph Dotplot Majors List

majors_list_main_content <- mainPanel(
  plotOutput("dotplot")
)

majors_list_sidebar_content <- sidebarPanel(
  selectInput("list_select",
            "Major Category",
            choices = select_category,
            selected = "FOD1P")
)

majors_list_tab_panel <- tabPanel("Majors List Visualization",
                                  titlePanel("List of Majors with Categories"),
                                  sidebarLayout(
                                    majors_list_main_content,
                                    majors_list_sidebar_content
                                  ))


# REPORT

report_tab_panel <- tabPanel("Report",
                             titlePanel("Majors Report",
                                        tabPanel("Tester",
                                                 includeHTML("report.html"))))


# MAKE SURE ONCE YOURE DONE WITH YOUR TAB TO INCLUDE IT IN THE NAV BAR PAGE

ui <- navbarPage("Title for Tabs",
                 intro_tab_panel,
                 majors_list_tab_panel,
                 report_tab_panel)



