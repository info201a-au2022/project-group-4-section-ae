library(ggplot2)
library(dplyr)

majors_list <- read.csv("https://raw.githubusercontent.com/info201a-au2022/project-group-4-section-ae/main/data/majors-list.csv")

majors_list <- majors_list[-c(146), ]

majors_list_plot <- ggplot(majors_list) + 
  ggtitle("Collection of Majors and Major Categories") +
  geom_count(mapping = aes(x = Major_Category, y = Major)) +
  labs(x = "Categories of Majors", y = "Various Majors") +
  labs(caption = "This dot plot was included to show the different college 
       majors that are available, as well as the popularity of the major 
       distributions within the major categories. From our observations, 
       out of all 174 majors collected, the 'Engineering' category contained 
       the most majors with 26 total majors, and the 'Interdisciplinary' 
       category contained the least majors with 1 major overall.") +
  theme(plot.caption.position = "plot",
        plot.caption = element_text(hjust = 0))

majors_list_plot 
