library(tidyverse)
library(ggplot2)
all_ages <- read.csv("https://raw.githubusercontent.com/info201a-au2022/project-group-4-section-ae/main/data/women-stem.csv")
all_ages_plot <- ggplot(all_ages, aes(y = Major_category, x = Unemployment_rate))+ ggtitle("Major and Unemployment Rate") + labs(x = "unemployment rate" , y = "major catagories")+ geom_point()+ labs(caption = "This chart demonstrates which catagories of college majors have the greatest and least rates of Unemployment. We wanted to create a data visualization that makes it easy for students see which catagories of majors tend to garentee higher rates of employment, so that they are better informed. Our observations made us realize that major catagories such as Art, Psychology & Social work and Humanities & Librtsl Arts have the greatest unemployment rates.")
all_ages_plot
