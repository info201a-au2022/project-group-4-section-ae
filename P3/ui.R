# ui P3
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
         "Unemployment Rate" = Unemployment_rate,
         "Median Wage" = Median) %>% 
  select(Rank, Major, Category, `Share of Women`, Total, Men, Women, `Unemployment Rate`, `Median Wage`)


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


# Data

# INTRODUCTION
intro_panel <- tabPanel("Introduction", titlePanel("Analyzing the Impact of College Majors on Employment and Correlation With Gender Diversity in STEM"), 
                        h3("Introduction", style = "color: #4d3a7d;"),
                        img("", src = "https://images.unsplash.com/photo-1525921429624-479b6a26d84d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2940&q=80", height="30%", width="30%"),
                        h1(""),
                        p("For our project, we are analyzing hundreds of different college majors and their correlation to employment and unemployment, as well as statistical insight on what STEM majors need to increase their gender diversity. Throughout this report, we will take a look at the correlation of college majors to basic earnings and sex. Our goal is to determine whether or not one’s major has any impact on their future employment. The FiveThirtyEight article “The Economic Guide to Picking a Major” uses this dataset to demonstrate the importance behind picking a major: “A college degree is no guarantee of economic success. But through their choice of major, they can take at least some steps toward boosting their odds” (Casselman). We want to assess if majors are truly as important as perceived, and if majoring in something that may be perceived to have a low or high employment rate may actually turn out to have a different or unexpected outcome."),
                        p("In regards to our purpose behind our study of gender diversity, we wanted to analyze which majors categories need to increase their gender diversity in terms of women being in the field. Many STEM fields are male-dominated, so we hope this analysis can provide a closer insight into the common majors of women in STEM."),
                        h3("Authors", style = "color: #4d3a7d;"),
                        p("Arona Cho, Irene Jo, and Melanie Kuo"),
                        align = "center")


# ALL AGES

all_ages_main_content <- mainPanel(
  plotlyOutput("scatterplot")
)

all_ages_sidebar_content <- sidebarPanel(
  selectInput("major_categories", "Select Major Categories", multiple = TRUE, 
              choices = all_ages$Major_category, selected = all_ages$Major_category),
  style = "background: lavenderblush",
  p("This scatterplot was included to show the unemployment rate of the various major categories. We realize that many of the stakeholders and a big influence on students when choosing their major is how much financial benefit they would gain from doing so."),
)

all_ages_panel <- tabPanel("Unemployment Rates",
                           titlePanel(h1("College Majors and Unemployment Rate Interactive Visualization", align = "center")),
                           sidebarLayout(
                             all_ages_main_content,
                             all_ages_sidebar_content
                           ))
# WOMEN STEM

women_stem_main_content <- mainPanel(
  plotlyOutput("plot", height = "920px")
)

women_stem_sidebar <- sidebarPanel(selectInput("categories", label = "Major Category",
                                               choices = c("All Major Categories", "Engineering", "Physical Sciences",
                                                           "Computers & Mathematics", "Biology & Life Science",
                                                           "Health")),
                                   style = "background: lavenderblush",
                                   p("This chart was included to show what STEM majors have the highest and lowest shares of women in each majors. We wanted to note STEM majors and fields that could increase their gender diversity. Our observations made us realize that major categories in Health (such as Communication Disorders Sciences and Services) included the highest share of women, while majors in Engineering (such as Mining and Mineral Engineering) was the category with the lowest share of women, demonstrating an area where STEM gender diversity needs to improve.",
                                   ))
women_stem_panel <- tabPanel("Women in STEM",
                             titlePanel(h1("Shares of Women in STEM Majors", align = "center")),
                             sidebarLayout(
                               women_stem_main_content,
                               women_stem_sidebar
                             ))

# MAJORS LIST DT

majors_list_main_content <- mainPanel(
  datatable <- datatable(majors_list,
                         rownames = FALSE)
)

majors_list_side_content <- sidebarPanel(
  style = "background: lavenderblush",
  p("This is a summary table that shows all of the different majors alongside with their major categories, shares of women, the sample population, and employment rate information. The inclusion of this table allows for easier navigation of specific information with the search bar, and provides a full visualization of the data used in the other visualizations. This summary datatable is crucial for those who would like to see various statistics about certain majors at once.")
)

majors_list_tab_panel <- tabPanel("Majors List Visualization",
                                  titlePanel(h1("Majors with Share and Unemployment", align = "center")),
                                  majors_list_main_content,
                                  majors_list_side_content
)

# FULL REPORT

full_report_panel <- tabPanel("Report", titlePanel("Report"),
                              p("impact-majors-employ"),
                              h3("Analyzing the Impact of College Majors on Employment and Correlation With Gender Diversity in STEM"),
                              p(strong("Date:"), "Autumn 2022"),
                              p(strong("Names:"), "Arona Cho, Irene Jo, Melanie Kuo"),
                              p(strong("Emails:"), "aronacho@uw.edu", "irenejo@uw.edu", "mkuo1001@uw.edu"),
                              p(strong("Affiliation:"), "INFO-201: Technical Foundations of Informatics - The Information School - University of Washington"),
                              p(strong("Section:"), "AE-4"),
                              h3("Abstract"),
                              p("Our main concern for this project is to find the relationships between various college majors, employment and salary as well as graduation rates. This is important information since this can be used to further predict future supply of workers in various fields as well as the demands of various job fields. To address this, we will provide large amounts of data on employment and unemployment rates, median salary, number of graduates and gender distribution across 173 college majors surveyed in the American Community Survey 2010-2012 Public Use Microdata Series."),
                              h3("Keywords"),
                              p("College majors, employment, unemployment, salary, age, gender"),
                              h3("Introduction"),
                              p("For our project, we are analyzing hundreds of different college majors and their correlation to employment and unemployment, as well as statistical insight on what STEM majors need to increase their gender diversity. Throguhout this report, we will take a look at the correlation of college majors to basic earnings and sex. Our goal is to determine whether or not one’s major has any impact on their future employment. The FiveThirtyEight article “The Economic Guide to Picking a Major” uses this dataset to demonstrate the importance behind picking a major: “A college degree is no guarantee of economic success. But through their choice of major, they can take at least some steps toward boosting their odds” (Casselman). We want to assess if majors are truly as important as perceived, and if majoring in something that may be perceived to have a low or high employment rate may actually turn out to have a different or unexpected outcome."),
                              p("In regards to our purpose behind our study of gender diversity, we wanted to analyze which majors categories need to increase their gender diversity in terms of women being in the field. Many STEM fields are male-dominated, so we hope this analysis can provide a closer insight into the common majors of women in STEM."),
                              h3("Problem Domain"),
                              p("Our project frame is finding employment and unemployment rates as well as rates of graduation and gender distribution within the 173 majors. With this information, we hope to discover various trends and patterns that can be further utilized to predict future job market changes as well as to inform students tasked with making decisions that will have long lasting effects in their lives. The human values that we took into consideration while working on this project were the long term effects of making these conclusions from this data collected in American Community Survey 2010-2012, as we could end up discouraging some people from certain job fields and causing a shift in supply of certain college major graduates in the job field. To avoid spreading inaccurate information, we made sure to draw accurate conclusions from reliable and quantitative data and utilizing analytic methods to make accurate conclusions. Direct stakeholders of this project include us, the authors, as we would like to make sure it includes accurate, reliable, and useful information. If we cannot deliver information that does not meet those requirements, then we would fail to meet our objective of assessing the importance of the type of college major in relation to other factors such as employment rate and gender distribution. Other direct stakeholders for this project are the future and current college enrollees that would benefit from our assessment of college majors. The Federal Reserve Bank of New York reported that there is currently a growing wage gap between those without a college degree and those with a college degree (The Federal Reserve Bank of New York). People that consider income to be crucial to their choice of major would be one of the main stakeholders of this project. Possible indirect stakeholders could be the institutions that facilitate and educate people that would like to pursue college degrees, as well as employers and the fields of the different majors listed in this project. Possible harms of this project include biases and reinforcement of stereotypes that may be formed regarding specific majors. Through the analysis of this project, there may be data conclusions that are unexpected, such as seemingly high-paying majors not paying as much, or vice versa. The analysis of this data could possibly affect one’s decision of what to major in college, which can be both a harm or benefit. One may choose a specific major due to factors like income or employment rates, so this information can be useful to some, and may provide benefits by assisting with these types of decisions. It’s also important to know information regarding the amount of women in certain fields in order to assess areas where more gender diversity is needed. According to the National Girls Collaborative Project, women make up only 34% of the STEM workforce (National Girls Collaborative Project). This means that many progressions need to be made towards closing the gender gap, and using this data is a great start."),
                              h2("Research Questions"),
                              p(strong("What are the median wages of college graduates with different majors?"), "Finding the median wages of college graduates with various majors can help students get a better understanding of levels of financial success of graduates with different majors and help them make a decision that best matches their dreams. It can also be used for those in specific majors to estimate their future wage and calculate their financial status."),
                              p(strong("Which college majors result in higher rates of employment and salary?"), "This data helps identify different patterns in growing and shrinking fields of study to be used to further predict the job market changes as well as assist students that have to choose a major by providing important information of employment and salary rates."),
                              p(strong("What are the relationships between gender and college majors?"), "This information is important since it helps data about gender inequality and distribution amongst the different majors easier to view and understand. This allows us to discover which majors are preferred by different genders and possibly carry on further research about why."),
                              p(strong("Which STEM majors and STEM fields need to increase their gender diversity?"), "Women have been historically underrepresented in many STEM majors, which is a significant issue due to the problems that may arise with a lack of women in the industry. By taking a closer look at specific STEM majors, we hope to discover which majors may be most susceptible to gender biases as a result of low shares of women."),
                              h2("The Dataset"),
                              p("Our dataset showcases information regarding various majors and their statistics for employment, graduation rates, and gender. From viewing this dataset, we can identify correlations between the data, and determine whether or not these factors have impacts on one another. Additionally, the dataset has a vast amount of information, which is useful for those who may be interested in finding a less popular major or specific, researched statistics regarding another specific major."),
                              h2("Findings"),
                              p(strong("What are the median wages of college graduates with different majors?")),
                              p("The median wages of college graduates with different majors can be found in the summary table of the list of majors. The ‘Median’ column indicates the median wages of the various majors, with the ‘Rank’ column ranking the majors from 1 through 173 total majors, based on the median salaries. The major-holders with the highest median salary were those with petroleum engineering degrees with $110,000 as the median. The major-holders with the lowest median salary were those with library sciences with $22,000 as their median salary. Most notably, we can see that there is a trend with STEM majors being comparatively higher on the ranks than non-STEM majors, as the first non-STEM major, court reporting, makes its appearance at rank 20."),
                              p(strong("Which college majors result in higher rates of employment and salary?"),
                              p("By looking at the major and unemployment rate scatter plot, we found out that those graduates with degrees that serve public health and STEM have higher rates of unemployment than those with art degrees. The top five college major categories with the highest employment rate were in agriculture and natural resources, education, health, biology and life science, and engineering, respectively. Agriculture and natural resources had close to a zero unemployment rate (0.04). This may be due to the fact that to produce agricultural goods and services, a degree is not required. The following major categories could be classified as high-demand jobs, therefore resulting in unemployment rates that fluctuate between 0.046 and 0.051. The college majors with the highest median salary can be interpreted to result in higher salaries, as analyzed above."),
                              p(strong("What are the relationships between gender and STEM college majors?")),
                              p("The most common major for women as discovered through the “Majors With Share and Unemployment” was Psychology, and the most common major for men was Business Management and Administration. Meanwhile, the least common major for women was Military Technologies, while the least common major for men was School Student Counseling. Lastly, the major with the highest share of women was Early Childhood Education (around 96.8%), which means this major also has the lowest share of men (around 3.2%). As expressed through these findings, we determined the industries that have the least gender diversity."),
                              p(strong("Which STEM majors and STEM fields need to increase their gender diversity?")),
                              p("From the relationship of the shares of women in STEM bar chart, we found that there is a high fluctuation of gender distribution, based on the college major category. The health major category was found to have the most women shares as almost 75% of the the majors in that category consisted of women. The biology and life science and physical science categories followed, with around 60% of women to be of women shares. Computer and mathematics and the physical sciences ultimately had the least amount of women shares, ranging from 10% to 50% overall. From this we can determine that the is a correlation between gender and the STEM college majors, as we see many of the logic-based STEM majors being dominated by men and those majors regarding health being dominated by more women."),
                              h3("Discussion"),
                              p("We know that much of our western society rewards those with higher education. However, we understand that the amount of time, money, and effort that goes into obtaining a degree can be a great burden, especially for those without a stable financial source to fund their education. Therefore we analyzed the median salaries of graduate students, in hopes of providing insight to those who may have a salary as a key interest in their reason for going through higher education. As we found that STEM majors have higher wages overall compared to non-STEM majors, that would suggest to those in pursuit of high salaries to consider investing in STEM degrees for their higher education. While our findings may discourage those who choose to invest in an arts degree, as they have a significantly lower median salary, hopefully, it acts as a useful consideration for those who do deem salary as an important factor. 
We are aware that historically, there has been a bias against women in the STEM field, which may be a deterrent for women who do choose to pursue a career in STEM. Studying and working in an environment that constantly reinforces stereotypes and biases against women, and being within an industry where the work of men has been systemically valued higher than the work of women can be very discouraging. However, as our findings show, there are areas within the STEM field that do have a more equal gender distribution than some others. Health, for example, has a majority of women in the distribution, making it a major category where women may consider it as a more equitable option than engineering. We believe that there are reasonings behind these statistics surrounding gender that will require additional research beyond the scope of our project. However, our findings allow us to find a pattern in specific majors and gender. While workplace environments cannot be categorized homogeneously, we believe that it is important to be aware of the overall gender distribution of each area because the mere recognition and acknowledgment of such biases being present can be a step further into achieving a more equitable industry."),
                              h3("Conclusion"),
                              p("These visualizations allowed us to learn the meaning behind a major. College is a critical part of the lives of many different individuals, and majors greatly affect this said college experience, as well as their lives post-graduation. It was our hope that this data would serve versatile purposes, allowing individuals to identify different types of majors, their unemployment rates, and statistics behind women in STEM majors. 

Unemployment is a quickly growing issue in today’s society, which changed even more due to recent layoffs at technology companies that arose in the middle of this project. While this means our data may have changed in these unforeseen circumstances, our analysis still holds relevance as a general overview of unemployment rates in certain major categories. As students continue to apply to college and later join the workforce, we consider the purposeful meaning of data visualizations like ours, and how they will impact students across the country. Students may more or less change their major in regards to unemployment rates, so this analysis of unemployment was a key topic of consideration for our project.

Additionally, the amount of women in STEM majors has also been a recent topic of discussion. History has shown groundbreaking impact from women in the STEM industry, and we must consider what bringing gender diversity to STEM fields will do. Diversity is a crucial stepping stone into bridging towards a more accessible and inclusive world in STEM industries, and we can only get this far by searching for a more equal gender balance. As an example, fields like engineering still must make drastic strides in order to work towards including diverse gender perspectives. If only men are in the room while making decisions and engineering products, then it is likely that the perspectives of men will primarily be considered in the final product, as the result of gender biases. 

Though this dataset is limited due to factors like recent industry changes and the sample size of the dataset, we believe it is an accurate depiction of what the college education system is currently like. We also want to encourage others to use this data for meaningful purposes in application to their own lives. For instance, those who carry influence have the power to reduce unemployment, and many women in STEM majors may realize the importance and impact they are making in their respective fields. Our impact as a group may be within the scope of this project, but the purpose driven behind it is substantial."),
                              h3("Sources of Data"),
                              p("Tunguz, Bojan. All-ages (Data set), 2020. https://www.kaggle.com/datasets/tunguz/college-majors?select=all-ages.csv"),
                              p("Tunguz, Bojan. Grad-students (Data set), 2020. https://www.kaggle.com/datasets/tunguz/college-majors?select=grad-students.csv"), 
                              p("Tunguz, Bojan. Majors-list (Data set), 2020.
https://www.kaggle.com/datasets/tunguz/college-majors?select=majors-list.csv"),
                              p("Tunguz, Bojan. Recent-grads (Data set), 2020.
https://www.kaggle.com/datasets/tunguz/college-majors?select=recent-grads.csv"),
                              p("Tunguz, Bojan. Women-stem (Data set), 2020.
https://www.kaggle.com/datasets/tunguz/college-majors?select=women-stem.csv"),
                              h3("Provenance"),
                              p("This data was collected in 2020 by Bojan Tunguz, a data scientist from Indiana. While there is little information regarding the purpose behind the collection of the dataset, Tunguz has compiled hundreds of datasets regarding a wide variety of topics and has an extremely high ranking with Kaggle, and one can infer that his purpose behind this data collection was pure interest regarding the topic at hand. Tunguz used the American County Survey 2010-2012 for statistics behind these majors.The data collection effort of the American County Survey of 2010-2012 was federally funded as the data was obtained from the U.S. Census. For Tunguz, they were able to collect the data through public sources as listed on the U.S. Census Bureau website. Those that have an interest in a specific major’s post-graduate employment rate would most likely benefit from this data. Financially, people who are researching for the purpose of finding which major would have the highest employment rate for their career would most likely benefit. The data was validated and held secure by its source of collection, which is the U.S. Census Bureau. The residents that complete the survey are required by law to accurately respond, while the U.S. Census Bureau is held by the law to keep the information confidential. As it is a government survey, it is held as a credible source as it should be an accurate reflection of the state of residents of the United States. However, due to the census data being self-reported, there may be response bias present in the data. Through Kaggle, a platform that allows for the publishing and sharing of datasets, we searched for datasets regarding college majors as our key interest. Through there, we found this dataset and found the contents of it interesting as it specifically included the statistics of women in STEM. As all three of us are women in STEM, we decided to choose this dataset because of its relevance to our personal career goals and aspirations. We do credit the source of the data, Bojan Tunguz, by the citations done above."),
                              h3("Acknowledgements"),
                              p("Thank you to our TA for helping out with these assignments :) We truly appreciate you so much,", strong("Annie!")),
                              h3("References"),
                              p("Ben Casselman. “The Economic Guide to Picking a College Major.” FiveThirtyEight, FiveThirtyEight, 12 Sept. 2014, https://fivethirtyeight.com/features/the-economic-guide-to-picking-a-college-major/."),
                              p("“The Labor Market for Recent College Graduates.” Federal Reserve Bank of New York, 2021, https://www.newyorkfed.org/research/college-labor-market/college-labor-market_wages.html"),
                              p("“State of Girls and Women in Stem.” National Girls Collaborative Project, 28 February 2022, https://ngcproject.org/resources/state-girls-and-women-stem.")))



# SUMMARY
summary_tab <- tabPanel(
  "Summary",
  titlePanel("Summary Takeaways"),
  fluidPage(
    h2("Majors and Unemployment"),
    p("Rates of employment after graduation matter much to incoming students who seek a secure path to their jobs after college. With our dataset, all ages, we have found that certain major categories do have much higher rates of employment after graduation, the top three being health, education and agriculture & natural resources. 
    With significantly less unemployment rates after graduation compared to 13 other major categories explored within the dataset, these majors hold stronger promises to future jobs. On the other side, majors such as arts, humanities, psychology & social works have shown greater rates of unemployment after graduation."),
    h2("Major categories"),
    p("The number of majors within major categories also vary,and with our dataset, we have found that the engineering category has the greatest number of majors, of 26 engineering majors within the proven data set majors_list. Our data also showed that the correlation rates between unemployment rate and shares of women are pretty low and that they don't have much relations to each other."),
    h2("Majors and Gender"),
    p("Gender diversity within various majors was also a topic we investigated with our data visualization, and we have come to the conclusion that engineering is the STEM major category with the lowest share of women, while health has the highest share of women.
    The top three majors with the LOWEST share of women are mechanical engineering related technologies (around 7.8%), mining and mechanical engineering (around 10.1%) and naval architecture and marine engineering (around 10.7%). the top three majors with the HIGHEST share of women are communication disorders sciences and services 
    (around 96.7%), medical assisting services (around 92.3%), and nursing (around 89.7%) Thus out data visualizations have shown that engineering is the STEM major field that most needs to increase its gender diversity!"),
  ))

# MAKE SURE ONCE YOURE DONE WITH YOUR TAB TO INCLUDE IT IN THE NAV BAR PAGE

ui <- navbarPage("College Majors",
                 tags$head(
                   tags$style(HTML("
      @import url('https://fonts.googleapis.com/css2?family=Bebas+Neue&display=swap');
body {
  background-color: lavender;
  color: black;
}
h1 {
  font-family: 'Bebas Neue', sans-serif;
  color: indigo;
}
h2 {
  font-family: 'Bebas Neue', sans-serif;
  color: indigo;
}
h3 {
  font-family: 'Bebas Neue', sans-serif;
  color: indigo;
}
h4 {
  font-family: 'Bebas Neue', sans-serif;
  color: indigo;
}
/* Make text visible on inputs */
.shiny-input-container {
  color: #474747;
}
.navbar { 
  background-color: #fff0f5 !important;
  font-family: 'Bebas Neue', sans-serif;
  font-size: 20px;
  font-color: #474747;
}
"))), 
                 intro_panel, 
                 all_ages_panel, women_stem_panel,
                 majors_list_tab_panel,
                 summary_tab,
                 full_report_panel)
