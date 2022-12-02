library(tidyverse)
library(ggplot2)
<<<<<<< HEAD
all_ages <- read.csv("https://raw.githubusercontent.com/info201a-au2022/project-group-4-section-ae/main/data/women-stem.csv")
all_ages_plot <- ggplot(all_ages, aes(y = Major_category, x = Unemployment_rate))+ ggtitle("Major and Unemployment Rate") + labs(x = "unemployment rate" , y = "major catagories")+ geom_point()+ labs(caption = "This chart demonstrates which catagories of college majors have the greatest and least rates of Unemployment. We wanted to create a data visualization that makes it easy for students see which catagories of majors tend to garentee higher rates of employment, so that they are better informed. Our observations made us realize that major catagories such as Art, Psychology & Social work and Humanities & Librtsl Arts have the greatest unemployment rates.")
=======
all_ages <- read.csv("https://raw.githubusercontent.com/info201a-au2022/project-group-4-section-ae/main/data/all-ages.csv")
all_ages_plot <- ggplot(all_ages, aes(y = Major_category, x = Unemployment_rate)) + 
  ggtitle("Major and Unemployment Rate") + 
  labs(x = "Unemployment Rate" , y = "Major Catagories") + 
  geom_violin() + 
  labs(caption = "This chart demonstrates which catagories of college majors 
       have the greatest and least rates of Unemployment. We wanted to create a 
       data visualization that makes it easy for students to see which
       catagories of majors tend to guarentee higher rates of employment, 
       so that they are better informed. Our observations made us realize 
       that major catagories such as Art, Psychology & Social Work,
       and Humanities & Liberal Arts have the greatest unemployment rates.") +
  theme(plot.caption.position = "plot",
        plot.caption = element_text(hjust = 0))
>>>>>>> 4f49ff33c27898d108ca8aaf2a452fdec6175b92
all_ages_plot
