library(tidyverse)
women_stem <- read.csv("https://github.com/info201a-au2022/project-group-4-section-ae/blob/8573566c92aa11d95d23ac5cbae8255540626149/data/women-stem.csv")
data_table <- women_stem %>% 
  group_by(Major_category)

data_table <- aggregate(data_table$Women, by = list(data_table$Major_category), FUN = mean)
colnames(data_table)[1] <- "Major Catagories"
colnames(data_table)[2] <- "Total Number of Women"
