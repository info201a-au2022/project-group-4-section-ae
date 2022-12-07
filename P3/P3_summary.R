#Summary
library(shiny)

summary_tab <- tabPanel(
  "Summary",
  titlePanel("Summary Takeaways"),
  fluidPage(
    tags$img(src = "https://www.google.com/url?sa=i&url=https%3A%2F%2Fnrf.com%2Fresearch-insights%2Fholiday-and-seasonal-trends%2Fgraduation&psig=AOvVaw2bkooGeYpYrGBLeu4bIv9S&ust=1670474711917000&source=images&cd=vfe&ved=0CA8QjRxqFwoTCKjwwLjZ5vsCFQAAAAAdAAAAABAD")
  ),
  h2("Majors and Unemployment"),
  p("Rates of employment after graduation matter much to incoming students who seek a secure path to their jobs after college. With our dataset, all ages, we have found that certain major categories do have much higher rates of employment after graduation, the top three being health, education and agriculture & natural resources. 
    With significantly less unemployment rates after graduation compared to 13 other major categories explored within the dataset, these majors hold stronger promises to future jobs. On the other side, majors such as arts, humanities, psychology & social works have shown greater rates of unemployment after graduation."),
  h2("Major categories"),
  p("The number of majors within major categories also vary,and with our dataset, we have found that the engineering category has the greatest number of majors, of 26 engineering majors within the proven data set majors_list. This can show that"),
  h2("Majors and Gender"),
  p("Gender diversity within various majors was also a topic we investigated with our data visualization, and we have come to the conclusion that engineering is the STEM major category with the lowest share of women, while health has the highest share of women.
    The top three majors with the LOWEST share of women are mechanical engineering related technologies (around 7.8%), mining and mechanical engineering (around 10.1%) and naval architecture and marine engineering (around 10.7%). the top three majors with the HIGHEST share of women are communication disorders sciences and services 
    (around 96.7%), medical assisting services (around 92.3%), and nursing (around 89.7%) Thus out data visualizations have shown that engineering is the STEM major field that most needs to increase its gender diversity!"),
)
