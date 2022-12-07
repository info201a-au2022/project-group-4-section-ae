# ui P3

<<<<<<< HEAD

library("shiny")
library("plotly")
library("ggplot2")

# BASIC FORMAT FOR TABS AND PAGES

all_ages_data <- mainPanel(
  p("this is a test for para")
=======
library("shiny")
library("plotly")
library("ggplot2")

# BASIC FORMAT FOR TABS AND PAGES

<<<<<<< HEAD
intro_panel <- tabPanel("Introduction", titlePanel("Introduction"), 
                        p("For our project, we are analyzing hundreds of different college majors and their correlation to employment and unemployment. The categories we analyze are divided by age (all ages, under 28, and over 25), and we also will take a look at basic earnings and sex. Our goal is to determine whether or not one’s major has any impact on their future employment. The FiveThirtyEight article “The Economic Guide to Picking a Major” uses this dataset to demonstrate the importance behind picking a major: “A college degree is no guarantee of economic success. But through their choice of major, they can take at least some steps toward boosting their odds” (Casselman). We want to assess if majors are truly as important as perceived, and if majoring in something that may be perceived to have a low or high employment rate may actually turn out to have a different or unexpected outcome."),
                        )

women_stem_main_content <- mainPanel(
  plotOutput("plot"),
  p("This chart was included to show what STEM majors have the highest and lowest shares of women in each majors. We wanted to note STEM majors and fields that could increase their gender diversity. Our observations made us realize that major categories in Health (such as Communication Disorders Sciences and Services) included the highest share of women, while majors in Engineering (such as Mining and Mineral Engineering) was the category with the lowest share of women, demonstrating an area where STEM gender diversity needs to improve.")
=======
intro_main_content <- mainPanel(
  p("this is a test for para"), 
  plotlyOutput("plot")
>>>>>>> refs/remotes/origin/main
>>>>>>> 316154d0d08b6d635089c5b9948cd061d2d564ad
)

women_stem_sidebar <- sidebarPanel(textInput("Search for a Major", "Major Name", 
                                             value = ""))

women_stem_tab_panel <- tabPanel("Women in STEM Majors", 
                                 titlePanel("Share of Women in STEM Majors"),
                                 sidebarLayout(women_stem_main_content, 
                                               women_stem_sidebar))

full_report_panel <- tabPanel("Report", titlePanel("Report"),
                              p(strong("Names:"), "Arona Cho, Irene Jo, Melanie Kuo"),
                              p(strong("Date:"), "Autumn 2022"),
                              p(strong("Section:"), "AE-4"),
                              p(strong("Affiliation:"), "INFO-201: Technical Foundations of Informatics - The Information School - University of Washington"),
                              h3("Abstract"),
                              p("Our main concern for this project is to find the relationships between various college majors, employment and salary as well as graduation rates. This is important information since this can be used to further predict future supply of workers in various fields as well as the demands of various job fields. To address this, we will provide large amounts of data on employment and unemployment rates, median salary, number of graduates and gender distribution across 173 college majors surveyed in the American Community Survey 2010-2012 Public Use Microdata Series."),
                              h3("Keywords"),
                              p("College majors, employment, unemployment, salary, age, gender"),
                              h3("Problem Domain"),
                              p("Our project frame is finding employment and unemployment rates as well as rates of graduation and gender distribution within the 173 majors. With this information, we hope to discover various trends and patterns that can be further utilized to predict future job market changes as well as to inform students tasked with making decisions that will have long lasting effects in their lives. The human values that we took into consideration while working on this project were the long term effects of making these conclusions from this data collected in American Community Survey 2010-2012, as we could end up discouraging some people from certain job fields and causing a shift in supply of certain college major graduates in the job field. To avoid spreading inaccurate information, we made sure to draw accurate conclusions from reliable and quantitative data and utilizing analytic methods to make accurate conclusions. Direct stakeholders of this project include us, the authors, as we would like to make sure it includes accurate, reliable, and useful information. If we cannot deliver information that does not meet those requirements, then we would fail to meet our objective of assessing the importance of the type of college major in relation to other factors such as employment rate and gender distribution. Other direct stakeholders for this project are the future and current college enrollees that would benefit from our assessment of college majors. The Federal Reserve Bank of New York reported that there is currently a growing wage gap between those without a college degree and those with a college degree (The Federal Reserve Bank of New York). People that consider income to be crucial to their choice of major would be one of the main stakeholders of this project. Possible indirect stakeholders could be the institutions that facilitate and educate people that would like to pursue college degrees, as well as employers and the fields of the different majors listed in this project. Possible harms of this project include biases and reinforcement of stereotypes that may be formed regarding specific majors. Through the analysis of this project, there may be data conclusions that are unexpected, such as seemingly high-paying majors not paying as much, or vice versa. The analysis of this data could possibly affect one’s decision of what to major in college, which can be both a harm or benefit. One may choose a specific major due to factors like income or employment rates, so this information can be useful to some, and may provide benefits by assisting with these types of decisions. It’s also important to know information regarding the amount of women in certain fields in order to assess areas where more gender diversity is needed. According to the National Girls Collaborative Project, women make up only 34% of the STEM workforce (National Girls Collaborative Project). This means that many progressions need to be made towards closing the gender gap, and using this data is a great start."),
                              h3("Research Questions"),
                              p(strong("What are the median wages of college graduates with different majors?"), "Finding the median wages of college graduates with various majors can help students get a better understanding of levels of financial success of graduates with different majors and help them make a decision that best matches their dreams. It can also be used for those in specific majors to estimate their future wage and calculate their financial status."),
                              p(strong("Which college majors result in higher rates of employment and salary?"), "This data helps identify different patterns in growing and shrinking fields of study to be used to further predict the job market changes as well as assist students that have to choose a major by providing important information of employment and salary rates."),
                              p(strong("What are the relationships between gender and college majors?"), "This information is important since it helps data about gender inequality and distribution amongst the different majors easier to view and understand. This allows us to discover which majors are preferred by different genders and possibly carry on further research about why."),
                              p(strong("How do the graduation rates of each major compare to others?"), "It is important because it can be informative for those going into the major and those that are choosing majors to take into consideration the rates of graduation based on academic rigor, lack of employment offers or overall bad staff. This information is needed to help the school make improvements or assistance for students in majors with very low graduation rates or etc."),
                              p(strong("The Dataset"), "Our dataset showcases information regarding various majors and their statistics for employment, graduation rates, and gender. From viewing this dataset, we can identify correlations between the data, and determine whether or not these factors have impacts on one another. Additionally, the dataset has a vast amount of information, which is useful for those who may be interested in finding a less popular major or specific, researched statistics regarding another specific major."),
                              p(strong("Sources of Data"), "Tunguz, Bojan. All-ages (Data set), 2020. https://www.kaggle.com/datasets/tunguz/college-majors?select=all-ages.csv

Tunguz, Bojan. Grad-students (Data set), 2020.
https://www.kaggle.com/datasets/tunguz/college-majors?select=grad-students.csv

Tunguz, Bojan. Majors-list (Data set), 2020.
https://www.kaggle.com/datasets/tunguz/college-majors?select=majors-list.csv

Tunguz, Bojan. Recent-grads (Data set), 2020.
https://www.kaggle.com/datasets/tunguz/college-majors?select=recent-grads.csv

Tunguz, Bojan. Women-stem (Data set), 2020.
https://www.kaggle.com/datasets/tunguz/college-majors?select=women-stem.csv")
                              )

<<<<<<< HEAD

# MAKE SURE ONCE YOURE DONE WITH YOUR TAB TO INCLUDE IT IN THE NAV BAR PAGE

ui <- navbarPage("College Majors",
                 intro_panel, women_stem_tab_panel, full_report_panel)

=======
<<<<<<< HEAD
# MAKE SURE ONCE YOURE DONE WITH YOUR TAB TO INCLUDE IT IN THE NAV BAR PAGE

ui <- navbarPage("Title for Tabs",
                 intro_tab_panel)
=======
# REPORT

# MAKE SURE ONCE YOURE DONE WITH YOUR TAB TO INCLUDE IT IN THE NAV BAR PAGE

ui <- navbarPage("Title for Tabs",
                 intro_tab_panel)
>>>>>>> refs/remotes/origin/main
>>>>>>> 316154d0d08b6d635089c5b9948cd061d2d564ad
