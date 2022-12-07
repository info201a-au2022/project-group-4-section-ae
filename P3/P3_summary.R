#Summary
library(shiny)

summary_tab <- tabPanel(
  "Summary",
  titlePanel("Summary Takeaways"),
  h2("Majors and Unemployment"),
  p("Rates of employment after graduation matter much to incoming students who seeks a secure path to their jobs after college. With our dataset, all ages, we have found that certain major catagories do have much higher rates of employment after graduation, the top three being engineering, education and agriculture & natural resource. 
    With significantly less unemployment rates after graudation compared to 13 other major catagories explored within the dataset, these majors hold stronger promises to future jobs. On the other side, majors such as arts, humanities, psychology & social works have shown greater rates of unemployments after graduation."),
  h2("Major catagories"),
  p("There are alot of majors within the eigineering catagory, of 26 engineering majors within the proven data set majors_list"),
  h2("Majors and Gender"),
  p("Gender diversity within various majors were also topic we investigated with our data visualization, and have come to the conlcusion that engineering is the STEM major category with the lowest share of women, while health has the highest share of women.
    The top three majors with the LOWEST share of women are mechanical engineering related technologies (around 7.8%), mining and mechanical engineering (around 10.1%) and naval architecture and marine engineering (around 10.7%). the top three majors with the HIGHEST share of women are communication disorders sciences and services (around 96.7%), medical assisting services (around 92.3%), and nursing (around 89.7%) Thus out data visualizations have shown that engineering is the STEM major field that most needs to increase its gender diversity!"),
)